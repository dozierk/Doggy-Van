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
    
    //Universal conditional statement created for Verb, Adjective, and Noun actions. The logic used checks if the answer is correct or incorrect and ends the game once all 30 words have been answered.
    func answerFeedback(isCorrect: Bool) {
        
        VerbButton.isEnabled = false
        AdjectiveButton.isEnabled = false
        NounButton.isEnabled = false
        NextButton.isHidden = false
        
        let currentWord = words[currentWordIndex]
        
//        if currentWord == words.last {
//
//            gameOver()
//
//        }
        
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        Word.source(with: 30) { (results) in
            DispatchQueue.main.async {
                self.words = results
            }
        }
    }
    
    
    //Func created to end game.
    func gameOver() {
        
        performSegue(withIdentifier: "Done", sender: nil)
        
    }
    
    @IBOutlet weak var VerbButton: UIButton!
    
    @IBOutlet weak var AdjectiveButton: UIButton!
    
    @IBOutlet weak var NounButton: UIButton!
    
    @IBOutlet weak var NextButton: UIButton!
    
    
    /** Local array of words (temporarily) being used as a source for the Test. */
    var words = [Word]() {
        didSet {
            guard words.count > 0 else {
                print("Just the words initializer.")
                return
            }
            
            currentWordIndex = 0
        }
    }
    
    /** Tracks the index of the global Array used as a Model Object.
     *
     * Functional: Whenever the index is changed, the label text is updated to reflect it.
     */

   //Finish algorithms for returning words
        var currentWordIndex = 0 {
            
            willSet {
                
                changeLabel.text = words[newValue].description
                
            }
        }
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the initial value of the label text.
        
        
        //        self.view!.backgroundColor = UIColor.cyan()
        
        imageView.animationImages = [
            
            UIImage(named: "dogpic1")!,
            UIImage(named: "Dogeyeclose1")!,
            UIImage(named: "Dogtailleft1")!,
            UIImage(named: "Dogtailright1")!
        ]
        
        imageView.animationDuration = 0.7
        imageView.startAnimating()
    }
    
    
    // The verb, adjective, and noun are the only options that could pertain to the label.
    @IBOutlet weak var changeLabel: UILabel!
    
    
    //    All @IBActions contain similar conditional statements that recognize whether the word is a verb, adjective, or noun.
    @IBAction func Verb(_ sender: UIButton) {
        
        let currentWord = words[currentWordIndex]
        
        print (currentWord.partOfSpeech)
        
        answerFeedback(isCorrect: currentWord.isVerb)
    }
    
    
    
    @IBAction func Adjective(_ sender: UIButton) {
        
        let currentWord = words[currentWordIndex]
        
        print (currentWord.partOfSpeech)
        
        answerFeedback(isCorrect: currentWord.isAdjective)
        
    }
    
    @IBAction func Noun(_ sender: UIButton) {
        
        let currentWord = words[currentWordIndex]
        
        print (currentWord.partOfSpeech)
        
        answerFeedback(isCorrect: currentWord.isNoun)
    }
    
    
    
    @IBOutlet weak var answerCorrect: UILabel!
    
    @IBOutlet weak var answerIncorrect: UILabel!
    
    // When the next button is pressed, the text in the UIlabel will change.
    
    @IBAction func NextWord(_ sender: UIButton) {
        
        guard currentWordIndex < words.count - 1 else {
            gameOver()
            return
        }

        // Increments the index that we're referencing in the global Array constant.  Modulo/Remainder is set for the total amount in the Array so the index will never go out of range, it will just go back to 0 and continue incrementing.
        currentWordIndex = (currentWordIndex + 1)
        
        print("We're at \(currentWordIndex) of \(words.endIndex) words.")
        
        
        answerCorrect.isHidden = true
        answerIncorrect.isHidden = true
        VerbButton.isEnabled = true
        AdjectiveButton.isEnabled = true
        NounButton.isEnabled = true
        sender.isHidden = true
        
        
        
        
    }
    
}




