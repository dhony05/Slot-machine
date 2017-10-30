//
//  SecondViewController.swift
//  slot machine mid
//
//  Created by User on 10/23/17.
//  Copyright © 2017 User. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    private var slotMachine = SlotMachineGame(5)
    


 
    @IBOutlet weak var store2: UILabel!

    
    @IBOutlet var digitsk: [UILabel]!
    
    
    @IBAction func spin2(_ sender: UIButton) {
      //  self.animatedIt()
        slotMachine.spinDigits()
        var digitAll = slotMachine.getDigits()
        for i in 0..<5{
            digitsk[i].text = String(digitAll[i].getDigit())
            digitsk[i].textColor = digitAll[i].getColor()
        }
        
        
        store2.text = String("Score: ") + String(slotMachine.getScore()) + String(" points")
        if store2.text == "Score: 0 points"{
            store2.text = String("GAME  OVER")
        } else if store2.text == "Score: 1 points"{
            store2.text = String("Sorry not enough points")
    }

    }// fumction to animate the text
    
     
    func animatedIt(){
        UIView.animate(withDuration: 1.0, animations: {
            //self.store2.alpha = 1.0
            
            for i in 0..<5{
                self.digitsk[i].alpha = 1.2
                
            }
           
           
        }, completion: {
            (Completed : Bool) -> Void in
            // animation is done
            
            UIView.animate( withDuration: 1.0, delay: 1.0, options: UIViewAnimationOptions.curveLinear, animations: {
                
               // self.store2.alpha = 0 
                for i in 0..<5{
                self.digitsk[i].alpha = 0
                    
                }
            }, completion: {
                (Completed : Bool) -> Void in
                self.animatedIt()
            })
            //over an over
        })
    }
    
    @IBAction func reset2(_ sender: UIButton) {
        slotMachine.resetGame()
        store2.text = String("Score: ") + String (slotMachine.getScore()) + String(" points")
        

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        animatedIt()
        }
    

}

