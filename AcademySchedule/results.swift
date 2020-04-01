//
//  results.swift
//  AcademySchedule
//
//  Created by Albert Rayneer on 31/03/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import Foundation

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

func monthEvents() {
    let calendar = Calendar.current
    let currentMonth = String(calendar.component(.month, from: Date()))
    print(currentMonth)
}
