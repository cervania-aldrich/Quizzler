struct QuizBrain {
    
    let quiz = [
        MultiQuestion(title: "Distress",
                      question: "A 21-year old woman complains of urinary frequency, nocturia, consipation and polydipsia. Her symptoms started 2 weeks ago and prior to this she would urinate twice a day and never at night. She has also noticed general malaise and some pain in her left flank. A urine dipstick is normal. The most appropriate investigation is:",
                      answers: ["Serum phosphate", "Serum calcium", "Parathyroid hormone (PTH)", "Plasma glucose", "Serum potassium"],
                      correctAnswer: "Serum calcium"),
        MultiQuestion(title: "Breathlessness",
                      question: "A 58 year-old man presents with breathlessness, he reports feeling unwell over the last three months with nausea, vomiting and difficulty breathing. You notice his ankles are swollen and he has bruises on his arms. The patient mentions he has not been urinating as often as normal. The most appropriate investigation is:",
                      answers: ["Urine microscopy", "Renal ultrasound", "Serum electrolytes, urea and creatinine", "Renal biospy", "Chest x-ray"],
                      correctAnswer: "Serum electrolytes, urea and creatinine"),
        MultiQuestion(title: "Abdominal Pain",
                      question: "A 24-year old man presents with a four-month history of abdominal pain which has been getting worse. The patient describes the pain as generalized, dull in character and does not radiate but often occurs alongside loin pain. An irregular mass is palpable in both flanks and a mid-systolic click can be auscultated. The most appropriate investigation is:",
                      answers: ["Increase oral hypoglycaemic dosage", "Angiotensin II receptor agonist (or blocker)", "Start cholesterol lowering therapy", "Start ACE inhibitors", "Start renal dialysis"],
                      correctAnswer: "Start ACE inhibitors")
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
