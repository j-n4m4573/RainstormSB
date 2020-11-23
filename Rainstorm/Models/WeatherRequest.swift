//
//  WeatherRequest.swift
//  Rainstorm
//
//  Created by Jamar Gibbs on 11/22/20.
//

import Foundation
import CoreLocation

struct WeatherRequest {
    
    let baseURL: URL
    let location: CLLocation
    
    private var latitude: Double {
        return location.coordinate.latitude
    }
    private var longitude: Double {
        return location.coordinate.longitude
    }
    
    var url: URL {
        return baseURL.appendingPathComponent("\(latitude),\(longitude)")
    }
}
