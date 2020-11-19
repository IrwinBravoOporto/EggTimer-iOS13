//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var valueTitle: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var player: AVAudioPlayer!


    
    let eggTimes = ["Soft":3,"Medium":4,"Hard":7]
    
    var timer = Timer()
    
var totalTime = 0
var secondsPassed = 0
    
    
    override func viewDidLoad() {
        progressBar.progress = 0.0
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
 
        timer.invalidate()
        
        totalTime = eggTimes["\(sender.currentTitle ?? "")"]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        valueTitle.text = "How do you like your eggs?"
        
     timer =    Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        

    }
    
    @objc func updateCounter() {
        //example functionality
        if secondsPassed <= totalTime {
            
            let percentageProgress = Float(secondsPassed)/Float(totalTime)
            
            progressBar.progress = percentageProgress
            
            print(percentageProgress)
            
            secondsPassed += 1
        }else{
            timer.invalidate()
            valueTitle.text = "Done!"
            
            guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }
            
            player = try! AVAudioPlayer(contentsOf: url)
            player.play()
            
            
        }
            
        
        
        
        
    }
    
}
