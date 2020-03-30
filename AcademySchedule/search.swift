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

    let foundMonths = schedule.months.filter { $0.name == month || $0.name == nextMonth }
    var foundEvent: String = ""
    
    var firstDay: Int = 0
    var lastDay: Int = 0
    
    
    
    var foundNextMonth: Bool = false

    for event in foundMonths[0].events{
        if ( event.eventDays.filter { $0 == day } != [] ) {
            let endIndex = event.eventDays.count - 1
            firstDay = event.eventDays[0]
            lastDay = event.eventDays[endIndex]
            foundEvent = event.eventName
        } else {
            return "Nenhum evento encontrado nessa data"
        }
    }
    
    for event in foundMonths[1].events {
        if event.eventName == foundEvent {
            let endIndex = event.eventDays.count - 1
            lastDay = event.eventDays[endIndex]
            foundNextMonth = true
        }
    }
    
    let next = foundNextMonth ? nextMonth : month
    
    return ("Ocorrerá: \(foundEvent) que começa no dia \(firstDay) de \(month) e termina no dia \(lastDay) de \(next)")
    
}
