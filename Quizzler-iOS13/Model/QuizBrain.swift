///In accordance to the MVC pattern, this structure handles the logic and data of the app.
struct QuizBrain {
    
   var topic = "" //This property is set when a user selects a topic from the topicButton, thus showing their desired quiz topic.
    
    ///A constant to reference an array of Rhuematology questions. The strings arguments are referenced from the Constants struct.
    let rhuematologyQuiz = [
        Question(Constants.Rhuematology.Q1.title, Constants.Rhuematology.Q1.question, Constants.Rhuematology.Q1.answers, Constants.Rhuematology.Q1.correctAnswer),
        Question(Constants.Rhuematology.Q2.title, Constants.Rhuematology.Q2.question, Constants.Rhuematology.Q2.answers, Constants.Rhuematology.Q2.correctAnswer),
        Question(Constants.Rhuematology.Q3.title, Constants.Rhuematology.Q3.question, Constants.Rhuematology.Q3.answers, Constants.Rhuematology.Q3.correctAnswer),
        Question(Constants.Rhuematology.Q4.title, Constants.Rhuematology.Q4.question, Constants.Rhuematology.Q4.answers, Constants.Rhuematology.Q4.correctAnswer),
        Question(Constants.Rhuematology.Q5.title, Constants.Rhuematology.Q5.question, Constants.Rhuematology.Q5.answers, Constants.Rhuematology.Q5.correctAnswer),
    ]
    
    ///A constant to reference an array of Renal questions. The strings arguments are referenced from the Constants struct.
    let renalQuiz = [
        Question(Constants.Renal.Q1.title, Constants.Renal.Q1.question, Constants.Renal.Q1.answers, Constants.Renal.Q1.correctAnswer),
        Question(Constants.Renal.Q2.title, Constants.Renal.Q2.question, Constants.Renal.Q2.answers, Constants.Renal.Q2.correctAnswer),
        Question(Constants.Renal.Q3.title, Constants.Renal.Q3.question, Constants.Renal.Q3.answers, Constants.Renal.Q3.correctAnswer),
        Question(Constants.Renal.Q4.title, Constants.Renal.Q4.question, Constants.Renal.Q4.answers, Constants.Renal.Q4.correctAnswer),
        Question(Constants.Renal.Q5.title, Constants.Renal.Q5.question, Constants.Renal.Q5.answers, Constants.Renal.Q5.correctAnswer)
    ]
    
    ///A constant to reference an array of Cardiovascular questions. The strings arguments are referenced from the Constants struct.
    let cardiovascularQuiz = [
        Question(Constants.Cardiovascular.Q1.title, Constants.Cardiovascular.Q1.question, Constants.Cardiovascular.Q1.answers, Constants.Cardiovascular.Q1.correctAnswer),
        Question(Constants.Cardiovascular.Q2.title, Constants.Cardiovascular.Q2.question, Constants.Cardiovascular.Q2.answers, Constants.Cardiovascular.Q2.correctAnswer),
        Question(Constants.Cardiovascular.Q3.title, Constants.Cardiovascular.Q3.question, Constants.Cardiovascular.Q3.answers, Constants.Cardiovascular.Q3.correctAnswer),
        Question(Constants.Cardiovascular.Q4.title, Constants.Cardiovascular.Q4.question, Constants.Cardiovascular.Q4.answers, Constants.Cardiovascular.Q4.correctAnswer),
        Question(Constants.Cardiovascular.Q5.title, Constants.Cardiovascular.Q5.question, Constants.Cardiovascular.Q5.answers, Constants.Cardiovascular.Q5.correctAnswer),
        Question(Constants.Cardiovascular.Q6.title, Constants.Cardiovascular.Q6.question, Constants.Cardiovascular.Q6.answers, Constants.Cardiovascular.Q6.correctAnswer),
    ]
    
    ///A constant to reference an array of the default quiz. The default quiz is set to be the same as the Rhuematology quiz. This is the first quiz that the users see.
    let quiz = [
        Question(Constants.Default.Q1.title, Constants.Default.Q1.question, Constants.Default.Q1.answers, Constants.Default.Q1.correctAnswer),
        Question(Constants.Default.Q2.title, Constants.Default.Q2.question, Constants.Default.Q2.answers, Constants.Default.Q2.correctAnswer),
        Question(Constants.Default.Q3.title, Constants.Default.Q3.question, Constants.Default.Q3.answers, Constants.Default.Q3.correctAnswer),
        Question(Constants.Default.Q4.title, Constants.Default.Q4.question, Constants.Default.Q4.answers, Constants.Default.Q4.correctAnswer),
        Question(Constants.Default.Q5.title, Constants.Default.Q5.question, Constants.Default.Q5.answers, Constants.Default.Q5.correctAnswer)
    ]
    
