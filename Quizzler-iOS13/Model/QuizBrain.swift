///In accordance to the MVC pattern, this structure handles the logic and data of the app, as well as the other files in the Model folder.
struct QuizBrain {
    
   var topic = "" //This property is set when a user selects a topic from the topicButton in the ViewController, thus showing quiz questions based on a topic of their choice.
    
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
        Question(Constants.Cardiovascular.Q6.title, Constants.Cardiovascular.Q6.question, Constants.Cardiovascular.Q6.answers, Constants.Cardiovascular.Q6.correctAnswer)
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
        var actualAnswer = "" //This value will be determined based on the topic of the quiz.
        
        //Check the users answers for the Renal Quiz.
        if topic == Constants.renalString {
            
            actualAnswer = renalQuiz[questionNumber].correctAnswer //Reference the correct answer from the Renal Quiz.
            
            if userAnswer == actualAnswer {
                score += 1 //Incrementing score indicates that the user has got the question correct.
                return true //User got it right - Change background to green
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
            
            actualAnswer = cardiovascularQuiz[questionNumber].correctAnswer //Reference the correct answer from the Cardiovascular Quiz.
            
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

        //Validate the quiz by only showing the questions in the quiz. Array indexes start at 0, not at 1, so take this offset into account.
        
        //If the user HAS NOT reached the end of the quiz, go to the next question (IF clause). Otherwise, when the user HAS reached the end of the quiz, go back to the first question (ELSE clause).
        
        if topic == Constants.renalString {
            
            if questionNumber + 1 < renalQuiz.count {
                questionNumber += 1 //Increment the questionNumber, therefore going to the next question of the quiz.
                
            } else {
                resetQuestionNumberAndScore()
            }
            
        } else if topic == Constants.rhuematologyString {
            
            if questionNumber + 1 < rhuematologyQuiz.count {
                questionNumber += 1 //Increment the questionNumber, therefore going to the next question of the quiz.
                
            } else {
                resetQuestionNumberAndScore()
            }
            
        } else if topic == Constants.cardiovascularString {
            
            if questionNumber + 1 < cardiovascularQuiz.count {
                questionNumber += 1 //Increment the questionNumber, therefore going to the next question of the quiz.
                
            } else {
                resetQuestionNumberAndScore()
            }
            
        } else {
            if questionNumber + 1 < quiz.count {
                questionNumber += 1 //Increment the questionNumber, therefore going to the next question of the quiz.
                
            } else {
                resetQuestionNumberAndScore()
            }
        }
        
    }
    
    ///A function to get the question text from each question object from one of the quiz properties defined at the start of the struct.
    func getQuestionText() -> String {
        var questionText = "" //The actual question will depend on which quiz the user is doing. Update this value depending on which quiz the user is doing.
        
        if topic == Constants.renalString {
            questionText = renalQuiz[questionNumber].question //If the user is doing the "Renal" quiz, assign the questionText to the "Renal" questions.
            
        } else if topic == Constants.rhuematologyString {
            questionText = rhuematologyQuiz[questionNumber].question //If the user is doing the "Rhuematology" quiz, assign the questionText to the "Rhuematology" questions.
            
        } else if topic == Constants.cardiovascularString {
            questionText = cardiovascularQuiz[questionNumber].question //If the user is doing the "Cardiovascular" quiz, assign the questionText to the "Cardiovascular" questions.
            
        } else {
            questionText = quiz[questionNumber].question //Otherwise, assign the questionText to the Default questions.
        }
        
        return questionText
    }
    
    ///A function that returns the progress for the progressBar UI, depending on which quiz the user is doing. This helps to the user visuallise their progress throughout the quiz.
    func getPercentageProgress() -> Float {
        var result:Float = 0 //A reference to the ratio of the 'questionNumber' to 'quiz.count.' Its value depends on the total number of questions in a given quiz.
        
        if topic == Constants.renalString {
            result = Float(questionNumber + 1) / Float(renalQuiz.count) //Calculate the progress based on the total number of "Renal" questions.
            
        } else if topic == Constants.rhuematologyString {
            result = Float(questionNumber + 1) / Float(rhuematologyQuiz.count) //Calculate the progress based on the total number of "Rhuematology" questions.
            
        } else if topic == Constants.cardiovascularString {
            result = Float(questionNumber + 1) / Float(cardiovascularQuiz.count) //Calculate the progress based on the total number of "Cardiovascular" questions.
            
        } else {
            result = Float(questionNumber + 1) / Float(quiz.count) //Calculate the progress based on the total number of "Default" questions.
        }
        
        return result
    }
    
    ///A function that returns the current score of the user, depending on which quiz the user is doing. The score is incremented from inside the checkAnswer function.
    func getScore() -> String {
        var scoreString = "" //The value of the score will depend on the which quiz the user is doing. Update this value depending on which quiz the user is doing.
        
        if topic == Constants.renalString {
            scoreString = "Score: \(score) / \(renalQuiz.count)" //Calculate the score based on the total number of "Renal" questions.
            
        } else if topic == Constants.rhuematologyString {
            scoreString = "Score: \(score) / \(rhuematologyQuiz.count)" //Calculate the score based on the total number of "Rhuematology" questions.
            
        } else if topic == Constants.cardiovascularString {
            scoreString = "Score: \(score) / \(cardiovascularQuiz.count)" //Calculate the score based on the total number of "Cardiovascular" questions.
            
        } else {
            scoreString = "Score: \(score) / \(quiz.count)" //Calculate the score based on the total number of "Default" questions.
        }

        return scoreString
    }
    
    ///A function that returns the title of each question. The title of each question defines what type of problem the question is asking.
    func getTitle() -> String{
        var titleString = "" //A reference to the title of each question. Titles change depending on the question, hence its value will change depending on the question.
        
        if topic == Constants.renalString {
            titleString = renalQuiz[questionNumber].title //Assign the title to one of the "Renal" titles
            
        } else if topic == Constants.rhuematologyString {
            titleString = rhuematologyQuiz[questionNumber].title //Assign the title to one of the "Rhuematology" titles
            
        } else if topic == Constants.cardiovascularString {
            titleString = cardiovascularQuiz[questionNumber].title //Assign the title to one of the "Cardiovascular" titles
            
        } else {
            titleString = quiz[questionNumber].title //Assign the title to one of the "Default" titles
        }
        
        return titleString
    }
    
    ///A function that returns the 1st possible answer of a question.
    func getOptionA() -> String {
        var optionString = "" //A reference to the 1st possible answer of a given quiz question. This will change depending on which quiz the user is doing.
        
        if topic == Constants.renalString {
            optionString = renalQuiz[questionNumber].answers[0] //Assign optionString to the 1st possible answer for a particular "Renal" Quiz quiestion.
            
        } else if topic == Constants.rhuematologyString {
            optionString = rhuematologyQuiz[questionNumber].answers[0] //Assign optionString to the 1st possible answer for a particular Rhuematology" Quiz quiestion.
            
        } else if topic == Constants.cardiovascularString {
            optionString = cardiovascularQuiz[questionNumber].answers[0] //Assign optionString to the 1st possible answer for a particular "Cardiovascular" Quiz quiestion.
            
        } else {
            optionString = quiz[questionNumber].answers[0] //Assign optionString to the 1st possible answer for a particular "Default" Quiz quiestion.
        }
        
        return optionString
    }
    
    ///A function that returns the 2nd possible answer of a question.
    func getOptionB() -> String {
        var optionString = "" //A reference to the 2nd possible answer of a given quiz question. This will change depending on which quiz the user is doing.
        
        if topic == Constants.renalString {
            optionString = renalQuiz[questionNumber].answers[1] //Assign optionString to the 2nd possible answer for a particular "Renal" Quiz quiestion.
            
        } else if topic == Constants.rhuematologyString {
            optionString = rhuematologyQuiz[questionNumber].answers[1] //Assign optionString to the 2nd possible answer for a particular Rhuematology" Quiz quiestion.
            
        } else if topic == Constants.cardiovascularString {
            optionString = cardiovascularQuiz[questionNumber].answers[1] //Assign optionString to the 2nd possible answer for a particular "Cardiovascular" Quiz quiestion.
            
        } else {
            optionString = quiz[questionNumber].answers[1] //Assign optionString to the 2nd possible answer for a particular "Default" Quiz quiestion.
        }
        
        return optionString
    }
    
    ///A function that returns the 3rd possible answer of a question.
    func getOptionC() -> String {
        var optionString = "" //A reference to the 3rd possible answer of a given quiz question. This will change depending on which quiz the user is doing.
        
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
        var optionString = "" //A reference to the 4th possible answer of a given quiz question. This will change depending on which quiz the user is doing.
        
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
        var optionString = "" //A reference to the 5th possible answer of a given quiz question. This will change depending on which quiz the user is doing.
        
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
        let optionString = Constants.lastOptionString //A reference for users to skip a question.
        return optionString
    }
    
    ///A function the returns the topic that a question is from. So either Renal, Rhuematology or Cardiovascular.
    func getTopic() -> String {
        var topicString = "" //A reference to the topic of each question
        
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
