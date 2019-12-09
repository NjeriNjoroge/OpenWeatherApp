//
//  Weather.swift
//  OpenWeatherApp
//
//  Created by Grace Njoroge on 04/12/2019.
//  Copyright © 2019 Grace. All rights reserved.
//

import Foundation

struct Weather: Codable {
  
  let name: String
  let temperature: Double
  let weatherIcon: String
  let wind: Double
  let clouds: String
}

