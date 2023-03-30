struct QuizBrain {
    
    let quiz = [
        Question(Constants.Q1.title, Constants.Q1.question, Constants.Q1.answers, Constants.Q1.correctAnswer),
        Question(Constants.Q2.title, Constants.Q2.question, Constants.Q2.answers, Constants.Q2.correctAnswer),
        Question(Constants.Q3.title, Constants.Q3.question, Constants.Q3.answers, Constants.Q3.correctAnswer),
        Question(Constants.Q4.title, Constants.Q4.question, Constants.Q4.answers, Constants.Q4.correctAnswer),
        Question(Constants.Q5.title, Constants.Q5.question, Constants.Q5.answers, Constants.Q5.correctAnswer)
    ]
    
    var questionNumber = 0 //A reference to track which question the user is currently on.
    var score = 0 //A reference to track the score
    
    mutating func checkAnswer(_ userAnswer:String) -> Bool {
        let actualAnswer = quiz[questionNumber].correctAnswer
        
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
        let questionText = quiz[questionNumber].question
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
    
    func getTitle() -> String{
        let titleString = quiz[questionNumber].title
        return titleString
    }
    
    func getOptionA() -> String {
        let optionString = quiz[questionNumber].answers[0]
        return optionString
    }
    
    func getOptionB() -> String {
        let optionString = quiz[questionNumber].answers[1]
        return optionString
    }
    
    func getOptionC() -> String {
        let optionString = quiz[questionNumber].answers[2]
        return optionString
    }
    
    func getOptionD() -> String {
        let optionString = quiz[questionNumber].answers[3]
        return optionString
    }
    
    func getOptionE() -> String {
        let optionString = quiz[questionNumber].answers[4]
        return optionString
    }
    
    func getOptionF() -> String {
        let optionString = "Pass"
        return optionString
    }
    
}
