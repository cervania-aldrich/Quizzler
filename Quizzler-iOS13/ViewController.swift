import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var falseButton: UIButton!
    
    let quiz = [
        "Why are you gae?",
        "Who says I'm gae?",
        "You r gae"
    ]
    
    var questionNumber = 0 //A reference to track the question the user is reading
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressBar.layer.cornerRadius = 8
        progressBar.clipsToBounds = true
        updateUI()
        
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        questionNumber += 1
        updateUI()
    }
    
    func updateUI(){
        questionLabel.text = quiz[questionNumber]
    }
    
}

