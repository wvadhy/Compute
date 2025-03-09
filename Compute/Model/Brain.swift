import Foundation
import UIKit

struct Brain {
    
    static var shared = Brain()
    
    var questions: [Question] = [
        Question(q: "What does the 'print()' function do in Python?", a: ["Displays output on the screen": true, "Shows current errors present in the program": false, "Prints a sheet of paper": false]),
        Question(q: "Which function is used to get the length of a list in Python?", a: ["len()": true, "size()": false, "count()": false]),
        Question(q: "What is the keyword used to define a function in Python?", a: ["def": true, "func": false, "define": false]),
        Question(q: "Which of the following is used to create a comment in Python?", a: ["# This is a comment": true, "// This is a comment": false, "<!-- This is a comment -->": false]),
        Question(q: "What is the output of the following code: print(2 ** 3)?", a: ["8": true, "5": false, "6": false]),
        Question(q: "How do you start a loop that will iterate over each element in a list in Python?", a: ["for element in list:": true, "loop list": false, "foreach": false]),
        Question(q: "Which of the following is a mutable data type in Python?", a: ["tuple": false, "string": false, "list": true]),
        Question(q: "Which method is used to add an item to the end of a list in Python?", a: ["append()": true, "add()": false, "pop()": false]),
        Question(q: "How do you create a dictionary in Python?", a: ["dict = {key: value}": true, "dict = [key, value]": false, "dict = (key, value)": false]),
        Question(q: "Which of the following is used to remove an element from a list in Python?", a: ["remove()": true, "delete()": false, "popout()": false]),
        Question(q: "Which of these functions is used to read a file in Python?", a: ["openfile()": false, "readfile()": false, "open()": true]),
        Question(q: "Which of the following methods can be used to check if a key exists in a Python dictionary?", a: ["in": true, "keyexists()": false, "contains()": false]),
        Question(q: "Which function is used to convert a string to an integer in Python?", a: ["int()": true, "strtoint()": false, "convert()": false])
    ]
    
    var initProg: Float = 0.0
    var copyProg: Float = 0.0
    var correct = 0
    var totalCorrect = 0
    var totalTotal = 0
    var total = 0
    var highScore = 0
    var scores: [Int] = [0]
    var average: Double = 0.0
    let numQuestions = 10
    
    init() {
        self.initProg = 1.0 / Float(numQuestions)
        self.copyProg = initProg
    }
    
    mutating func pressed(_ text: String) -> Float {
//        questions.remove(at: <#T##Int#>)
        initProg += copyProg
        return initProg;
    }
    
    func getQuestion() -> Question {
        return self.questions.randomElement()!
    }
    
    mutating func badAnswer() -> Void {
        total += 1
    }
    
    mutating func goodAnswer() -> Void {
        correct += 1
        total += 1
    }
    
    mutating func calculateAverage() -> Void {
        average = Double(scores.reduce(0, +) / scores.count)
    }
    
    mutating func calculateHighScore() -> Void {
        scores.append(correct)
        totalCorrect += correct
        totalTotal += total
        if (correct > highScore) {
            highScore = correct
        }
    }
    
    mutating func feedback() -> String {
        if (correct > 5) {
            correct = 0
            total = 0
            return "Good job, you did better than most!"
        } else {
            correct = 0
            total = 0
            return "Maybe some more practice next time!"
        }
    }
}
