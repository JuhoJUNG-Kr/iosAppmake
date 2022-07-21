//
//  ViewController.swift
//  DiceGame
//
//  Created by 정주호 on 27/04/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftImgView: UIImageView!
    @IBOutlet weak var rigthImgView: UIImageView!
    //항상 인스턴스 먼저 생성
    var diceManager = DiceManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leftImgView.image = diceManager.getFirstDice()
        rigthImgView.image = diceManager.getFirstDice()
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        leftImgView.image = diceManager.getRandomDice()
        rigthImgView.image = diceManager.getRandomDice()
        
    }
    
    
}

