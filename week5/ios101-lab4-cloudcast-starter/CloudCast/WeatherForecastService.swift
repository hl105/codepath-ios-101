//
//  WeatherForecastService.swift
//  CloudCast
//
//  Created by Hoonsun Lee on 3/24/25.
//

import Foundation

class WeatherForecastService {
    static func fetchForecast(latitude: Double, longitude: Double, completion: ((CurrentWeatherForecast) -> Void)? = nil){
        
        let parameters = "latitude=\(latitude)&longitude=\(longitude)&current_weather=true&temperature_unit=fahrenheit&timezone=auto&windspeed_unit=mph"
        
        let url = URL(string: "https://api.open-meteo.com/v1/forecast?\(parameters)")!
        // create data task and pass in url
        
        let task = URLSession.shared.dataTask(with: url){ data, response, error in

            // this closure is fired when response is received
//            guard error == nil else {
//                assertionFailure("Error \(error!.localizedDescription)")
//                return
//            }
//            guard let httpResponse = response as? HTTPURLResponse else {
//                assertionFailure("Invalid response")
//                return
//            }
//            
            // at this point, data contains data from response
            
            
            // WE CAN INSTEAD USE THE DECODABLE PROTOCOL
            let decoder = JSONDecoder()
            let response = try! decoder.decode(WeatherAPIResponse.self, from: data!)
            DispatchQueue.main.async {
                completion?(response.currentWeather)
            }
        }
        task.resume() // resume task and fire request
        
    }
    
//    private static func parse(data: Data) -> CurrentWeatherForecast {
        //transform data we received into a dictionary [String: Any]
//        let jsonDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
//        let currentWeather = jsonDictionary["current_weather" as! [String: Any]]
//        // wind speed
//        let windSpeed = currentWeather["windspeed"] as! Double
//        // wind direction
//        let windDirection = currentWeather["winddirection"] as! Double
//        // temperature
//        let temperature = currentWeather["temperature"] as! Double
//        // weather code
//        let weatherCodeRaw = currentWeather["weathercode"] as! Int
//        return CurrentWeatherForecast(windSpeed: windSpeed, windDirection: windDirection, temperature: temperature, weatherCodeRaw: weatherCodeRaw)
        // WE CAN INSTEAD USE THE DECODABLE PROTOCOL
//    }
}
