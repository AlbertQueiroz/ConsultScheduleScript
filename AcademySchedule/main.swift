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
    sleep(2)
}
