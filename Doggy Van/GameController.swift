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
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  //    let dogpic1 = UIImage(named: "dogpic1")
        
        
        imageView.animationImages = [
            
  //        UIImage(named: "dogpic1")!,
            UIImage(named: "Dogeyeclose1")!,
            UIImage(named: "Dogtailleft1")!,
            UIImage(named: "Dogtailright1")!
        ]
        
        imageView.animationDuration = 0.7
        imageView.startAnimating()
    }
    
    
    
    
    
    
    //
    //    var audioPlayer = AVAudioPlayer()
    
    var gameString = ["dance", "eat", "drive", "run", "play", "sing", "sleep", "imagine", "beautiful", "laughing", "smiling", "crying", "jumping", "dolphin", "cat", "apple", "tree", "bird"]
    
    //    var answerCorrect = answerCorrect.changeLabel()
    
    
    //  label.text = gameString[0]
    
    //  let gameString
    
    //  myStrings.first
    
    
    
    
    // The verb, adjective, and noun are the only options that could pertain to the label.
    
    @IBAction func Verb(sender: UIButton) {
        
    }
    
    @IBAction func Adjective(sender: UIButton) {
        
    }
    
    @IBAction func Noun(sender: UIButton) {
        
    }
    
    // When the next button is pressed, the text in the label will change.
    @IBAction func buttonPressed(sender: UIButton) {

    //  changeLabel.text = "dance", "eat", "drive", "run", "play", "sing", "sleep", "imagine", "beautiful", "laughing", "smiling", "crying", "jumping", "dolphin", "cat", "apple", "tree", "bird"
    }
    
    //override func viewDidLoad() {
    //    super.viewDidLoad()
    //    self.view!.backgroundColor = UIColor.blueColor()
    //
}



//    }
//     Override to allow for dragging the button.
//     override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        super.touchesMoved(touches, withEvent: event)
//
//
//
//}

