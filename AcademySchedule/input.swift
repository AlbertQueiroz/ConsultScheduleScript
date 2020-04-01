//
//  input.swift
//  AcademySchedule
//
//  Created by Albert Rayneer on 30/03/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//


import Foundation

//Recebe a data inserida pelo usuario
func inputDate() -> String?{
    print("Insira a data para consultar o calendario (DD/MM): ")
    if let inputDate = readLine() {
        return inputDate
    }
    return nil
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
    //retira a / e separa a string em um array
    let splitedDate = date.split{$0 == "/"}

    let day: String = String(splitedDate[0])
    var month: String = String(splitedDate[1])
    let intMonth = Int(month)
    var nextMonthNumber = String(intMonth! + 1)
    //transforma a entrada no nome do mês
    month = convertMonth(month: month)!
    let nextMonth: String = convertMonth(month: nextMonthNumber) ?? ""
    
    let dateDict = ["day": day, "month": month, "nextMonth": nextMonth]

    return dateDict
}

//Converte o mês de numero para string
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
