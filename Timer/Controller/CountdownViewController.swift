//
//  CountdownViewController.swift
//  Timer
//
//  Created by Allen Su on 2020/2/10.
//  Copyright © 2020 Allen Su. All rights reserved.
//

import UIKit

class CountdownViewController: UIViewController {

    var mins = 10
    var secs = 0
    var isPaused = false
    var timer: Timer?
    var timerOver = false
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var pauseButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(CountdownViewController.update), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    
    @objc func update() {
        if (secs == 0) {
            secs += 60
            mins -= 1
        }
        secs -= 1
        updateLabel()
    }
    
    @IBAction func pausePressed(_ sender: UIButton) {
        if timerOver == true {
            performSegue(withIdentifier: "goNextActivity", sender: self)
        } else {
            if isPaused{
                timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: Selector("update"), userInfo: nil, repeats: true)

                isPaused = false
                sender.setTitle("Pause", for: .normal)
            } else {
                timer!.invalidate()
                isPaused = true
                sender.setTitle("Resume", for: .normal)
            }
        }
        
        
    }
    @IBAction func cancelPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func updateLabel () {
        if (secs == 0 && mins == 0) {
            timer?.invalidate()
            timeLabel.text = "Done"
            timerOver = true
            pauseButton.titleLabel?.text = "Next Activity"
        } else if (secs < 0){
            mins -= 1
            secs = 59
            timeLabel.text = "\(mins) : \(secs)"
        } else {
            if (secs < 10 && mins < 10) {
                timeLabel.text = "0\(mins) : 0\(secs)"
            } else if secs < 10 || mins < 10 {
                if secs < 10 {
                    timeLabel.text = "\(mins) : 0\(secs)"
                }
                if mins < 10 {
                    timeLabel.text = "0\(mins) : \(secs)"
                }
            } else {
                timeLabel.text = "\(mins) : \(secs)"
            }
           
        }
        
    }
}
