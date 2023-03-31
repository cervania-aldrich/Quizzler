struct Question {
    
    let title:String //References the category of a question.
    let question:String //References to the question itself.
    let answers:[String] //References the possible answers to a question.
    let correctAnswer:String //References the correct answer of a question.
    
    //Intialise a Question blueprint with external parameter names so that instantiation of this struct looks cleaner (See QuizBrain).
    init(_ title: String, _ question: String, _ answers: [String], _ correctAnswer: String) {
        self.title = title
        self.question = question
        self.answers = answers
        self.correctAnswer = correctAnswer
    }
    
}
