//
//  menu.swift
//  AcademySchedule
//
//  Created by Cecilia Soares on 31/03/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//
//print("oi")

import Foundation


func todayDate() -> String {
    //formata a data
    let format = DateFormatter()
    format.dateFormat = "MMM dd,yyy"
    let date = format.string(from: Date())
    return date
}
func menu(){
    print ("Bem vindo! Hoje é: \(todayDate()) \n Selecione a opção desejada: \n 1 - Ver programacao Academy do dia \n 2 - Ver duracao do evento atual \n 3 - Pesquisar por uma data específica \n 4 - Mostrar lista de eventos do mês \n 0 - Sair")
    
    if let choice = readLine(){
        //escolhas do menu
        switch choice{
        case "0":
            print("Saindo")
            running = false
        case "1":
            let calendar = Calendar.current
            //separa o dia de acordo com o calendario atual e transforma em string
            var atualDay = String(calendar.component(.day, from: Date()))
        //arranjar uma forma inteligente de adicionar o 0
            atualDay.count == 1 ? atualDay = "0\(atualDay)": nil
            var atualMonth = String(calendar.component(.month, from: Date()))
            atualMonth.count == 1 ? atualMonth = "0\(atualMonth)": nil
        //arranjar uma forma inteligente de fazer isso
            let foundDate = readDate(date: "\(atualDay)/\(atualMonth)" )
            let result = searchDate(foundDate, schedule)
            print(result)
            talk(this: result)
        case "2":
            print("duracao challenge")
        case "3":
            //pesquisa de acordo com a entrada do usuário
            let input = inputDate()
            let foundDate = readDate(date: input)
            let result = searchDate(foundDate, schedule)
            print(result)
            talk(this: result)
        case "4":
            print("Admin")
        default:
            menu()
            
        }
    }
}
