//
//  talk.swift
//  AcademySchedule
//
//  Created by Albert Rayneer on 26/03/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//


import Foundation

func talk(this string: String, voice: String = "Luciana") {

    let task = Process()
    task.launchPath = "/usr/bin/say"
    task.arguments = [string, "-v", voice]

    task.launch()
    task.waitUntilExit()
    
}


