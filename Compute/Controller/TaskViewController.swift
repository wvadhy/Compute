//
//  TaskViewController.swift
//  Compute
//
//  Created by William Halliday on 18/02/2025.
//

import UIKit
import FirebaseAuth

class TaskViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var taskTableView: UITableView!
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var dataView: UIView!
    
    @IBOutlet weak var algorithmView: UIView!
    
    @IBOutlet weak var dynamicView: UIView!
    
    @IBOutlet weak var mathView: UIView!
    
    @IBOutlet weak var streakView: UIView!
    
    @IBOutlet weak var coinsDayOne: UIView!
    
    @IBOutlet weak var coinsDayTwo: UIView!
    
    @IBOutlet weak var coinsDayThree: UIView!

    @IBOutlet weak var wellView: UIView!
    
    
    
    var tasks: [Task] = [
        Task(name: "Deep dive", difficulty: "Medium", image: UIImage(named: "water")!),
        Task(name: "Code rush", difficulty: "Easy", image: UIImage(named: "fire")!),
        Task(name: "Deep dive", difficulty: "Hard", image: UIImage(named: "water")!),
    ]
    
    var colours = [
        "Hard": UIColor.red,
        "Medium": UIColor.orange,
        "Easy": UIColor.green
    ]

    override func viewDidLoad() {
        
        taskTableView.dataSource = self
        taskTableView.delegate = self
        taskTableView.register(UINib(nibName: "TaskCell", bundle: nil), forCellReuseIdentifier: "Tony")
        
        checkMode()
        
        setupViews(setup: true)
    }
    
    func setupViews(setup s: Bool) -> Void {
        dataView.customView(setup: s)
        algorithmView.customView(setup: s)
        dynamicView.customView(setup: s)
        mathView.customView(setup: s)
        streakView.customView(setup: s)
        coinsDayOne.customView(setup: s)
        coinsDayTwo.customView(setup: s)
        coinsDayThree.customView(setup: s)
        wellView.customView(setup: s)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tasks[indexPath.row].name == "Code rush"{
            performSegue(withIdentifier: "goToCodeRush", sender: self)
        } else if tasks[indexPath.row].name == "Deep dive" {
            performSegue(withIdentifier: "goToDeepDive", sender: self)
        }
    }
    
    @IBAction func logoutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "goToStart", sender: self)
        } catch let signOutError as NSError {
            print(signOutError)
        }
    }
    
    func checkMode() -> Void {
        if (traitCollection.userInterfaceStyle != .dark) {
            backgroundView.setGradientBackground(colorTop: .backgroundColour, colorBottom: .mainColour)
        } else {
            backgroundView.setGradientBackground(colorTop: .backgroundColour, colorBottom: .mainColour)
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        checkMode()
        setupViews(setup: false)
    }
    
    
}

extension TaskViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Tony", for: indexPath)
        as! TaskCell
        let difficulty = tasks[indexPath.row].difficulty
        cell.difficultyLabel.text = difficulty
        cell.nameLabel.text = tasks[indexPath.row].name
        cell.elementImage.image = tasks[indexPath.row].image
        cell.difficultyLabel.textColor = colours[difficulty]
        return cell
    }
    
    
}
