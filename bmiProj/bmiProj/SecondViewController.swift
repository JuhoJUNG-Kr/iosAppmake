//
//  SecondViewController.swift
//  bmiProj
//
//  Created by 정주호 on 18/07/2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var bmiNumberLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    func makeUI() {
        bmiNumberLabel.clipsToBounds = true
        bmiNumberLabel.layer.borderWidth = 8
        bmiNumberLabel.backgroundColor = .gray
        backButton.clipsToBounds = true
        backButton.layer.borderWidth = 5
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

}
