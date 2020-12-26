//
//  WeekViewController.swift
//  Rainstorm
//
//  Created by Jamar Gibbs on 11/20/20.
//

import UIKit

final class WeekViewController: UIViewController {
    
    // MARK: Properties
    var viewModel: WeekViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            setupViewModel(with: viewModel)
        }
    }
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    // MARK: Helper Methods
    
    private func setupView() {
        // Configure View
        view.backgroundColor = .yellow
    }
    
    private func setupViewModel(with viewModel: WeekViewModel) {
        print(viewModel)
    }


}
