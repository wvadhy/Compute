 //
//  ShopViewController.swift
//  Compute
//
//  Created by William Halliday on 19/02/2025.
//

import UIKit
import FirebaseAuth

class ShopViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var timeSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var tempView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tempView.customView(setup: true)
        timeSegmentControl.customView(setup: true)

    }
    
}

//extension ShopViewController: UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        5
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Will", for: indexPath)
//        as! TaskCell
//        return cell
//    }
//    
//    
//}
