//
//  DiceManager.swift
//  DiceGame
//
//  Created by 정주호 on 21/07/2022.
//

import UIKit

class DiceManager {
    private var diceArray: [UIImage] = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2"), #imageLiteral(resourceName: "black3"), #imageLiteral(resourceName: "black4"), #imageLiteral(resourceName: "black5"), #imageLiteral(resourceName: "black6")]
    
    func getFirstDice() -> UIImage {
        return diceArray[0]
    }
    
    func getRandomDice() -> UIImage {
        return diceArray.randomElement()!
    }
}
