import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
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
        
        //Start quiz with the first question
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        guard let userAnswer = sender.currentTitle else {return}
        
        let isAnswerCorrect = quizBrain.checkAnswer(userAnswer)
        sender.backgroundColor = isAnswerCorrect ? UIColor.green : UIColor.red //If isAnswerCorrect is true, set background color to green, otherwise set the background to red. (Ternany Operator)
        
        quizBrain.nextQuestion()
        updateUI()
        
    }
    
    func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getPercentageProgress()
        scoreLabel.text = quizBrain.getScore()

        //Replace timer() with UIView.animate(). Pros: No need for @objc, and smoother animation.
        //Note that UIView.animate() disables button interactions temporarily, a good option for quiz apps but not for the Xylophone app.

        UIView.animate(withDuration: 0.4, animations: {
          self.trueButton.backgroundColor = UIColor.clear
          self.falseButton.backgroundColor = UIColor.clear
        })

    }
    
}

