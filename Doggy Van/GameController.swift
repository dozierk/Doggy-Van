//
//  ViewController.swift
//  Doggy Van
//
//  Created by kayla dozier on 2/12/16.
//  Copyright © 2016 kayla dozier. All rights reserved.
//

import UIKit
import AVFoundation
import CoreGraphics
import GameKit


/** The primary ViewController for the Game. */
class GameController: UIViewController {
    
    /// The data source for the Test.
    var words = [Word]() {
        didSet {
            guard words.count > 0 else {
                print("Just the words initializer.")
                return
            }
            
            currentWordIndex = 0
        }
    }
    
    /// Tracks the index of the global Array used as a Model Object.
    var currentWordIndex = 0 {
        willSet {
            guard isViewLoaded else { return }
            // Whenever the index is changed, the label text is updated to reflect
            changeLabel.text = words[newValue].rawValue
        }
    }
    
    @IBOutlet weak var verbButton: UIButton!
    @IBOutlet weak var adjectiveButton: UIButton!
    @IBOutlet weak var nounButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var changeLabel: UILabel!
    @IBOutlet weak var answerCorrect: UILabel!
    @IBOutlet weak var answerIncorrect: UILabel!
    
    @MainActor override func viewDidLoad() {
        super.viewDidLoad()
        
        // self.view!.backgroundColor = UIColor.cyan()
        
        imageView.animationImages = [ #imageLiteral(resourceName: "dogpic1"), #imageLiteral(resourceName: "Dogeyeclose1"), #imageLiteral(resourceName: "Dogtailleft1"), #imageLiteral(resourceName: "Dogtailright1")]
        imageView.animationDuration = 0.7
        imageView.startAnimating()
        changeLabel.text = words.first?.rawValue
    }
    
    // All @IBActions contain similar conditional statements that recognize whether the word is a verb, adjective, or noun.
    @IBAction func answerSelected(_ sender: UIButton) {
        let currentWord = words[currentWordIndex]
        switch sender {
        case verbButton: answerFeedback(isCorrect: currentWord.isVerb)
        case adjectiveButton: answerFeedback(isCorrect: currentWord.isAdjective)
        default: answerFeedback(isCorrect: currentWord.isNoun)
        }
    }
    
    // When the next button is pressed, the text in the UIlabel will change.
    @IBAction func nextWord(_ sender: UIButton) {
        
        // Make sure we didn't just answer the last word, if so, end the game.
        guard currentWordIndex < words.count - 1 else {
            gameOver()
            return
        }
        
        // Increments the index that we're referencing in the global Array constant.
        currentWordIndex = (currentWordIndex + 1)
        
        // Rehide all of the feedback.
        answerCorrect.isHidden = true
        answerIncorrect.isHidden = true
        verbButton.isEnabled = true
        adjectiveButton.isEnabled = true
        nounButton.isEnabled = true
        sender.isHidden = true
    }
    
    /// Checks if the answer is correct or incorrect and provides visual feedback.
    func answerFeedback(isCorrect: Bool) {
        
        verbButton.isEnabled = false
        adjectiveButton.isEnabled = false
        nounButton.isEnabled = false
        nextButton.isHidden = false
        
        let currentWord = words[currentWordIndex]
        
        if isCorrect {
            answerCorrect.text = "CORRECT"
            answerCorrect.isHidden = false
            answerIncorrect.isHidden = true
            
        } else {
            answerIncorrect.text = "INCORRECT"
            answerIncorrect.isHidden = false
            answerCorrect.isHidden = true
        }
    }
    
    //Func created to end game.
    func gameOver() {
        performSegue(withIdentifier: "Done", sender: nil)
    }
}