//
//  input.swift
//  AcademySchedule
//
//  Created by Albert Rayneer on 30/03/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//
//print("oi")

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

func readDate(date: String?) -> [String:String]? {

    guard let date = date else {return nil}
    //retira a /  e separa a string em um array
    let splitedDate = date.split{$0 == "/"}

    let day: String = String(splitedDate[0])
    var month: String = String(splitedDate[1])
    var nextMonth: String
    //transforma a entrada no mês
    switch month {
    case "02": month = "fevereiro"; nextMonth = "março"
    case "03": month = "março"; nextMonth = "abril"
    case "04": month = "abril"; nextMonth = "maio"
    case "05": month = "maio"; nextMonth = "junho"
    case "06": month = "junho"; nextMonth = ""
        default: return nil
    }
    
    let dateDict = ["day": day, "month": month, "nextMonth": nextMonth]

    return dateDict
}
