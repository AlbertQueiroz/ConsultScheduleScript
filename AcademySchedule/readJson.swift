//
//  readJson.swift
//  AcademySchedule
//
//  Created by Albert Rayneer on 13/03/20.
//  Copyright © 2020 Albert Rayneer. All rights reserved.
//
//print("oi")

import Foundation
//Estruturas para manipular os objetos do cronograma
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

//Ler o json
func readJson() -> Schedule? {
    
    let currentDirectory = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
    //atribuindo o bundle criado manualmente ao bundleURL
    let bundleURL = URL(fileURLWithPath: "AppResources.bundle", relativeTo: currentDirectory)
    let bundle = Bundle(url: bundleURL)
    //desempacotando o json
    guard let jsonFile = bundle?.url(forResource: "schedule", withExtension: "json"),
        //transformando em dado
        let data = try? Data(contentsOf: jsonFile) else { return nil }
//        let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) else { return nil }
    if let scheduleData = decodingJson(data: data) {
        return scheduleData
    } else {
        print("Não foi possível ler o arquivo JSON")
        return nil
    }
}

//decodificando o json de dado para objeto
func decodingJson(data: Data?) -> Schedule?{
    let jsonData = data
    let decoder = JSONDecoder()
    
    guard let data = jsonData else { return nil }
    let schedule = try! decoder.decode(Schedule.self, from: data)
    return schedule
}