    var questionNumber = 0 //A reference to track which question the user is currently on.
    var score = 0 //A reference to track the score
    
    ///A function to set the question number and score back to 0. Useful for restarting a quiz back to the first question, and reseting the score value.
    mutating func resetQuestionNumberAndScore(){
        questionNumber = 0
        score = 0
    }
    
    ///A function to check the users answer against the actual answer, depending on which quiz there are using.
    mutating func checkAnswer(_ userAnswer:String) -> Bool {
        var actualAnswer = ""
        
        //Check the users answers for the Renal Quiz.
        if topic == Constants.renalString {
            actualAnswer = renalQuiz[questionNumber].correctAnswer //Reference the correct answer from the Renal Quiz.
            if userAnswer == actualAnswer {
                score += 1 //User got it right - Change background to green
                return true
            } else {
                return false //User got it wrong - Change background to red
            }
            
        //Check the users answer for the Rhuematology Quiz.
        } else if topic == Constants.rhuematologyString {
            actualAnswer = rhuematologyQuiz[questionNumber].correctAnswer //Reference the correct answer from the Rhuematology Quiz.
            if userAnswer == actualAnswer {
                score += 1 //User got it right - Change background to green
                return true
            } else {
                return false //User got it wrong - Change background to red
            }
            
        //Check the users answers for the Cardiovascular Quiz.
        } else if topic == Constants.cardiovascularString {
            actualAnswer = rhuematologyQuiz[questionNumber].correctAnswer //Reference the correct answer from the Cardiovascular Quiz.
            if userAnswer == actualAnswer {
                score += 1 //User got it right - Change background to green
                return true
            } else {
                return false //User got it wrong - Change background to red
            }
        } else { //Check the users answers against the default quiz (which is defined as the Rhuematology Quiz).
            actualAnswer = quiz[questionNumber].correctAnswer
            if userAnswer == actualAnswer {
                score += 1 //User got it right - Change background to green
                return true
            } else {
                return false //User got it wrong - Change background to red
            }
        }
    }
    
    ///A function to move the user to the next question of the quiz.
    mutating func nextQuestion() {

        //Validate the quiz by only showing the questions in the quiz. Array indexes start at 0, not at 1. Take into account of this offset.

        if questionNumber + 1 < quiz.count {
            questionNumber += 1 //Increment the questionNumber, therefore going to the next question of the quiz.
        } else {
            resetQuestionNumberAndScore()
            //print("Quiz done! Final Score: \(score)/\(quiz.count) .  Try again?")
        }
    }
    
    ///A function to get the question text from each question object from one of the quiz properties defined at the start of the struct.
    func getQuestionText() -> String {
        var questionText = ""
        
        if topic == Constants.renalString {
            questionText = renalQuiz[questionNumber].question
            
        } else if topic == Constants.rhuematologyString {
            questionText = rhuematologyQuiz[questionNumber].question
            
        } else if topic == Constants.cardiovascularString {
            questionText = cardiovascularQuiz[questionNumber].question
            
        } else {
            questionText = quiz[questionNumber].question
        }
        
        return questionText
    }
    
    ///A function that returns the progress for the progressBar UI, depending on which quiz the user is doing. This helps to the user visuallise their progress throughout the quiz.
    func getPercentageProgress() -> Float {
        var result:Float = 0 //The ratio of the 'questionNumber' to 'quiz.count,' expressed as a percentage.
        
        if topic == Constants.renalString {
            result = Float(questionNumber + 1) / Float(renalQuiz.count)
            
        } else if topic == Constants.rhuematologyString {
            result = Float(questionNumber + 1) / Float(rhuematologyQuiz.count)
            
        } else if topic == Constants.cardiovascularString {
            result = Float(questionNumber + 1) / Float(cardiovascularQuiz.count)
            
        } else {
            result = Float(questionNumber + 1) / Float(quiz.count)
        }
        
        return result
    }
    
    ///A function that returns the current score of the user, depending on which quiz the user is doing. The score is incremented from inside the checkAnswer function.
    func getScore() -> String {
        var scoreString = ""
        
        if topic == Constants.renalString {
            scoreString = "Score: \(score) / \(renalQuiz.count)"
            
        } else if topic == Constants.rhuematologyString {
            scoreString = "Score: \(score) / \(rhuematologyQuiz.count)"
            
        } else if topic == Constants.cardiovascularString {
            scoreString = "Score: \(score) / \(cardiovascularQuiz.count)"
            
        } else {
            scoreString = "Score: \(score) / \(quiz.count)"
        }

        return scoreString
    }
    
