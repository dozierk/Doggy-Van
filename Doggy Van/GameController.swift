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
    
    
    var gameString = ["dance", "eat", "drive", "run", "play", "sing", "sleep", "imagine", "beautiful", "laughing", "smiling", "crying", "jumping", "dolphin", "cat", "apple", "tree", "bird"]
    
    
    override func viewDidLoad() {
        changeLabel.text = gameString[0]
    }
    
    
    @IBAction func Verb(sender: UIButton) {
        
    }
    
    @IBAction func Adjective(sender: UIButton) {
        
    }
    
    @IBAction func Noun(sender: UIButton) {
        
        AVAudioPlayer.valueForKey("let dog bark when answer is incorrect")
        
    }
}