//
//  ForecastService.swift
//  5DayHourlyForecast
//
//  Created by Aaron on 1/31/19.
//  Copyright © 2019 Aaron. All rights reserved.
//

import UIKit

class ForecastService {

    // jsonDecoder variable
    private let jsonDecoder = JSONDecoder()
    
    init(){
        jsonDecoder.dateDecodingStrategy = .secondsSince1970
    }
    
    // function for retrieving the forecast data of the city input by the user
    func retrieveForecasts(value: String? ,completionHandler: @escaping (ForecastList?) -> Void) {
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        // guard variable for a URL to prevent force unwrapping
        guard let searchDefault = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=\(value ?? "chicago")&appid=d4128029909962705356c869987e09fc&units=imperial") else { return }
        
        // variable for the dataTask using searchDefault's URL value
        let task = session.dataTask(with: searchDefault) { (data, urlResponse, error) in
            
            if let data = data {
                
                // do-catch block puuls the data or prints an error otherwise
                do {
                    let forecasts = try self.jsonDecoder.decode(ForecastList.self, from: data)
                    completionHandler(forecasts)
                    self.completeOnMain(forecasts, completionHandler: completionHandler)
                    
                } catch {
                    print(error)
                    self.completeOnMain(nil, completionHandler: completionHandler)
                }
                
            }
            else {
                self.completeOnMain(nil, completionHandler: completionHandler)
            }
        }
        
        task.resume()
    }
    
    private func completeOnMain(_ forecasts: ForecastList?, completionHandler: @escaping (ForecastList?) -> Void) {
        
        DispatchQueue.main.async {
            completionHandler(forecasts)
        }
    }
}
