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


/** The primary ViewController for the Game. */
class GameController: UIViewController {
    
    /** Local array of words (temporarily) being used as a source for the Test. */
    let words = Source.getWords(amount: 30)
    
    /** Tracks the index of the global Array used as a Model Object.
     *
     * Functional: Whenever the index is changed, the label text is updated to reflect it.
     */
    var currentWordIndex = 0 {
        willSet {
            changeLabel.text = words[newValue].string
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the initial value of the label text.
        changeLabel.text = words[currentWordIndex].string
        
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
        
        print (currentWord.type)
        
        if currentWord.isVerb {
            
            //            print("correct")
            answerCorrect.text = "CORRECT"
            answerCorrect.isHidden = false
            
        } else {
            
            //            print("incorect")
            answerIncorrect.text = "INCORRECT"
            answerIncorrect.isHidden = false
        }
        
    }
    
    //        func puzzleEnded(solved: Bool) {
    //            timer.invalidate()
    //            gameSpace.userInteractionEnabled = false
    //            UIView.animateWithDuration(0.4) { () -> Void in
    //                self.view.backgroundColor = solved ? UIColor.greenColor() : UIColor.redColor()
    
    @IBAction func Adjective(_ sender: UIButton) {
        
        
        let currentWord = words[currentWordIndex]
        
        print (currentWord.type)
        
        if currentWord.isAdjective {
            
            //            print("correct")
            answerCorrect.text = "CORRECT"
            answerCorrect.isHidden = false
            
        } else {
            
            //            print("incorect")
            answerIncorrect.text = "INCORRECT"
            answerIncorrect.isHidden = false
        }
        
    }
    
    @IBAction func Noun(_ sender: UIButton) {
        let currentWord = words[currentWordIndex]
        
        print (currentWord.type)
        
        if currentWord.isNoun {
            
            //            print("correct")
            answerCorrect.text = "CORRECT"
            answerCorrect.isHidden = false
            
        } else {
            
            //            print("incorect")
            answerIncorrect.text = "INCORRECT"
            answerIncorrect.isHidden = false
        }
        
    }
    
    @IBOutlet weak var answerCorrect: UILabel!
    
    @IBOutlet weak var answerIncorrect: UILabel!
    
    // When the next button is pressed, the text in the UIlabel will change.
    
    @IBAction func NextWord(_ sender: UIButton) {
        
        // Increments the index that we're referencing in the global Array constant.  Modulo/Remainder is set for the total amount in the Array so the index will never go out of range, it will just go back to 0 and continue incrementing.
        currentWordIndex = (currentWordIndex + 1) % words.count
        
        print("The list contains \(words.count) 30 words.")
        
        answerCorrect.isHidden = true
        answerIncorrect.isHidden = true
        
        //       changeLabel.layer.cornerRadius = 2
        //       changeLabel.layer.borderColor = UIColor.grayColor().CGColor
        //       changeLabel.layer.borderWidth = 2.0
    }
    
    
}

