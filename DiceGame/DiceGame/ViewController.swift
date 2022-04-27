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
    var diceArray: [UIImage] = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2"), #imageLiteral(resourceName: "black3"), #imageLiteral(resourceName: "black4"), #imageLiteral(resourceName: "black5"), #imageLiteral(resourceName: "black6")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        leftImgView.image = diceArray.randomElement()
        rigthImgView.image = diceArray.randomElement()
        
    }
    
    
}

