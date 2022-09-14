//
//  ViewController.swift
//  BmiCodeMake
//
//  Created by 정주호 on 13/09/2022.
//

import UIKit

final class ViewController: UIViewController {
    
    private let mainView = mainViewUI()
    var bmiManager = BMICalculatorManager()
    
    // MARK: - view did load

    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddTarget()
    }
    
    @objc func calculateButtonTapped() {
        if  mainView.tallTextField.text == "" || mainView.weightTextField.text == "" {
            mainView.mainLabel.text = "키와 몸무게를 입력하셔야만 합니다!!!"
            mainView.mainLabel.textColor = UIColor.red
        } else {
            mainView.mainLabel.text = "키와 몸무게를 입력해 주세요"
            mainView.mainLabel.textColor = UIColor.black
            let resultVC = ResultViewController()
            resultVC.modalPresentationStyle = .fullScreen
            let bmi = bmiManager.getBMI(height: mainView.tallTextField.text!, weight: mainView.weightTextField.text!)
            resultVC.bmi = bmi
            mainView.tallTextField.text = ""
            mainView.weightTextField.text = ""
            present(resultVC, animated: true, completion: nil)
        }
    }
    
    func setupAddTarget() {
        mainView.mainButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
    }
    



}



