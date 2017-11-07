//
//  ViewController.swift
//  DiceeApp
//
//  Created by Min thu Kyaw on 11/2/17.
//  Copyright © 2017 Min thu Kyaw. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceOne: UIImageView!
    
    @IBOutlet weak var diceTwo: UIImageView!
    
    var timer = Timer();
    
    var counter = 0;
    
    let dices = ["dice1","dice2","dice3","dice4","dice5","dice6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func startRolling(_ sender: Any) {
        self.runCounter()
    }
    
    func runCounter()
    {
        counter = 0;
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: (#selector(ViewController.updateDices)), userInfo: nil, repeats: true)
    }
    
    func updateDices() {
        
        let dice1 = Int(arc4random_uniform(6))
        let dice2 = Int(arc4random_uniform(6))
        self.diceOne.image = UIImage(named: dices[dice1])
        self.diceTwo.image = UIImage(named: dices[dice2])
        
        if (counter > 10) {
            self.timer.invalidate();
        }
        
        counter += 1;
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        self.runCounter();
    }
    
}

