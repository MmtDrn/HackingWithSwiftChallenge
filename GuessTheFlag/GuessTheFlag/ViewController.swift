import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    @IBOutlet var scoreBar: UIBarButtonItem!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGray.cgColor
        
        button2.layer.borderWidth = 1
        button2.layer.borderColor = UIColor.lightGray.cgColor
        
        button3.layer.borderWidth = 1
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        countries += ["estonia","france","germany","ireland","italy","monaco","nigeria","poland","russia","spain","uk","us"]
        
        askQuestion()
        scoreBar.title = "Your score \(score)"
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        index += 1
        var title:String
        
        if sender.tag == correctAnswer {
            title = "CORRECT"
            score += 1
        }else{
            title = "Wrong! That’s the flag of \(countries[sender.tag].uppercased())"
            score -= 1
        }
        
        if index == 10 {
            let alert = UIAlertController(title: "FINISHED", message: "Your final score is \(score)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { UIAlertAction in
                self.score = 0
                self.index = 0
                self.scoreBar.title = "Your score \(self.score)"
                self.askQuestion()
            }))
            
            present(alert, animated: true)
        }else{
            let alert = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { UIAlertAction in
                self.askQuestion()
                self.scoreBar.title = "Your score \(self.score)"
            }))
            
            present(alert, animated: true)
        }
        
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = "\(countries[correctAnswer].uppercased()) ?"
    }

}


