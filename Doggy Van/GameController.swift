//
//  ViewController.swift
//  Doggy Van
//
//  Created by kayla dozier on 2/12/16.
//  Copyright © 2016 kayla dozier. All rights reserved.
//

import UIKit
import AVFoundation


class GameController: UIViewController {
    
    
    /** Tracks the index of the global Array we're using as a Model Object.
     *
     * Functional: Whenever the index is changed, the label text is updated to reflect it.
     */
    var currentWordIndex = 0 {
        willSet {
//            changeLabel.text = words[newValue]
        }
    }

    
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view!.backgroundColor = UIColor.whiteColor()
        
        
        imageView.animationImages = [
            
  //        UIImage(named: "dogpic1")!,
            UIImage(named: "Dogeyeclose1")!,
            UIImage(named: "Dogtailleft1")!,
            UIImage(named: "Dogtailright1")!
        ]
        
        imageView.animationDuration = 0.7
        imageView.startAnimating()
    }
    
    
    //    var answerCorrect = answerCorrect.changeLabel()
    
    
    // The verb, adjective, and noun are the only options that could pertain to the label.
    @IBOutlet weak var changeLabel: UILabel!
    
    
    @IBAction func Verb(sender: UIButton) {
        
//        changeLabel.text
        
//        dance, sing, eat, jump, sleep, play, scream, slide, bounce, carry
        
    }
    
    @IBAction func Adjective(sender: UIButton) {
        
//        small, long, last, angry, big, fast, quiet, loud, wet, empty
        
    }
    
    @IBAction func Noun(sender: UIButton) {
        
//        changeLabel.text = "Cat", "Dog", "Ball", "Dress", "Balloon", "Book", "Boy", "Girl", "Airplane", "Apple"
    }
    
    // When the next button is pressed, the text in the UIlabel will change.
    @IBAction func buttonPressed(sender: UIButton) {
        
       var changeLabel = ["Dance", "Small", "Balloon", "Dress", "Big", "Loud", "Slide", "Bounce", "Book", "Airplane", "Quiet", "Ball", "Empty", "Cat", "Dog", "Angry", "Scream", "Last", "Fast", "Eat", "Long", "Jump", "Apple", "Sleep", "Play", "Wet", "Carry", "Girl", "Boy", "Sing"]
        
        var firstItem = changeLabel[0]
        var secondItem = changeLabel[1]
        
        // Increments the index that we're referencing in the global Array constant.  Modulo/Remainder is set for the total amount in the Array so the index will never go out of range, it will just go back to 0 and continue incrementing.
//        currentWordIndex = (currentWordIndex + 1) % words.count


        
        print("The list contains \(changeLabel.count) 30 words.")
        // Prints "The shopping list contains 2 items."
        
//        for (index, value) in changeLabel.enumerate() {
//            print("Item \(index + 1): \(value)")
//        }
    
//    var stringToDisplay: String = listOfWords.componentsJoinedByString("\n")
//    wordList.text = stringToDisplay


//    }
//     Override to allow for dragging the button.
//     override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        super.touchesMoved(touches, withEvent: event)
//
//}


    }


}