//
//  Data.swift
//  Get Films
//
//  Created by Aamer Essa on 06/12/2022.
//

import Foundation

struct People: Codable {

    var results :[Person]
}

struct Person: Codable{
    
    var name: String
    var height:String
    var mass: String
    var hair_color : String
    var skin_color : String
    var eye_color: String
    var birth_year: String
    var gender: String
    var homeworld: String
    var films: [String]
    var species: [String]
    var vehicles: [String]
    var starships: [String]
}

struct Films: Codable {
    var results :[Film]
}

struct Film: Codable {
    var title : String
    var episode_id : Int
    var opening_crawl : String
    var director : String
    var producer : String 
    
}
