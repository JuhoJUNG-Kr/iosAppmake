//
//  RpsManager.swift
//  RPSgame
//
//  Created by 정주호 on 21/07/2022.
//

import UIKit

class RpsManager {
    
    private var myChoice: Rps = Rps(rawValue: Int.random(in: 1...3))!
    private var computerChoice: Rps = Rps(rawValue: Int.random(in: 1...3))!
    
    func getReady() -> Rps {
        return Rps.ready
    }
    
    func getUserRPS() -> Rps {
        return myChoice
    }
    
    func getComputerRPS() -> Rps {
        return computerChoice
    }
    
    func userGetSelected(name: String) {
        switch name {
        case "가위":
            myChoice = Rps.scissors
        case "바위":
            myChoice = Rps.rock
        case "보":
            myChoice = Rps.paper
        default:
            myChoice = Rps.rock
        }
        
    }
    func getRpsResult() -> String {
        if computerChoice == myChoice {
            return "비겼습니다"
        } else if computerChoice == .rock && myChoice == .paper {
            return "이겼습니다!"
        } else if computerChoice == .paper && myChoice == .scissors {
            return "이겼습니다!"
        } else if computerChoice == .scissors && myChoice == .rock {
            return "이겼습니다!"
        } else {
            return "졌네...허접❤︎허접❤︎"
        }
    }
    
    func allReset() {
        computerChoice = Rps(rawValue: Int.random(in: 1...3))!
        myChoice = Rps(rawValue: Int.random(in: 1...3))!
    }
}
