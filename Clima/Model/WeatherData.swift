//
//  WeatherData.swift
//  Clima
//
//  Created by Samuel_Lu on 2022/9/21.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let name: String?
    let weather: [Weather]?
    let main: Main?
    
    struct Weather: Decodable {
        let description: String?
        let id: Int?
    }
    
    struct Main: Decodable {
        let temp: Double?
    }
}
