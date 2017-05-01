//
//  SignupVC.swift
//  TEST
//
//  Created by Bryan Fein on 5/1/17.
//  Copyright © 2017 Bryan Fein. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class SignupVC: UIViewController {
    
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func signUpButton(_ sender: UIButton) {
        
        if emailField.text == "" {
            
            let alertController = UIAlertController(title: "ERROR", message: "Please Enter Your Email and Password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true)
            
        } else {
            FIRAuth.auth()?.createUser(withEmail: emailField.text!, password: passwordField.text!){(user, error) in
                if error == nil {
                    print("You've have successfully signed up")
                    //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username

                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier:"Home")
                    self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
}
