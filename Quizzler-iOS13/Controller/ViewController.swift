import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var optionEButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var optionFButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var optionAButton: UIButton!
    @IBOutlet weak var optionBButton: UIButton!
    @IBOutlet weak var optionCButton: UIButton!
    @IBOutlet weak var optionDButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var topicButton: UIButton!
    
    var quizBrain = QuizBrain() //Create a quizBrain object. This allows us to use the properties and methods of quizBrain in this class.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUIProperties() //Set up UI properties to ensure UI looks good (Meets my requirements)
        
        updateUI() //Start quiz with the first question
    }
    
    ///A function that defined how the app should behave when a user taps one of the possible answers of a question.
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        guard let userAnswer = sender.currentTitle else {return}
        
        let isAnswerCorrect = quizBrain.checkAnswer(userAnswer)
        sender.backgroundColor = isAnswerCorrect ? UIColor.green : UIColor.red //If isAnswerCorrect is true, set background color to green, otherwise set to red. (Ternany Operator)
        
        quizBrain.nextQuestion()
        updateUI()
        
    }
    
    ///A function that defined how the app should behave when a user decides to change the topic of the quiz. I.e, display an alert showing the different quizzes, and present one of those quizzes  in the UI.
    @IBAction func topicButtonPressed(_ sender: UIButton) {
        
        let alert = UIAlertController(title: Constants.alertTitle, message: Constants.alertMessage, preferredStyle: UIAlertController.Style.alert)  //Create an alert
        
        //When the user presses the "Renal" option, display the first question of the Renal Quiz.
        alert.addAction(UIAlertAction(title: Constants.renalString, style: UIAlertAction.Style.default, handler: { action in
            
            sender.setTitle(Constants.renalString, for: .normal) //Change to the topic button text to reflect on choosing the "Renal" quiz.
            self.quizBrain.topic = sender.currentTitle ?? "" //Inform the quizBrain that topic has changed to "Renal"
            DispatchQueue.main.async {
                self.updateUI() //Update the UI with the "Renal" Quiz.
            }
            self.quizBrain.resetQuestionNumberAndScore() //Start at the first question of the quiz, and reset the score.
        
        }))
        
        //When the user presses the "Rhuematology" option, display the first question of the Rhuematology Quiz.
        alert.addAction(UIAlertAction(title: Constants.rhuematologyString, style: UIAlertAction.Style.default, handler: { action in
            
            sender.setTitle(Constants.rhuematologyString, for: .normal) //Change to the topic button text to reflect on choosing the "Rhuematology" quiz.
            self.quizBrain.topic = sender.currentTitle ?? "" //Inform the quizBrain that topic has changed to "Rhuematology"
            DispatchQueue.main.async {
                self.updateUI() //Update the UI with the "Rhuematology" Quiz.
            }
            self.quizBrain.resetQuestionNumberAndScore() //Start at the first question of the quiz, and reset the score.
            
        }))
        
        //When the user presses the "Cardiovascular" option, display the first question of the Cardiovascular Quiz.
        alert.addAction(UIAlertAction(title: Constants.cardiovascularString, style: UIAlertAction.Style.default, handler: { action in
            
            sender.setTitle(Constants.cardiovascularString, for: .normal) //Change to the topic button text to reflect on choosing the "Cardiovascular" quiz.
            self.quizBrain.topic = sender.currentTitle ?? "" //Inform the quizBrain that topic has changed to "Cardiovascular"
            DispatchQueue.main.async {
                self.updateUI() //Update the UI with the ""Cardiovascular" Quiz.
            }
            self.quizBrain.resetQuestionNumberAndScore() //Start at the first question of the quiz, and reset the score.
            
        }))
        
        self.present(alert, animated: true, completion: nil) //Show the alert
        
    }
    
    ///A function that defines various UI element changes for the user, such as showing the user the question that needs to be answered, and the type of question they are answering.
    func updateUI(){
        
        //A series of function calls which sets various UI element properties values to the relevant information
        questionLabel.text = quizBrain.getQuestionText() //Display the question to the user.
        progressBar.progress = quizBrain.getPercentageProgress() //Display the progress to the user.
        scoreLabel.text = quizBrain.getScore() //Display the score to the user.
        titleLabel.text = quizBrain.getTitle() //Display the title of the question to the user.
        topicButton.setTitle(quizBrain.getTopic(), for: .normal) //Display the topic to the user.
        
        //Show all 6 possible answers for each question.
        optionAButton.setTitle(quizBrain.getOptionA(), for: .normal) //Show the 1st possible answer.
        optionBButton.setTitle(quizBrain.getOptionB(), for: .normal) //Show the 2nd possible answer.
        optionCButton.setTitle(quizBrain.getOptionC(), for: .normal) //Show the 3rd possible answer, etc.
        optionDButton.setTitle(quizBrain.getOptionD(), for: .normal)
        optionEButton.setTitle(quizBrain.getOptionE(), for: .normal)
        optionFButton.setTitle(quizBrain.getOptionF(), for: .normal)

        //Replace timer() with UIView.animate(). Pros: No need for @objc, and smoother animation.
        //Note that UIView.animate() disables button interactions temporarily, a good option for quiz apps but not for the Xylophone app.
        
        //Set the background color of their selected answer to clear for 0.4s.
        UIView.animate(withDuration: 0.4, animations: {
            self.optionAButton.backgroundColor = UIColor.clear
            self.optionBButton.backgroundColor = UIColor.clear
            self.optionCButton.backgroundColor = UIColor.clear
            self.optionDButton.backgroundColor = UIColor.clear
            self.optionEButton.backgroundColor = UIColor.clear
        })
        
        optionFButton.backgroundColor = UIColor.clear //Do not show green or red background for the last option

    }
    
    ///A function that defines properties required for setting up the UI. This function is called in viewDidLoad().
    func setupUIProperties(){
        
        //Set the rounded edge for the outer bar.
        progressBar.layer.cornerRadius = 8
        progressBar.clipsToBounds = true
        
        //Set the rounded edge for the inner bar.
        progressBar.layer.sublayers![1].cornerRadius = 8
        progressBar.subviews[1].clipsToBounds = true
        
        //Change the view of the button from a rectangle to a view with more rounded corners (Makes the red and green colors match the shape of the buttons).
        optionAButton.layer.cornerRadius = 0.3 * optionAButton.bounds.size.height
        optionBButton.layer.cornerRadius = 0.3 * optionBButton.bounds.size.height
        optionCButton.layer.cornerRadius = 0.3 * optionCButton.bounds.size.height
        optionDButton.layer.cornerRadius = 0.3 * optionDButton.bounds.size.height
        optionEButton.layer.cornerRadius = 0.3 * optionEButton.bounds.size.height
        optionFButton.layer.cornerRadius = 0.3 * optionFButton.bounds.size.height
        
        //Set option A Button properties
        optionAButton.titleLabel?.font = UIFont(name: Constants.optionButtonFont, size: 17)
        optionAButton.titleLabel?.adjustsFontSizeToFitWidth = true
        optionAButton.titleLabel?.numberOfLines = 3
        optionAButton.titleLabel?.minimumScaleFactor = 0.1
        optionAButton.clipsToBounds = true
        
        //Set option B Button properties
        optionBButton.titleLabel?.font = UIFont(name: Constants.optionButtonFont, size: 17)
        optionBButton.titleLabel?.adjustsFontSizeToFitWidth = true
        optionBButton.titleLabel?.numberOfLines = 3
        optionBButton.titleLabel?.minimumScaleFactor = 0.1
        optionBButton.clipsToBounds = true
        
        //Set option C Button properties
        optionCButton.titleLabel?.font = UIFont(name: Constants.optionButtonFont, size: 17)
        optionCButton.titleLabel?.adjustsFontSizeToFitWidth = true
        optionCButton.titleLabel?.numberOfLines = 3
        optionCButton.titleLabel?.minimumScaleFactor = 0.1
        optionCButton.clipsToBounds = true
        
        //Set option D Button properties
        optionDButton.titleLabel?.font = UIFont(name: Constants.optionButtonFont, size: 17)
        optionDButton.titleLabel?.adjustsFontSizeToFitWidth = true
        optionDButton.titleLabel?.numberOfLines = 3
        optionDButton.titleLabel?.minimumScaleFactor = 0.1
        optionDButton.clipsToBounds = true
        
        //Set option E Button properties
        optionEButton.titleLabel?.font = UIFont(name: Constants.optionButtonFont, size: 17)
        optionEButton.titleLabel?.adjustsFontSizeToFitWidth = true
        optionEButton.titleLabel?.numberOfLines = 3
        optionEButton.titleLabel?.minimumScaleFactor = 0.1
        optionEButton.clipsToBounds = true
        
        //Set option F Button properties
        optionFButton.titleLabel?.font = UIFont(name: Constants.optionButtonFont, size: 17)
        
        //Set topic button properties
        topicButton.titleLabel?.font = UIFont(name: Constants.optionButtonFont, size: 17)
        topicButton.titleLabel?.adjustsFontSizeToFitWidth = true
        topicButton.titleLabel?.numberOfLines = 2
        topicButton.titleLabel?.minimumScaleFactor = 0.05
        topicButton.clipsToBounds = true
        
    }
    
}

