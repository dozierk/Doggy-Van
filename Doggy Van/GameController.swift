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

    
    @IBOutlet var Doggy: UIImageView!
    
    @IBOutlet weak var changeLabel: UILabel!
    
    // These are the word options that appear in the UILabel
    var gameString = ["dance", "eat", "drive", "run", "play", "sing", "sleep", "imagine", "beautiful", "laughing", "smiling", "crying", "jumping", "dolphin", "cat", "apple", "tree", "bird"]
   
 //   label.text = gameString[0]
    
  //  let gameString
    
    
    


    // The verb, adjective, and noun are the only options that could pertain to the label
    
    @IBAction func Verb(sender: UIButton) {
        
    }
    
    @IBAction func Adjective(sender: UIButton) {
        
    }

    @IBAction func Noun(sender: UIButton) {
        
        AVAudioPlayer.valueForKey("let dog bark when answer is incorrect")

    }
 
    // When the next button is pressed, the text in the label will change
    
    @IBAction func buttonPressed(sender: UIButton) {
        changeLabel.text = "dance", "eat", "drive", "run", "play", "sing", "sleep", "imagine", "beautiful", "laughing", "smiling", "crying", "jumping", "dolphin", "cat", "apple", "tree", "bird"
    }

}
