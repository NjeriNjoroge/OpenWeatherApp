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
  
  static func parseWeather(json: JSON) -> Weather {
    var weather = [Weather]()
    
    var saveClouds = ""
    var saveWeatherIcon = ""

    for item in json["weather"].arrayValue {
      saveWeatherIcon = item["icon"].stringValue
      saveClouds = item["description"].stringValue
    }
    
    let cityName = json["name"].stringValue
    let main = json["main"].dictionaryValue
    let temp = main["temp"]?.double ?? 0.00
    
    let wind = json["wind"].dictionaryValue
    let windSpeed = wind["speed"]?.double ?? 0.00
    
    let weatherObject = Weather(name: cityName, temperature: temp, weatherIcon: saveWeatherIcon, wind: windSpeed, clouds: saveClouds)
    weather.append(weatherObject)

    return weatherObject
  }
}


