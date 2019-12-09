//
//  WeatherViewModel.swift
//  OpenWeatherApp
//
//  Created by Grace Njoroge on 06/12/2019.
//  Copyright © 2019 Grace. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher


class WeatherViewModel {
  
  private var weatherDetails: Weather?
  private var weatherObjects = [Weather]()
  
  private let networkService = NetworkService()
  
  func fetchWeather(completion: ((_ weather: Weather) -> Void)?) {
    networkService.getWeather(cityName: "London", completionHandler: { (json) in
      if json.stringValue != "error" {
        let results = ParseHelper.parseWeather(json: json)
        self.weatherObjects.append(results)
        print("weatherObject \(results)")
        completion?(results)
      }
      print(json)
    })
  }
  
  public var cityName: String  {
    return weatherObjects[0].name
  }
  
  public var temperature: Double {
    return weatherObjects[0].temperature
  }
  public var weatherIcon: String {
    return weatherObjects[0].weatherIcon
  }
  public var wind: Double {
    return weatherObjects[0].wind
  }
  public var clouds: String {
    return weatherObjects[0].clouds
  }
  
  public var count: Int {
    return weatherObjects.count
  }
  
  public var weatherIconUrl: URL {
    return URL(string: "http://openweathermap.org/img/wn/\(weatherIcon)@2x.png")!
  }
  
}
