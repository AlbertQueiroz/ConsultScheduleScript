//
//  menu.swift
//  AcademySchedule
//
//  Created by Cecilia Soares on 31/03/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//
//print("oi")

import Foundation


let schedule = readJson()

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
            let foundDate = readDate(date: currentDate())
            showResult(date: foundDate)
        case "2":
            print("duracao challenge")
            
        case "3":
            //pesquisa de acordo com a entrada do usuário
            let input = inputDate()
            let foundDate = readDate(date: input)
            showResult(date: foundDate)
        case "4":
            print("Eventos do mês")
            
        default:
            menu()
            
        }
    }
}
