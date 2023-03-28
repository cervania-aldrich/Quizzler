import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var falseButton: UIButton!
    
    let quiz = [
        ["1 x 5 = 5", "True"],
        ["6 + 3 = 7", "False"],
        ["3 + 3 = 9", "False"]
    ]
    
    var questionNumber = 0 //A reference to track the question the user is reading
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressBar.layer.cornerRadius = 8
        progressBar.clipsToBounds = true
        
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        //Check the answer they picked against the real answer (From a 2D Array)
        
        let userAnswer = sender.currentTitle!
        let actualAnswer = quiz[questionNumber][0]
        
        if userAnswer == actualAnswer {
            print("Correct!")
        } else {
            print("Failure")
        }
        
        //Validate the quiz by only showing the questions in the quiz. Array indexes start at 0, not at 1. Take into account of this offset.
        
        if questionNumber != quiz.count - 1 {
            questionNumber += 1
            updateUI()
        } else {
            questionNumber = 0
            updateUI()
        }
        
    }
    
    func updateUI(){
        questionLabel.text = quiz[questionNumber][0]
    }
    
}

