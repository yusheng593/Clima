//
//  WeatherData.swift
//  Clima
//
//  Created by Samuel_Lu on 2022/9/21.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let name: String?
    let weather: [Weather]?
    let main: Main?
    
    struct Weather: Codable {
        let description: String?
        let id: Int?
    }
    
    struct Main: Codable {
        let temp: Double?
    }
}
