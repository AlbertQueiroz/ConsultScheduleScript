#!/usr/bin/swift

//
//  main.swift
//  AcademySchedule
//
//  Created by Albert Rayneer on 12/03/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import Foundation

var running = true

print("Bem vindo! Hoje é: \(todayDate())")

//Recebe os argumentos na chamada do executavel
let arguments = CommandLine.arguments
var date: String? = nil

//Verifica se foram passados os argumentos, senão, segue para a execução do menu
if arguments.count > 1 {
    let inputDate = arguments[1]
    let date = readDate(date: inputDate)
    showResult(date: date)
} else {
    
    while(running){
        menu()
        sleep(2)
    }
}

