//
//  EndController.swift
//  Doggy Van
//
//  Created by kayla dozier on 11/19/16.
//  Copyright © 2016 kayla dozier. All rights reserved.
//

import UIKit

class EndController: UIViewController {
  
    //Function created to restart game. 
    @IBAction func playAgain(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}

