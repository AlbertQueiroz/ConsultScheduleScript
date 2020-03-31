//
//  talk.swift
//  AcademySchedule
//
//  Created by Albert Rayneer on 26/03/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//
//print("oi")

import Foundation

func talk(this string: String, voice: String = "Luciana") {

    let task = Process()
    task.launchPath = "/usr/bin/say"
    task.arguments = [string, "-v", voice]

    task.launch()
    task.waitUntilExit()
    
}


func showResult(date: [String:String]?) {
    
    do{
        let result = try searchDate(date, schedule)
        let stringResult = "Ocorrerá \(result["event"]!) que irá durar \(result["eventDuration"]!) dias, começando no dia \(result["firstDay"]!) de \(result["month"]!) e terminando no dia \(result["lastDay"]!) de \(result["nextMonth"]!)"
        print(stringResult)
        talk(this: stringResult)
    } catch {
      print(error)
    }
    
}
