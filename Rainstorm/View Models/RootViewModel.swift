//
//  RootViewModel.swift
//  Rainstorm
//
//  Created by Jamar Gibbs on 11/23/20.
//

import Foundation

class RootViewModel {
    
    typealias DidFetchWeatherDataCompletion = (Data?, Error?) -> Void
    // MARK: - Properties
    
    var didFetchWeatherData: DidFetchWeatherDataCompletion?
    
    init() {
        fetchWeatherData()
    }
    
    // MARK: - Helpers
    private func fetchWeatherData() {
        
        let weatherRequest = WeatherRequest(baseURL: WeatherService.authenticatedBaseURL, location: Defaults.location)
                
        URLSession.shared.dataTask(with: weatherRequest.url) { [weak self] (data, response, error) in
                if let error = error {
                    self?.didFetchWeatherData?(nil, error)
                } else if let data = data {
                    self?.didFetchWeatherData?(data, nil)
                } else {
                    self?.didFetchWeatherData?(nil, nil)
                }
            }.resume()
        }
}