    ///A function that returns the title of each question. The title of each question defines what type of problem the question is asking.
    func getTitle() -> String{
        var titleString = ""
        
        if topic == Constants.renalString {
            titleString = renalQuiz[questionNumber].title
            
        } else if topic == Constants.rhuematologyString {
            titleString = rhuematologyQuiz[questionNumber].title
            
        } else if topic == Constants.cardiovascularString {
            titleString = cardiovascularQuiz[questionNumber].title
            
        } else {
            titleString = quiz[questionNumber].title
        }
        
        return titleString
    }
    
    ///A function that returns the 1st possible answer of a question.
    func getOptionA() -> String {
        var optionString = ""
        
        if topic == Constants.renalString {
            optionString = renalQuiz[questionNumber].answers[0]
            
        } else if topic == Constants.rhuematologyString {
            optionString = rhuematologyQuiz[questionNumber].answers[0]
            
        } else if topic == Constants.cardiovascularString {
            optionString = cardiovascularQuiz[questionNumber].answers[0]
            
        } else {
            optionString = quiz[questionNumber].answers[0]
        }
        
        return optionString
    }
    
    ///A function that returns the 2nd possible answer of a question.
    func getOptionB() -> String {
        var optionString = ""
        
        if topic == Constants.renalString {
            optionString = renalQuiz[questionNumber].answers[1]
            
        } else if topic == Constants.rhuematologyString {
            optionString = rhuematologyQuiz[questionNumber].answers[1]
            
        } else if topic == Constants.cardiovascularString {
            optionString = cardiovascularQuiz[questionNumber].answers[1]
            
        } else {
            optionString = quiz[questionNumber].answers[1]
        }
        
        return optionString
    }
    
    ///A function that returns the 3rd possible answer of a question.
    func getOptionC() -> String {
        var optionString = ""
        
        if topic == Constants.renalString {
            optionString = renalQuiz[questionNumber].answers[2]
            
        } else if topic == Constants.rhuematologyString {
            optionString = rhuematologyQuiz[questionNumber].answers[2]
            
        } else if topic == Constants.cardiovascularString {
            optionString = cardiovascularQuiz[questionNumber].answers[2]
            
        } else {
            optionString = quiz[questionNumber].answers[2]
        }
        
        return optionString
    }
    
    ///A function that returns the 4th possible answer of a question.
    func getOptionD() -> String {
        var optionString = ""
        
        if topic == Constants.renalString {
            optionString = renalQuiz[questionNumber].answers[3]
            
        } else if topic == Constants.rhuematologyString {
            optionString = rhuematologyQuiz[questionNumber].answers[3]
            
        } else if topic == Constants.cardiovascularString {
            optionString = cardiovascularQuiz[questionNumber].answers[3]
            
        } else {
            optionString = quiz[questionNumber].answers[3]
        }
        
        return optionString
    }
    
    ///A function that returns the 5th possible answer of a question.
    func getOptionE() -> String {
        var optionString = ""
        
        if topic == Constants.renalString {
            optionString = renalQuiz[questionNumber].answers[4]
            
        } else if topic == Constants.rhuematologyString {
            optionString = rhuematologyQuiz[questionNumber].answers[4]
            
        } else if topic == Constants.cardiovascularString {
            optionString = cardiovascularQuiz[questionNumber].answers[4]
        } else {
            optionString = quiz[questionNumber].answers[4]
        }
        
        return optionString
    }
    
    ///A function that returns the 6th possible answer of a question... Well, not really an answer, but it allows the user to skip the question if they don't know the answer.
    func getOptionF() -> String {
        let optionString = Constants.lastOptionString
        return optionString
    }
    
    ///A function the returns the topic that a question is from. So either Renal, Rhuematology or Cardiovascular.
    func getTopic() -> String {
        var topicString = ""
        
        if topic == Constants.renalString {
            topicString = Constants.renalString
            
        } else if topic == Constants.rhuematologyString {
            topicString = Constants.rhuematologyString
            
        } else if topic == Constants.cardiovascularString {
            topicString = Constants.cardiovascularString
            
        } else {
            topicString = Constants.rhuematologyString //Default quiz is the rhuematologyQuiz
        }
        
        return topicString
    }
    
}
