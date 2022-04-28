//
//  main.swift
//  RandomBingo
//
//  Created by 정주호 on 28/04/2022.
//

import Foundation

var computerChoice = Int.random(in: 1...100)
var myChoice = 0

while true {
    var userInput = readLine()
    
    if let input = userInput {
        if let number = Int(input) {
            myChoice = number
        }
    }
    
    
    if computerChoice > myChoice {
        print("UP!")
    } else if computerChoice < myChoice {
        print("DOWN!")
    } else {
        print("Bingo!")
        break
    }
}
