//
//  LogInViewController.swift
//  Flux Power Saver
//
//  Created by addob_000 on 9/17/16.
//  Copyright © 2016 fluxps. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var signButton: UIButton!
    
    var userNameString = "a"
    var passWordString = "b"
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
     
    @IBAction func getSignInData(_ sender: AnyObject) {
        userNameString = userName.text!
        passWordString = passWord.text!
        self.performSegue(withIdentifier: "segueToHome", sender: self)
        
        
    }
    
     
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "segueToHome"{
            //segue.destination.r
    //
        
        let homeView = segue.destination as! HomeViewController
        homeView.helloUser?.text = userNameString
            
        }
      }
 
    
}
