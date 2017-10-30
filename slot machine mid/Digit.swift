//
//  Digit.swift
//  slot machine mid
//
//  Created by User on 10/23/17.
//  Copyright © 2017 User. All rights reserved.
//

import Foundation
import UIKit


let colorArray = [UIColor.red,UIColor.purple,UIColor.blue,UIColor.green]

class Digit{
    
    var digit: UInt32 = 0
    var color: UIColor = UIColor.black
    
    
    func spinDigit(){
        //This method randomly selects a digit from 0-9 and sets it's color.
        digit = pickDigit()
        color = pickColor()
        
    }
    
    func pickDigit() -> UInt32{
        //This method randomly selects a digit and returns it.
        return arc4random_uniform(10)
    }
    
    func pickColor() -> UIColor{
        ///This method randomly selects a color and returns it.
        
        return colorArray[Int(arc4random_uniform(4))]
    }
    func getDigit() -> UInt32{
        //This method returns the current digit.
        return digit
    }
    func  getColor() ->UIColor{
        //This method returns the current color.
        return color
}
}
