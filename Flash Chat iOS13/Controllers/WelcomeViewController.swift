//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var char = titleLabel.text!
        var charIndex = 0
        titleLabel.text = ""
        for letter in char {
            charIndex+=1
            Timer.scheduledTimer(withTimeInterval: 0.4*Double((charIndex)), repeats: false) {
                timer in
                self.titleLabel.text?.append(letter)
            }
        }
       
    }
    

}
