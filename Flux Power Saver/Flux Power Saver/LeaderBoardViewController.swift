//
//  LeaderBoardViewController.swift
//  Flux Power Saver
//
//  Created by addob_000 on 9/17/16.
//  Copyright © 2016 fluxps. All rights reserved.
//

import UIKit

class LeaderBoardViewController: UIViewController {

    @IBOutlet weak var leaderboard: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.leaderboard.adjustsFontSizeToFitWidth = true
        self.leaderboard.numberOfLines = 1
        self.leaderboard.text = "LeaderBoard"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
