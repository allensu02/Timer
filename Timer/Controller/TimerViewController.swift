//
//  TimerViewController.swift
//  Timer
//
//  Created by Allen Su on 2020/2/10.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    
    var hours = 0
    var minutes = 10
    
    @IBOutlet weak var timerPicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerPicker.countDownDuration = Double(minutes * 60)
        if minutes == 60 {
            minutes = 0
            hours += 1
        }
        
        
    }
    
    @IBAction func timerChanged(_ sender: UIDatePicker) {
        minutes = Int(timerPicker.countDownDuration/60)
    }
    @IBAction func startPressed(_ sender: UIButton) {
        minutes = Int(timerPicker.countDownDuration/60)
        performSegue(withIdentifier: "goToCountdown", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToCountdown" {
            if let nextVC = segue.destination as? CountdownViewController {
                nextVC.mins = minutes
            }
        }
    }
    @IBAction func cancelPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
