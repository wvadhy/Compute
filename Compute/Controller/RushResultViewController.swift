//
//  RushResultViewController.swift
//  Compute
//
//  Created by William Halliday on 24/02/2025.
//

import UIKit

class RushResultViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var feedbackLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "\(Brain.shared.correct)/\(Brain.shared.total)"
        feedbackLabel.text = Brain.shared.feedback()
    }

}
