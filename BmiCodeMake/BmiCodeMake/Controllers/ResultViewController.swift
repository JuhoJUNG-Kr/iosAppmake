//
//  ResultViewController.swift
//  BmiCodeMake
//
//  Created by 정주호 on 13/09/2022.
//

import UIKit

class ResultViewController: UIViewController {
    private let resultView = ResultView()
    var bmi: BMI?
    
    override func loadView() {
        view = resultView
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiResult()
        setupAddTarget()
    }
    
    func bmiResult() {
        resultView.numberLabel.text = "\(bmi!.value)"
        resultView.numberLabel.backgroundColor = bmi?.matchColor
        resultView.adviceLable.text = bmi?.advice
    }
    

    @objc func resetButtonTapped() {
        dismiss(animated: true)
    }
    
    func setupAddTarget() {
        resultView.resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
    }
}
