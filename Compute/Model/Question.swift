import Foundation

struct Question {
    
    let question: String
    let answer: [String:Bool]
    
    init(q: String, a: [String:Bool]){
        self.question = q;
        self.answer = a;
    }
    
}
