//
//  search.swift
//  AcademySchedule
//
//  Created by Albert Rayneer on 26/03/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import Foundation

func inputDate() -> [String:String]?{
    var date: String? = nil
    if arguments.count > 1 {
        date = arguments[1]
    } else {
        print("Insira a data para consultar o calendario (DD/MM): ")
        if let inputDate = readLine() {
            date = inputDate
        }
    }
    return readDate(date: date)
}

func readDate(date: String?) -> [String:String]? {

    guard let date = date else {return nil}
    
    let splitedDate = date.split{$0 == "/"}

    let day: String = String(splitedDate[0])
    var month: String = String(splitedDate[1])

    switch month {
        case "02": month = "fevereiro"
        case "03": month = "março"
        case "04": month = "abril"
        case "05": month = "maio"
        case "06": month = "junho"
        default: return nil
    }
    
    let dateDict = ["day": day, "month": month]

    return dateDict
}


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


