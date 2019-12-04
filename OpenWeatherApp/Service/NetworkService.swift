//
//  NetworkService.swift
//  OpenWeatherApp
//
//  Created by Grace Njoroge on 04/12/2019.
//  Copyright © 2019 Grace. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

let APPID = ""

public class WebService {
  
  typealias _completion = (JSON?, Error?, Bool) -> Void
  fileprivate static let isValidDefaultValue: Bool = true
  
  //get weather
  public func getWeather(cityName: String, completionHandler: @escaping (JSON) -> Void) {
    
    let requestName = "GetWeather"
    
    let body = ["q": cityName, "APPID": APPID]
    
    AF.request("https://api.openweathermap.org/data/2.5/weather", method: .get, parameters: body).validate()
      .responseJSON { response in
      
        switch response.result {
          
        case .success:
          do {
            let statuscode = response.response?.statusCode
            let data = try JSON(data: response.data!) // Data, your JSON response is probably in here!
            let json = JSON(data)
                           
            print("statuscode \(requestName) \(statuscode)")
            completionHandler(json)

          } catch {
            
          }
        case .failure(let error):
          print("error \(requestName) \(error)")
        }
    }
  }

}
