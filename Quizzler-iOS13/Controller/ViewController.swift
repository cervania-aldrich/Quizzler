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
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUIProperties() //Set up UI properties to ensure UI looks good (Meets my requirements)
        
        //Start quiz with the first question
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        guard let userAnswer = sender.currentTitle else {return}
        
        let isAnswerCorrect = quizBrain.checkAnswer(userAnswer)
        sender.backgroundColor = isAnswerCorrect ? UIColor.green : UIColor.red //If isAnswerCorrect is true, set background color to green, otherwise set to red. (Ternany Operator)
        
        quizBrain.nextQuestion()
        updateUI()
        
    }
    
    @IBAction func topicButtonPressed(_ sender: UIButton) {
        
        // create the alert
        let alert = UIAlertController(title: "Select topic", message: "What type of questions do you want to review?", preferredStyle: UIAlertController.Style.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: Constants.renalString, style: UIAlertAction.Style.default, handler: { action in
            sender.setTitle(Constants.renalString, for: .normal)
            self.quizBrain.topic = sender.currentTitle ?? ""
            DispatchQueue.main.async {
                self.updateUI()
            }
            
        }))
        
        alert.addAction(UIAlertAction(title: Constants.rhuematologyString, style: UIAlertAction.Style.default, handler: { action in
            sender.setTitle(Constants.rhuematologyString, for: .normal)
            self.quizBrain.topic = sender.currentTitle ?? ""
            DispatchQueue.main.async {
                self.updateUI()
            }
        }))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    func updateUI(){
        
        //If Renal, show Renal questions. If Rheumatology, show Rheumatology questions. Otherwise, show Renal Questions.
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getPercentageProgress()
        scoreLabel.text = quizBrain.getScore()
        titleLabel.text = quizBrain.getTitle()
        topicButton.setTitle(quizBrain.getTopic(), for: .normal)
        
        //Set the titles of each buttons, so that all 6 multiple choice options are in the UI.
        optionAButton.setTitle(quizBrain.getOptionA(), for: .normal)
        optionBButton.setTitle(quizBrain.getOptionB(), for: .normal)
        optionCButton.setTitle(quizBrain.getOptionC(), for: .normal)
        optionDButton.setTitle(quizBrain.getOptionD(), for: .normal)
        optionEButton.setTitle(quizBrain.getOptionE(), for: .normal)
        optionFButton.setTitle(quizBrain.getOptionF(), for: .normal)

        //Replace timer() with UIView.animate(). Pros: No need for @objc, and smoother animation.
        //Note that UIView.animate() disables button interactions temporarily, a good option for quiz apps but not for the Xylophone app.

        UIView.animate(withDuration: 0.5, animations: {
            self.optionAButton.backgroundColor = UIColor.clear
            self.optionBButton.backgroundColor = UIColor.clear
            self.optionCButton.backgroundColor = UIColor.clear
            self.optionDButton.backgroundColor = UIColor.clear
            self.optionEButton.backgroundColor = UIColor.clear
            self.optionFButton.backgroundColor = UIColor.clear
    
        })

    }
    
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

