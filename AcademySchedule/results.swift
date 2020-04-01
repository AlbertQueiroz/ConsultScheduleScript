//
//  results.swift
//  AcademySchedule
//
//  Created by Albert Rayneer on 31/03/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import Foundation

let schedule = readJson()

func showResult(date: [String:String]?) {
    
    
    do{
        let result = try searchDate(date, schedule)
        if let event = result["event"], let duration = result["eventDuration"], let firstDay = result["firstDay"], let month = result["month"], let lastDay = result["lastDay"], let nextMonth = result["nextMonth"] {
            let stringResult = "Ocorrerá \(event) que irá durar \(duration) dias, começando no dia \(firstDay) de \(month) e terminando no dia \(lastDay) de \(nextMonth)"
            print(stringResult)
            talk(this: stringResult)
        } else {
            talk(this: "Não foi possível encontrar um evento nessa data")
        }
        
    } catch SearchError.InvalidDate{
        talk(this: "Data inválida")
    } catch SearchError.InvalidDay {
        talk(this: "Dia Inválido")
    } catch SearchError.InvalidMonth {
        talk(this: "Mês Inválido")
    } catch SearchError.InvalidSchedule {
        talk(this: "Calendário Inválido")
    } catch SearchError.NoEventFound {
        talk(this: "Nenhuma evento encontrado nessa data")
    } catch {
        print("Erro inexperado: \(error)")
    }
    
}
//pega o mês atual de acordo com o calendário e lista os eventos do mês
func monthEvents() throws {
    let calendar = Calendar.current
    let currentMonth = String(calendar.component(.month, from: Date()))
    let monthName = convertMonth(month: currentMonth)
    
    guard let month = (schedule?.months.filter { $0.name == monthName }[0]) else { throw SearchError.InvalidMonth }
    
    talk(this: "O que ocorrerá nesse mês")
    for event in month.events{
        print(event.eventName)
    }
    
}
