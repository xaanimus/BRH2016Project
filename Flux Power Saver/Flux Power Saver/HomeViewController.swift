//
//  FirstViewController.swift
//  Flux Power Saver
//
//  Created by Serge-Olivier Amega on 9/17/16.
//  Copyright © 2016 fluxps. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var helloUser: UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.helloUser?.adjustsFontSizeToFitWidth = true
        self.helloUser?.numberOfLines = 1
        //self.helloUser?.text = "Hello, userName"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

