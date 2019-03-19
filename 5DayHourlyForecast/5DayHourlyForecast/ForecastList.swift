//
//  ForecastList.swift
//  5DayHourlyForecast
//
//  Created by Aaron on 1/31/19.
//  Copyright © 2019 Aaron. All rights reserved.
//

import UIKit

// struct for the forecast list, containing a list, the city, and extra data
// some values are not optional; optional appears in the view if they are so
struct ForecastList: Codable {
    
    let list: [List]
    let city: City?
    let cod: String?
    let message: Double?
    let count: Int?
    
    // coding keys for the ForecastList
    private enum CodingKeys: String, CodingKey {
        
        case list
        case city
        case cod
        case message
        case count = "cnt"
    }
}

// struct for the list, containing a date, main, and multiple weather structs
// some values are not optional; optional appears in the view if they are so
struct List: Codable {
    
    let date: Date
    let main: Main
    let weather: [Weather]?
    let clouds: Clouds?
    let wind: Wind?
    let system: Sys?
    let dateText: String
    
    // coding keys for the list
    private enum CodingKeys: String, CodingKey {
        
        case date = "dt"
        case main
        case weather
        case clouds
        case wind
        case system = "sys"
        case dateText = "dt_txt"
    }
}

// struct for the main, contains temperatures, pressure, levels, etc
// some values are not optional; optional appears in the view if they are so
struct Main: Codable {
    
    let temp: Double?
    let tempMin: Double
    let tempMax: Double
    let pressure: Double?
    let seaLevel: Double?
    let groundLevel: Double?
    let humidity: Int?
    let tempKF: Double?
    
    // coding keys for the main
    private enum CodingKeys: String, CodingKey {
        
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case groundLevel = "grnd_level"
        case humidity
        case tempKF = "temp_kf"
    }
}

// struct for weather, contains id, main, description
struct Weather: Codable {
    
    let id: Int?
    let main: String?
    let description: String?
    let icon: String?
    
    // coding keys for the weather
    private enum CodingKeys: String, CodingKey {
        
        case id
        case main
        case description
        case icon
    }
}

// struct for clouds
struct Clouds: Codable {
    
    let all: Int?
    
    // coding key for clouds
    private enum CodingKeys: String, CodingKey {
        
        case all
    }
}

// struct for wind
struct Wind: Codable {
    
    let speed: Double?
    let deg: Double?
    
    // coding keys for wind
    private enum CodingKeys: String, CodingKey {
        
        case speed
        case deg
    }
}

// struct for sys
struct Sys: Codable {
    
    let pod: String?
    
    // coding key for sys
    private enum CodingKeys: String, CodingKey {
        
        case pod
    }
}

// struct for city, contains id, name, country, population, and coordinates
struct City: Codable {

    let id: Double?
    let name: String?
    let coordinates: Coord?
    let country: String?
    let population: Double?

    // coding keys for city
    private enum CodingKeys: String, CodingKey {

        case id
        case name
        case coordinates = "coord"
        case country
        case population
    }
}

// struct for coordinates, lattitude and longitude
struct Coord: Codable {

    let lat: Double?
    let lon: Double?

    // coding keys for coordinates
    private enum CodingKeys: String, CodingKey {

        case lat
        case lon
    }
}
