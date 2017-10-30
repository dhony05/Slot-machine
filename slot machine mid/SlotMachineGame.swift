//
//  SlotMachineGame.swift
//  slot machine mid
//
//  Created by User on 10/23/17.
//  Copyright © 2017 User. All rights reserved.
//

import Foundation
class SlotMachineGame{
    var scoring: Int = 100
    var numberArray: [Digit] = []
    init(_ numberOfDigits : Int){
        for _ in 0..<numberOfDigits{
            numberArray.append(Digit())
            
        }
      
        //Initializes a new game with the specified number of digits.
    }
    func resetGame(){
        
        scoring = 100
     
        
        
        
       
    }
    func inScore(){
        if sameNumber() && sameColor(){
            if numberArray.count == 3{
            scoring += 300
            } else {
                scoring += 500
            }
        }
        
        if sameColor() && !sameNumber(){
            if numberArray.count == 3{
            scoring += 75
            
            } else {
               scoring += 125
            }
        }
        
        if !sameColor() && sameNumber(){
            if numberArray.count == 3{
                scoring += 150
                
            } else {
                scoring += 250
            }
        }
        
        
    }
    func getScore() -> Int{
        
        //Returns the current score.
        return scoring
    }
    func getDigits() ->[Digit]{
        return numberArray
        //Returns the game's array of Digits.
    }
    func spinDigits(){
        if (scoring >= 2){
        scoring -= 2
        for digit in numberArray{
            digit.spinDigit()
            
        }
        
        
        //This method spins all the Digits that are part of this game.
       
            inScore()
            
        }
       
    }
    private func sameNumber() -> Bool{
        for i in 0..<numberArray.count-1{
            if numberArray[i].getDigit() != numberArray[i+1].getDigit(){
                
                return false
            }
        }
        return true
        
    }
    
    private func sameColor() -> Bool{
        for i in 0..<numberArray.count-1{
            if !numberArray[i].getColor().isEqual(numberArray[i+1].getColor()){
                return false
            }
        }
        return true
    }
}
