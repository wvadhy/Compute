//
//  QuestionViewController.swift
//  Compute
//
//  Created by William Halliday on 19/02/2025.
//

import UIKit

class CountDownViewController: UIViewController {
    
    
    @IBOutlet weak var countdownLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let countdown = ["3", "2", "1", "GO!"]
        var index = 0.0
        
        for i in countdown {
            Timer.scheduledTimer(withTimeInterval: index * 1.0, repeats: false) { (timer) in
                self.countdownLabel.text = i
            }
            index += 1
        }
        
        Timer.scheduledTimer(withTimeInterval: 4.5, repeats: false) {(timer) in
            self.performSegue(withIdentifier: "goToQuestion", sender: self)
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
