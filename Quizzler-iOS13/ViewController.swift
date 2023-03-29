import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var falseButton: UIButton!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set the rounded edge for the outer bar.
        progressBar.layer.cornerRadius = 8
        progressBar.clipsToBounds = true
        
        //Set the rounded edge for the inner bar.
        progressBar.layer.sublayers![1].cornerRadius = 8
        progressBar.subviews[1].clipsToBounds = true
        
        //Change the view of the button from a rectangle to a view with more rounded corners (Makes the red and green colors match the shape of the buttons).
        
        trueButton.layer.cornerRadius = 0.3 * trueButton.bounds.size.height
        falseButton.layer.cornerRadius = 0.3 * falseButton.bounds.size.height
        
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        //Check the answer they picked against the real answer (From a 2D Array)
        
        let userAnswer = sender.currentTitle!
        let actualAnswer = quiz[questionNumber].answer
        
        if userAnswer == actualAnswer {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        //Validate the quiz by only showing the questions in the quiz. Array indexes start at 0, not at 1. Take into account of this offset.
        
        if questionNumber != quiz.count - 1 {
            questionNumber += 1 //Increment the questionNumber, therefore going to the next question of the quiz.
        } else {
            questionNumber = 0 //Reset the questionNumber, therefore starting back at the first question of the quiz.
        }
        
        updateUI()
        
    }
    
    func updateUI(){
        questionLabel.text = quiz[questionNumber].text //Access the text property of the (Question) object stored at quiz[questionNumber].
        progressBar.progress = percentageProgress()
        
        //Replace timer() with UIView.animate(). Pros: No need for @objc, and smoother animation.
        //Note that UIView.animate() disables button interactions temporarily, a good option for quiz apps but not for the Xylophone app.
        
        UIView.animate(withDuration: 0.8, animations: {
          self.trueButton.backgroundColor = UIColor.clear
          self.falseButton.backgroundColor = UIColor.clear
        })
        
    }
    
    func percentageProgress() -> Float {
        let result = Float(questionNumber + 1) / Float(quiz.count) //The ratio of the 'questionNumber' to 'quiz.count,' expressed as a percentage.
        return result
    }
    
}

