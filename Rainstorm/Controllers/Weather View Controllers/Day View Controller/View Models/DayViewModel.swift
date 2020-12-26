//
//  DayViewModel.swift
//  Rainstorm
//
//  Created by Jamar Gibbs on 11/28/20.
//

import UIKit

struct DayViewModel {
    
    let weatherData: CurrentWeatherConditions
    
    private let dateFormatter = DateFormatter()
    
    var date: String {
        dateFormatter.dateFormat = "EEE, MMMM d YYYY"
        return dateFormatter.string(from: weatherData.time)
    }
    
    
}
        
