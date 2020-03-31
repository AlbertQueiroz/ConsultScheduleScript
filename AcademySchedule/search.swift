//
//  search.swift
//  AcademySchedule
//
//  Created by Albert Rayneer on 26/03/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//
//print("oi")

import Foundation

enum SearchError: Error {
    case InvalidDate
    case InvalidSchedule
    case InvalidDay
    case InvalidMonth
    case NoEventFound
}


//MARK: Dividir Funções
func searchDate(_ date: [String:String]?,_ schedule: Schedule?) throws -> [Any] {
    
    guard let date = date else { throw SearchError.InvalidDate }
    guard let schedule = schedule else { throw SearchError.InvalidSchedule }
    
    guard let stringDay = date["day"] else { throw SearchError.InvalidDay }
    guard let month = date["month"] else { throw SearchError.InvalidMonth }
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
            throw SearchError.NoEventFound
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
    //Salva a duração do evento
    let duration = lastDay - firstDay
    
    return [foundEvent, firstDay, month, lastDay, next, duration]
    
}
