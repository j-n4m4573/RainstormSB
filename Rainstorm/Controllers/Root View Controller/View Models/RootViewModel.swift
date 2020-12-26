//
//  RootViewModel.swift
//  Rainstorm
//
//  Created by Jamar Gibbs on 11/23/20.
//

import Foundation

class RootViewModel {
    
    enum WeatherDataError: Error {
        case noWeatherDataAvailable
    }
    
    // MARK: - Type Aliases
    
    typealias DidFetchWeatherDataCompletion = (WeatherData?, WeatherDataError?) -> Void
    
    // MARK: - Properties
    
    var didFetchWeatherData: DidFetchWeatherDataCompletion?
    
    init() {
        fetchWeatherData()
    }
    
    // MARK: - Helpers
    private func fetchWeatherData() {
        
        let weatherRequest = WeatherRequest(baseURL: WeatherService.authenticatedBaseURL, location: Defaults.location)
                
        URLSession.shared.dataTask(with: weatherRequest.url) { [weak self] (data, response, error) in
            if let response = response as? HTTPURLResponse {
                print("Status Code: \(response.statusCode)")
            }
                if let error = error {
                    self?.didFetchWeatherData?(nil, .noWeatherDataAvailable)
                } else if let data = data {
                    let decoder = JSONDecoder()
                        do {
                            let darkSkyResponse = try decoder.decode(DarkSkyResponse.self, from: data)
                            self?.didFetchWeatherData?(darkSkyResponse, nil)
                        } catch {
                            print("Unable to parse JSON response \(error)")
                            self?.didFetchWeatherData?(nil, .noWeatherDataAvailable)
                        }
                } else {
                    self?.didFetchWeatherData?(nil, .noWeatherDataAvailable)
                }
            }.resume()
        }
}
