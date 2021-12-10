//
//  weatherManager.swift
//  Clima
//
//  Created by Omar Loudghiri on 1/22/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeaterManagerDelegate{
    func didUpdateWeather(_ manager: weatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}
struct weatherManager{
    
    var delegate: WeaterManagerDelegate?
    
    let url =  "https://api.openweathermap.org/data/2.5/weather?appid=341e73dba1295ae5909eb252d8bae0ec&units=metric"
    
    func fetch(city: String){
        let urlString = "\(url)&q=\(city)"
        performSearch(urlString: urlString)
    }
    
    func fetch(lon: CLLocationDegrees, lat: CLLocationDegrees ){
        let urlString = "\(url)&lon=\(lon)&lat=\(lat)"
        performSearch(urlString: urlString)
    }
    
    func performSearch( urlString :String){
        if let url = URL(string : urlString){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error != nil{
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let weather = self.parseJSON(weatherData: safeData){
                        delegate?.didUpdateWeather(self ,weather: weather)
                    }
                     
                }
            }
            
            task.resume()
        }
    }
    func parseJSON(weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do{
        let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let condition1 = getCondition(id: id)
            let strTemp = getTemp(temp: temp)
            
            let weather = WeatherModel(condition: condition1, city: name, temp: strTemp)
            return weather
        }catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    
    
    }
    
    func getTemp(temp: Double) ->String{
        return String(format: "%.1f", temp)
    }
    
    func getCondition(id : Int) -> String{
    switch id {
            case 200...232:
                return "cloud.bolt"
            case 300...321:
                return "cloud.drizzle"
            case 500...531:
                return "cloud.rain"
            case 600...622:
                return "cloud.snow"
            case 701...781:
                return "cloud.fog"
            case 800:
                return "sun.max"
            case 801...804:
                return "cloud.bolt"
            default:
                return "cloud"
            }

    }
    
    
    
}
