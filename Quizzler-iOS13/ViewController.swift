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
        
        progressBar.layer.cornerRadius = 8
        progressBar.clipsToBounds = true
        
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        //Check the answer they picked against the real answer (From a 2D Array)
        
        let userAnswer = sender.currentTitle!
        let actualAnswer = quiz[questionNumber].answer
        
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
        questionLabel.text = quiz[questionNumber].text //Access the text property of the (Question) object stored at quiz[questionNumber].
    }
    
}

