//
//  ParseHelper.swift
//  OpenWeatherApp
//
//  Created by Grace Njoroge on 04/12/2019.
//  Copyright © 2019 Grace. All rights reserved.
//

import Foundation
import SwiftyJSON

public class ParseHelper {
  
  static func parseWeather(json: JSON) {
    var weather = [Weather]()
    
    var saveClouds = ""
    var saveWeatherIcon = ""
    
    if let weatherDetails = json["weather"].array {
      for elements in weatherDetails {
        var weatherIcon = elements["icon"].string
        weatherIcon = saveWeatherIcon
        var clouds = elements["description"].string
        clouds = saveClouds
      }
    }
    
    let main = json["main"].dictionaryValue
    let temp = main["temp"]?.double ?? 0.00
    
    let wind = json["wind"].dictionaryValue
    let windSpeed = wind["speed"]?.double ?? 0.00
    
    let weatherObject = Weather(cityName: "", temperature: temp, weatherIcon: saveWeatherIcon, wind: windSpeed, clouds: saveClouds)
    weather.append(weatherObject)
  }
}
