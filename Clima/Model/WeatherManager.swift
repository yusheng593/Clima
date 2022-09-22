//
//  WeatherManager.swift
//  Clima
//
//  Created by yusheng Lu on 2022/9/20.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    
    var delegate: WeatherManagerDelegate?
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=46879070762f76cddb7b167292799b80&units=metric"
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        delegate?.didUpdateWeather(weather)
                    } else {
                        print("weather parseJSON error")
                        return
                    }
                    
                    
                }
            }
            //4. Start the task
            task.resume()
        }
        
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(WeatherData.self, from: weatherData)
            if let id = decodeData.weather?[0].id, let temp = decodeData.main?.temp, let name = decodeData.name{
                let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
                return weather
                
            } else {
                print("decodeData error")
                return nil
            }
            
        } catch  {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
    
}
