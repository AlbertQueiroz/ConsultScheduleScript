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

let arguments = CommandLine.arguments
var date: String? = nil

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

