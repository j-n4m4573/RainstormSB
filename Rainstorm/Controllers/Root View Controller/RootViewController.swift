//
//  RootViewController.swift
//  Rainstorm
//
//  Created by Jamar Gibbs on 11/20/20.
//

import UIKit

final class RootViewController: UIViewController {
    
    // MARK: Properties
    
    private let dayViewController: DayViewController = {
        guard let dayViewController = UIStoryboard.main.instantiateViewController(withIdentifier: DayViewController.storyboardIdentifier) as? DayViewController else {
            fatalError("Unable to instatiatiate DayViewController")
        }
        
        // Configure DayViewController
        dayViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        return dayViewController
    }()
    
    private let weekViewController: WeekViewController = {
        guard let weekViewController = UIStoryboard.main.instantiateViewController(withIdentifier: WeekViewController.storyboardIdentifier) as? WeekViewController else {
            fatalError("Unable to instatiatiate DayViewController")
        }
        
        // Configure DayViewController
        weekViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        return weekViewController
    }()
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup child view controllers
        setupChildViewControllers()
    }

    private func setupChildViewControllers() {
        addChild(dayViewController)
        addChild(weekViewController)
        
        view.addSubview(dayViewController.view)
        view.addSubview(weekViewController.view)
        
        dayViewController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        dayViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        dayViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        dayViewController.view.heightAnchor.constraint(equalToConstant: Layout.dayView.height).isActive = true
        
        weekViewController.view.topAnchor.constraint(equalTo: dayViewController.view.bottomAnchor).isActive = true
        weekViewController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        weekViewController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        weekViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        dayViewController.didMove(toParent: self)
        weekViewController.didMove(toParent: self)
    }
    
    private func fetchWeatherData() {
        guard let baseUrl = URL(string: "https://api.darksky.net/forecast/") else {
            return
        }
        let authenticatedBaseUrl = baseUrl.appendingPathComponent(APIKeys.dw)
        let url = authenticatedBaseUrl.appendingPathComponent("\(37.7576171), \(-122.5776844)")
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Request failed: \(error)")
            } else if let response = response {
                print(response)
            }
        }
    }
}

extension RootViewController {
    
    fileprivate enum Layout {
        enum dayView {
            static let height: CGFloat = 200.0
        }
    }
}

