struct MultiQuestion {
    
    let title:String
    let question:String
    let answers:[String]
    let correctAnswer:String
    
    init(_ title: String, _ question: String, _ answers: [String], _ correctAnswer: String) {
        self.title = title
        self.question = question
        self.answers = answers
        self.correctAnswer = correctAnswer
    }
    
}
