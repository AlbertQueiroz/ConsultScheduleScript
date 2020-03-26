#!/usr/bin/swift

//
//  main.swift
//  AcademySchedule
//
//  Created by Albert Rayneer on 12/03/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import Foundation

let arguments = CommandLine.arguments

var schedule = decodingJson()

let date = inputDate()

let result = searchDate(date, schedule)

print(result)
talk(this: result)
