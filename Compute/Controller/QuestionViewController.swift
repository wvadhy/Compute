//
//  QuestionViewController.swift
//  Compute
//
//  Created by William Halliday on 19/02/2025.
//

import UIKit
import AVFoundation

class QuestionViewController: UIViewController {
    
    var currentQuestion: Question = Question(q: "", a: ["": false])
    var buttons: [UIButton] = []
    var images: [UIImageView] = []
    var timeLeft = 50
    var player = AVAudioPlayer()
    var progress = 0.0
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerOne: BounceButton!
    @IBOutlet weak var answerTwo: BounceButton!
    @IBOutlet weak var answerThree: BounceButton!
    
    @IBOutlet weak var imageOne: UIImageView!
    @IBOutlet weak var imageTwo: UIImageView!
    @IBOutlet weak var imageThree: UIImageView!
    
    @IBOutlet weak var questionView: UIView!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var timeRemaining: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configButton(button: answerOne)
        configButton(button: answerTwo)
        configButton(button: answerThree)
        
        questionView.customView(setup: true, color: .black)
        
        images.append(imageOne)
        images.append(imageTwo)
        images.append(imageThree)

        generateNewPage()
        startCountDown()
        checkMode()
        
    }
    
    func startCountDown(){
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if (self.timeLeft < 10) {
                self.timeRemaining.textColor = .orange
                if (self.timeLeft == 0) {
                    Brain.shared.calculateHighScore()
                    self.performSegue(withIdentifier: "goToRushResult", sender: self)
                }
            }
            self.timeRemaining.text = "00:\(self.timeLeft)"
            self.timeLeft -= 1
        }
    }
    
    func configButton(button btn: UIButton) -> Void {
        btn.layer.cornerRadius = 20
        btn.layer.masksToBounds = true
        buttons.append(btn)
    }
    
    func generateNewPage(){
        
        if (progressView.progress == 1.0) {
            Brain.shared.calculateHighScore()
            performSegue(withIdentifier: "goToRushResult", sender: self)
        } else {
            for i in 0...buttons.count-1 {
                buttons[i].backgroundColor = .mainColour
                buttons[i].isEnabled = true
                images[i].image = nil
            }
            currentQuestion = Brain.shared.getQuestion()
            questionLabel.text = currentQuestion.question
            generateAnswers()
        }
    }
    
    func generateAnswers(){
        var count = 0
        for (k, _) in currentQuestion.answer {
            buttons[count].setTitle(k, for: UIControl.State.normal)
            count += 1
        }
    }
    
    @IBAction func btnPressed(_ sender: UIButton) {
        if (currentQuestion.answer[(sender.titleLabel?.text)!] == true) {
            Brain.shared.goodAnswer()
            progressView.setProgress(Brain.shared.pressed(questionLabel.text!), animated: true)
            playSound(answer: "correctAnswer")
        } else {
            playSound()
            Brain.shared.badAnswer()
        }
        beforePage()
    }
    
    func beforePage(){
        for i in 0...buttons.count-1 {
            buttons[i].isEnabled = false
            if (currentQuestion.answer[(buttons[i].titleLabel?.text)!] == true) {
                UIView.animate(withDuration: 0.5, animations: { () -> Void in
                    
                    self.buttons[i].backgroundColor = .correct
                    self.buttons[i].setTitle("Correct", for: .normal)
                    self.images[i].image = UIImage(named: "thumbsUpLight")
                    
                })
            }
            else {
                UIView.animate(withDuration: 0.5, animations: { () -> Void in

                    self.buttons[i].backgroundColor = .wrong
                    self.buttons[i].setTitle("Wrong", for: .normal)
                    self.images[i].image = UIImage(named: "wrongCrossLight")

                })
            }
        }
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { timer in
            self.generateNewPage()
        }
    }
    
    func playSound(answer a: String = "wrongAnswer") {
        
        let url = Bundle.main.url(forResource: a, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
    
    func checkMode() -> Void {
        if (traitCollection.userInterfaceStyle != .dark) {
            questionView.setGradientBackground(colorTop: .white, colorBottom: .secondary)
        } else {
            questionView.setGradientBackground(colorTop: .black, colorBottom: .secondary)
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        checkMode()
    }
    
}
