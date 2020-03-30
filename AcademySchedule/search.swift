//
//  search.swift
//  AcademySchedule
//
//  Created by Albert Rayneer on 26/03/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import Foundation

func searchDate(_ date: [String:String]?,_ schedule: Schedule?) -> String{
    
    guard let date = date else { return "Data inválida" }
    guard let schedule = schedule else { return "Calendário Inválido" }
    
    guard let stringDay = date["day"] else { return "Dia inválido"}
    guard let month = date["month"] else { return "Mês inválido"}
    let day = Int(stringDay)

    let foundMonth = schedule.months.filter { $0.name == month }[0]
    
    for event in foundMonth.events{
        if (event.eventDays.filter { $0 == day } != []) {
            let endIndex = event.eventDays.count-1
            return ("Ocorrerá: \(event.eventName) que começa no dia \(event.eventDays[0]) de \(month) e termina no dia \(event.eventDays[endIndex]) de \(month)")
        }
    }

    return "Nenhum evento encontrado nessa data"
}


