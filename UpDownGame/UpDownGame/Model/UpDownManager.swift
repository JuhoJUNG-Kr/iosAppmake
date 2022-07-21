//
//  UpDownManager.swift
//  UpDownGame
//
//  Created by 정주호 on 21/07/2022.
//

import UIKit

class UpDownManager {
    
    
    private var comNumber = Int.random(in: 1...10)
    private var myNumber: Int = 1
    
    func getResult() -> String {
        if comNumber > myNumber {
            return "Up"
        } else if comNumber < myNumber {
            return "Down"
        } else {
            return "Bingo!😎"
        }
    }
    
    func setUsersNum(num: Int) {
        myNumber = num
    }
    
    func allReset() {
        comNumber = Int.random(in: 1...10)
        myNumber = 1
    }
}
