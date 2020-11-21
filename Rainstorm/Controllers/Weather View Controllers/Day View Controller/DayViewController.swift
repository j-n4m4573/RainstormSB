//
//  DayViewController.swift
//  Rainstorm
//
//  Created by Jamar Gibbs on 11/20/20.
//

import UIKit

final class DayViewController: UIViewController {

    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    // MARK: Helper Methods
    
    private func setupView() {
        // Configure View
        view.backgroundColor = .orange
    }

}
