//
//  ViewController.swift
//  Timer
//
//  Created by Allen Su on 2020/2/10.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var mins = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func typePressed(_ sender: UIButton) {
        switch sender.currentTitle {
        case "Short Break":
            mins = 5
        case "Medium Break":
            mins = 15
        case "Long Break":
            mins = 30
        case "Short Study":
            mins = 30
        case "Medium Study":
            mins = 45
        case "Long Study":
            mins = 60
        default:
            mins = 10
        }
        
        performSegue(withIdentifier: "goToTimer", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTimer" {
            if let nextViewController = segue.destination as? TimerViewController {
                nextViewController.minutes = mins
            }
        }
    }
}

