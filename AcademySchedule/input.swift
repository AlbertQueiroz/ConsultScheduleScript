//
//  input.swift
//  AcademySchedule
//
//  Created by Albert Rayneer on 30/03/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//


import Foundation

func inputDate() -> String?{
    //opção de dar entrada da data pelo terminal
    let arguments = CommandLine.arguments
    var date: String? = nil
    if arguments.count > 1 {
        date = arguments[1]
    } else {
        print("Insira a data para consultar o calendario (DD/MM): ")
        if let inputDate = readLine() {
            date = inputDate
        }
    }
    return date
}

func currentDate() -> String {
    let calendar = Calendar.current
    //separa o dia de acordo com o calendario atual e transforma em string
    let currentDay = String(calendar.component(.day, from: Date()))
    let currentMonth = String(calendar.component(.month, from: Date()))
    
    let date = "\(currentDay)/\(currentMonth)"
    return date
}

func readDate(date: String?) -> [String:String]? {

    guard let date = date else {return nil}
    //retira a /  e separa a string em um array
    let splitedDate = date.split{$0 == "/"}

    let day: String = String(splitedDate[0])
    var month: String = String(splitedDate[1])
    let intMonth = Int(month)
    var nextMonth = String(intMonth! + 1)
    //transforma a entrada no mês
    month = convertMonth(month: month)!
    nextMonth = convertMonth(month: nextMonth)!
    
    let dateDict = ["day": day, "month": month, "nextMonth": nextMonth]

    return dateDict
}

func convertMonth(month: String) -> String? {
    switch Int(month) {
    case 2: return  "fevereiro"
    case 3: return  "março"
    case 4: return  "abril"
    case 5: return  "maio"
    case 6: return "junho"
    default: return nil
    }
}
