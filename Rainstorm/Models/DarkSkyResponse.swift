//
//  DarkSkyResponse.swift
//  Rainstorm
//
//  Created by Jamar Gibbs on 11/25/20.
//

import Foundation

public struct DarkSkyResponse: Codable {
    
    public struct Conditions: Codable {
        public let time: Date
        public let icon: String
        public let summary: String
        public let windSpeed: Double
        public let temperature: Double
    
    }
    
    public struct Daily: Codable {
        public let data: [Conditions]
        public struct Conditions: Codable {
            public let time: Date
            public let icon: String
            public let summary: String
            public let windSpeed: Double
            public let temperatureMin: Double
            public let temperatureMax: Double

        }
    }
    
    public let currently: Conditions
    public let daily: Daily
    
    public let latitude: Double
    public let longitude: Double
}
