//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email=emailTextfield.text,let pwd = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: pwd) { (res, err) in
                if err==nil {
                    print("Success registering user")
                    self.performSegue(withIdentifier: Constants.registerSegue, sender: self)
                } else {
                    print("Fail registering user")
                    
                }
            }
        }
    }
    
}
