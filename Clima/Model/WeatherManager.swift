//
//  WeatherManager.swift
//  Clima
//
//  Created by yusheng Lu on 2022/9/20.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=46879070762f76cddb7b167292799b80&units=metric"
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
    }
}
