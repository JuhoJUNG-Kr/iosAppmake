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
    
//    var bmiNumber: Double?
//    var adviceString: String?
//    var bmiColor: UIColor?
    
    var bmi: BMI?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeUI()
    }
    
    func makeUI() {
        bmiNumberLabel.clipsToBounds = true
        bmiNumberLabel.layer.cornerRadius = 8
        bmiNumberLabel.backgroundColor = .gray
        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = 5
        backButton.setTitle("Back", for: .normal)
        
        guard let bmi = bmi else { return }
        bmiNumberLabel.text = "\(bmi.value)"
        
        adviceLabel.text = bmi.advice
        
        bmiNumberLabel.backgroundColor = bmi.matchColor

        
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
    


}
