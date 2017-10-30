//
//  FirstViewController.swift
//  slot machine mid
//
//  Created by User on 10/23/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    private var slotMachine = SlotMachineGame(3)
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    

    @IBOutlet var digits: [UILabel]!
    
    
    @IBAction func spin(_ sender: UIButton) {
        
        slotMachine.spinDigits()
        var digitAll = slotMachine.getDigits()
        for i in 0..<3{
            digits[i].text = String(digitAll[i].getDigit())
            digits[i].textColor = digitAll[i].getColor()
        }
        
 
        scoreLabel.text = String("Score: ") + String(slotMachine.getScore()) + String(" points")
        if scoreLabel.text == "Score: 0 points"{
            scoreLabel.text = String("GAME  OVER")
        } else if (scoreLabel.text == "Score: 1 points"){
            scoreLabel.text = String("Sorry not enough points")
        }
   
    }
    
    
    @IBAction func reset1(_ sender: UIButton) {

        slotMachine.resetGame()
        scoreLabel.text = String("Score: ") + String(slotMachine.getScore()) + String(" points")
       
        
        
    }
   
    func animatedIt(){
        UIView.animate(withDuration: 1.0, animations: {
          
            
            for i in 0..<3{
                self.digits[i].alpha = 1.2
                
            }
            
            
        }, completion: {
            (Completed : Bool) -> Void in
            // animation is done
            
            UIView.animate( withDuration: 1.0, delay: 1.0, options: UIViewAnimationOptions.curveLinear, animations: {
                
                // self.store2.alpha = 0
                for i in 0..<3{
                    self.digits[i].alpha = 0
                    
                }
            }, completion: {
                (Completed : Bool) -> Void in
                self.animatedIt()
            })
            //over an over
        })
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        animatedIt()
    }
    

}

