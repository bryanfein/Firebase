//
//  Home.swift
//  TEST
//
//  Created by Bryan Fein on 5/1/17.
//  Copyright © 2017 Bryan Fein. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class Home: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func logoutButton(_ sender: UIButton) {
        
        if FIRAuth.auth()?.currentUser != nil {
            do {
                try FIRAuth.auth()?.signOut()
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC")
                present(vc, animated: true, completion: nil)
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        
    }

}
