//
//  ViewController.swift
//  Doggy Van
//
//  Created by kayla dozier on 3/28/17.
//  Copyright © 2017 kayla dozier. All rights reserved.
//

import UIKit

class InstructionsController: UIViewController {
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    var words: [Word]! {
        didSet {
            performSegue(withIdentifier: "toGame", sender: self)
        }
    }
    
// Simple instructions on how to play game.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let game = segue.destination as? GameController else { return }
        game.words = words
    }
    
    @IBAction func tappedStart(_ sender: UIButton) {
        spinner.startAnimating()
        Task {
            do {
                words = try await Word.newList()
                spinner.stopAnimating()
            } catch {
                spinner.stopAnimating()
                let alert = UIAlertController(title: nil, message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel))
            }
        }
    }
}
