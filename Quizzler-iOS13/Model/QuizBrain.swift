struct QuizBrain {
    
   var topic = "" //Set from Alert. Equal to Renal or Rhuematology (Add functionality to switch between the two sets of questions)
    
    let rhuematologyQuiz = [
        Question(Constants.Rhuematology.Q1.title, Constants.Rhuematology.Q1.question, Constants.Rhuematology.Q1.answers, Constants.Rhuematology.Q1.correctAnswer),
        Question(Constants.Rhuematology.Q2.title, Constants.Rhuematology.Q2.question, Constants.Rhuematology.Q2.answers, Constants.Rhuematology.Q2.correctAnswer),
        Question(Constants.Rhuematology.Q3.title, Constants.Rhuematology.Q3.question, Constants.Rhuematology.Q3.answers, Constants.Rhuematology.Q3.correctAnswer),
        Question(Constants.Rhuematology.Q4.title, Constants.Rhuematology.Q4.question, Constants.Rhuematology.Q4.answers, Constants.Rhuematology.Q4.correctAnswer),
        Question(Constants.Rhuematology.Q5.title, Constants.Rhuematology.Q5.question, Constants.Rhuematology.Q5.answers, Constants.Rhuematology.Q5.correctAnswer),
    ]
    
    let renalQuiz = [
        Question(Constants.Renal.Q1.title, Constants.Renal.Q1.question, Constants.Renal.Q1.answers, Constants.Renal.Q1.correctAnswer),
        Question(Constants.Renal.Q2.title, Constants.Renal.Q2.question, Constants.Renal.Q2.answers, Constants.Renal.Q2.correctAnswer),
        Question(Constants.Renal.Q3.title, Constants.Renal.Q3.question, Constants.Renal.Q3.answers, Constants.Renal.Q3.correctAnswer),
        Question(Constants.Renal.Q4.title, Constants.Renal.Q4.question, Constants.Renal.Q4.answers, Constants.Renal.Q4.correctAnswer),
        Question(Constants.Renal.Q5.title, Constants.Renal.Q5.question, Constants.Renal.Q5.answers, Constants.Renal.Q5.correctAnswer)
    ]
    
    let quiz = [
        Question(Constants.Rhuematology.Q1.title, Constants.Rhuematology.Q1.question, Constants.Rhuematology.Q1.answers, Constants.Rhuematology.Q1.correctAnswer),
        Question(Constants.Rhuematology.Q2.title, Constants.Rhuematology.Q2.question, Constants.Rhuematology.Q2.answers, Constants.Rhuematology.Q2.correctAnswer),
        Question(Constants.Rhuematology.Q3.title, Constants.Rhuematology.Q3.question, Constants.Rhuematology.Q3.answers, Constants.Rhuematology.Q3.correctAnswer),
        Question(Constants.Rhuematology.Q4.title, Constants.Rhuematology.Q4.question, Constants.Rhuematology.Q4.answers, Constants.Rhuematology.Q4.correctAnswer),
        Question(Constants.Rhuematology.Q5.title, Constants.Rhuematology.Q5.question, Constants.Rhuematology.Q5.answers, Constants.Rhuematology.Q5.correctAnswer),
    ]
    
    var questionNumber = 0 //A reference to track which question the user is currently on.
    var score = 0 //A reference to track the score
    
    mutating func resetQuestionNumberAndScore(){
        questionNumber = 0
        score = 0
    }
    
    mutating func checkAnswer(_ userAnswer:String) -> Bool {
        var actualAnswer = ""
        
        if topic == "Renal" {
            actualAnswer = renalQuiz[questionNumber].correctAnswer
            if userAnswer == actualAnswer {
                score += 1 //User got it right - Change background to green
                return true
            } else {
                return false //User got it wrong - Change background to red
            }
            
        } else if topic == "Rhuematology" {
            actualAnswer = rhuematologyQuiz[questionNumber].correctAnswer
            if userAnswer == actualAnswer {
                score += 1 //User got it right - Change background to green
                return true
            } else {
                return false //User got it wrong - Change background to red
            }
        } else {
            actualAnswer = quiz[questionNumber].correctAnswer
            if userAnswer == actualAnswer {
                score += 1 //User got it right - Change background to green
                return true
            } else {
                return false //User got it wrong - Change background to red
            }
        }
    }
    
    mutating func nextQuestion() {

        //Validate the quiz by only showing the questions in the quiz. Array indexes start at 0, not at 1. Take into account of this offset.

        if questionNumber + 1 < quiz.count {
            questionNumber += 1 //Increment the questionNumber, therefore going to the next question of the quiz.
        } else {
            resetQuestionNumberAndScore()
            //print("Quiz done! Final Score: \(score)/\(quiz.count) .  Try again?")
        }
    }
    
    func getQuestionText() -> String {
        var questionText = ""
        
        if topic == Constants.renalString {
            questionText = renalQuiz[questionNumber].question
        } else if topic == Constants.rhuematologyString {
            questionText = rhuematologyQuiz[questionNumber].question
        } else {
            questionText = quiz[questionNumber].question
        }
        
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
        var titleString = ""
        
        if topic == Constants.renalString {
            titleString = renalQuiz[questionNumber].title
        } else if topic == Constants.rhuematologyString {
            titleString = rhuematologyQuiz[questionNumber].title
        } else {
            titleString = quiz[questionNumber].title
        }
        
        return titleString
    }
    
    func getOptionA() -> String {
        var optionString = ""
        
        if topic == Constants.renalString {
            optionString = renalQuiz[questionNumber].answers[0]
        } else if topic == Constants.rhuematologyString {
            optionString = rhuematologyQuiz[questionNumber].answers[0]
        } else {
            optionString = quiz[questionNumber].answers[0]
        }
        
        return optionString
    }
    
    func getOptionB() -> String {
        var optionString = ""
        
        if topic == Constants.renalString {
            optionString = renalQuiz[questionNumber].answers[1]
        } else if topic == Constants.rhuematologyString {
            optionString = rhuematologyQuiz[questionNumber].answers[1]
        } else {
            optionString = quiz[questionNumber].answers[1]
        }
        
        return optionString
    }
    
    func getOptionC() -> String {
        var optionString = ""
        
        if topic == Constants.renalString {
            optionString = renalQuiz[questionNumber].answers[2]
        } else if topic == Constants.rhuematologyString {
            optionString = rhuematologyQuiz[questionNumber].answers[2]
        } else {
            optionString = quiz[questionNumber].answers[2]
        }
        
        return optionString
    }
    
    func getOptionD() -> String {
        var optionString = ""
        
        if topic == Constants.renalString {
            optionString = renalQuiz[questionNumber].answers[3]
        } else if topic == Constants.rhuematologyString {
            optionString = rhuematologyQuiz[questionNumber].answers[3]
        } else {
            optionString = quiz[questionNumber].answers[3]
        }
        
        return optionString
    }
    
    func getOptionE() -> String {
        var optionString = ""
        
        if topic == Constants.renalString {
            optionString = renalQuiz[questionNumber].answers[4]
        } else if topic == Constants.rhuematologyString {
            optionString = rhuematologyQuiz[questionNumber].answers[4]
        } else {
            optionString = quiz[questionNumber].answers[4]
        }
        
        return optionString
    }
    
    func getOptionF() -> String {
        let optionString = Constants.lastOptionString
        return optionString
    }
    
    func getTopic() -> String {
        var topicString = ""
        
        if topic == Constants.renalString {
            topicString = Constants.renalString
        } else if topic == Constants.rhuematologyString {
            topicString = Constants.rhuematologyString
        } else {
            topicString = Constants.rhuematologyString //Default quiz is the rhuematologyQuiz
        }
        return topicString
    }
    
}
