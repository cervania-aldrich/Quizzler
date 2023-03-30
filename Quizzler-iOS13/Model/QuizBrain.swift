struct QuizBrain {
    
    //quiz is now an array of Question objects, instead of stored as a 2D array.
    //quiz[0] accesses Question Object. quiz[1] accesses another Question Object, etc. All instead of a nested array.
    
    let quiz = [
        Question(text: "1 x 5 = 5", answer: "True"),
        Question(text: "2 + 9 = 11", answer: "False"),
        Question(text: "6 x 3 = 18", answer: "True"),
        Question(text: "3 + 8 = 32", answer: "False"),
        Question(text: "4 x 4 = 12", answer: "False"),
        Question(text: "5 + 17 = 23", answer: "True"),
        Question(text: "8 x 9 = 72", answer: "True"),
        Question(text: "23 + 12 = 26", answer: "False"),
        Question(text: "6 x 3 = 18", answer: "True"),
        Question(text: "6 / 3 = 2", answer: "True"),
        Question(text: "12 x 5 = 60", answer: "True"),
        Question(text: "3 + 3 = 9", answer: "False")
    ]
    
    var questionNumber = 0 //A reference to track which question the user is currently on.
    var score = 0 //A reference to track the score
    
    mutating func checkAnswer(_ userAnswer:String) -> Bool {
        let actualAnswer = quiz[questionNumber].answer
        
        if userAnswer == actualAnswer {
            //User got it right - Change background to green
            score += 1
            return true
        } else {
            //User got it wrong - Change background to red
            return false
        }
    }
    
    mutating func nextQuestion() {
        
        //Validate the quiz by only showing the questions in the quiz. Array indexes start at 0, not at 1. Take into account of this offset.
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1 //Increment the questionNumber, therefore going to the next question of the quiz.
        } else {
            questionNumber = 0 //Reset the questionNumber, therefore starting back at the first question of the quiz.
            score = 0
        }
    }
    
    mutating func getQuestionText() -> String {
        let questionText = quiz[questionNumber].text
        return questionText
    }
    
    func getPercentageProgress() -> Float {
        let result = Float(questionNumber + 1) / Float(quiz.count) //The ratio of the 'questionNumber' to 'quiz.count,' expressed as a percentage.
        return result
    }
    
    func getScore() -> String {
        let scoreString = "Score: \(score) / \(quiz.count)"
        return scoreString
    }
    
    
}
