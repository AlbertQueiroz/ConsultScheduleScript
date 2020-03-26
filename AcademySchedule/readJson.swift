//
//  readJson.swift
//  AcademySchedule
//
//  Created by Albert Rayneer on 13/03/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//

import Foundation

struct Schedule: Codable {
    let months: [Month]
}

struct Month: Codable {
    let name: String
    let events: [Event]
}

struct Event: Codable {
    let eventName: String
    let eventDays: [Int]
}


func readJson() -> Data? {
    
    let currentDirectory = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
    let bundleURL = URL(fileURLWithPath: "AppResources.bundle", relativeTo: currentDirectory)
    let bundle = Bundle(url: bundleURL)
    
    guard let jsonFile = bundle?.url(forResource: "schedule", withExtension: "json"),
        let data = try? Data(contentsOf: jsonFile) else { return nil }
//        let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) else { return nil }
    return data
}


func decodingJson() -> Schedule?{
    let jsonData = readJson()
    let decoder = JSONDecoder()
    
    guard let data = jsonData else { return nil }
    let schedule = try! decoder.decode(Schedule.self, from: data)
    return schedule
}
