//
//  LogInViewController.swift
//  Flux Power Saver
//
//  Created by addob_000 on 9/17/16.
//  Copyright © 2016 fluxps. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passWordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    // MARK: - Navigation
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
     textField.resignFirstResponder()
     return true
     }
     
    @IBAction func signIn(_ sender: AnyObject) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate

        Connection.with(username: "jsmith10", password: "secret") { cr in
            switch cr {
            case .ok(let connection): connection.moneySpentLastWeek() { dollar in
                print("dollar:\(dollar)")
                }
            case _ :break
            }
        }

        //self.performSegue(withIdentifier: "segueToHome", sender: self)
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let homeView = segue.destination as! HomeViewController
    }
 
    
}
