//
//  ViewController.swift
//  AppPR
//
//  Created by 정주호 on 27/04/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLable: UILabel!
    @IBOutlet weak var mainButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLable.text = "반갑습니다"

    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        mainLable.text = "안녕하세요"
        //mainLable.backgroundColor = UIColor.yellow
        mainLable.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        mainLable.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        mainButton.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        mainButton.setTitleColor(.black, for: UIControl.State.normal)
    }
    
    
    

}

