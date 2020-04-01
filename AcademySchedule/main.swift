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

while(running){
    menu()
    sleep(5)
}


//let input = inputDate()
//
//let foundDate = readDate(date: input)
//
//let result = searchDate(foundDate, schedule)
//print(result)
//talk(this: result)
