//
//  Configuration.swift
//  Rainstorm
//
//  Created by Jamar Gibbs on 11/22/20.
//

import Foundation
import CoreLocation

enum Defaults {
    
    static let location = CLLocation(latitude: 48.8583701, longitude: 2.2944813)
    
}

enum WeatherService {
    
    private static let apiKey = APIKeys.ds
    private static let baseUrl = URL(string: "https://api.darksky.net/forecast/")!
    
    static var authenticatedBaseURL: URL {
        return baseUrl.appendingPathComponent(apiKey)
    }
}
