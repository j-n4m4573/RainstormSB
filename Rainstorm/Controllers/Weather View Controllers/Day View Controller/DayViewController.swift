//
//  DayViewController.swift
//  Rainstorm
//
//  Created by Jamar Gibbs on 11/20/20.
//

import UIKit

final class DayViewController: UIViewController {
    
    // MARK: Properties
    
    var viewModel: DayViewModel? {
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
    
    // MARK: Outlets
    
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var windSpeedLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!

    @IBOutlet var dateLabel: UILabel! {
        didSet {
            dateLabel.textColor = .baseTextColor
            dateLabel.font = UIFont.Rainstorm.heavyLarge
        }
    }
    
    @IBOutlet var iconImageView: UIImageView! {
        didSet {
            iconImageView.contentMode = .scaleAspectFit
        }
    }
    @IBOutlet var regularLabels: [UILabel]! {
        didSet {
            for label in regularLabels {
                label.textColor = .black
                label.font = UIFont.Rainstorm.lightRegular
            }
        }
    }
    
    @IBOutlet var smallLabels: [UILabel]! {
        didSet {
            for label in regularLabels {
                label.textColor = .black
                label.font = UIFont.Rainstorm.lightSmall
            }
        }
    }
    
    // MARK: Helper Methods
    
    private func setupView() {
        // Configure View
        view.backgroundColor = .orange
    }
    
    private func setupViewModel (with viewModel: DayViewModel) {
        print(viewModel)
    }

}
