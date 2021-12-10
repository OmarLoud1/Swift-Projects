//
//  WeatherData.swift
//  Clima
//
//  Created by Omar Loudghiri on 1/23/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
struct WeatherData : Decodable{
    let name: String
    let main: Main
    let weather: [Weather]

}
struct Main:Decodable{
    let temp: Double
}
struct Weather:Decodable{
    let description: String
    let id: Int
}





