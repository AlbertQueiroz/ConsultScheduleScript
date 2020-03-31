//
//  search.swift
//  AcademySchedule
//
//  Created by Albert Rayneer on 26/03/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import Foundation


//MARK: Dividir Funções
func searchDate(_ date: [String:String]?,_ schedule: Schedule?) -> String{
    
    guard let date = date else { return "Data inválida" }
    guard let schedule = schedule else { return "Calendário Inválido" }
    
    guard let stringDay = date["day"] else { return "Dia inválido"}
    guard let month = date["month"] else { return "Mês inválido"}
    let nextMonth = date["nextMonth"] ?? ""
    let day = Int(stringDay)
    //filtrar do json o mês inserido e o mês seguinte
    let foundMonths = schedule.months.filter { $0.name == month || $0.name == nextMonth }
    var foundEvent: String = ""
    
    var firstDay: Int = 0
    var lastDay: Int = 0
    
    
    
    var foundNextMonth: Bool = false
    
    for event in foundMonths[0].events{
        //Filtra se no dia digitado há evento
        if ( event.eventDays.filter { $0 == day } != [] ) {
            let endIndex = event.eventDays.count - 1
            firstDay = event.eventDays[0]
            lastDay = event.eventDays[endIndex]
            foundEvent = event.eventName
        } else {
            return "Nenhum evento encontrado nessa data"
        }
    }
    //Verifica se há continuação do evento no mês seguinte
    for event in foundMonths[1].events {
        if event.eventName == foundEvent {
            let endIndex = event.eventDays.count - 1
            //Atribui o ultimo dia do evento do mês seguinte
            lastDay = event.eventDays[endIndex]
            foundNextMonth = true
        }
    }
    //Verifica se houve evento no mês seguinte ou não
    let next = foundNextMonth ? nextMonth : month
    
    return ("Ocorrerá: \(foundEvent) que começa no dia \(firstDay) de \(month) e termina no dia \(lastDay) de \(next)")
    
}
