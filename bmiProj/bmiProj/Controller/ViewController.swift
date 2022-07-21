//
//  ViewController.swift
//  bmiProj
//
//  Created by 정주호 on 18/07/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!

    
    var bmiManager = BMICalculatorManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeUI()
    }
    
    func makeUI() {
        heightTextField.delegate = self
        weightTextField.delegate = self
        mainLabel.text = "키와 몸무게를 입력해주세요"
        heightTextField.clearButtonMode = .always
        weightTextField.clearButtonMode = .always
        heightTextField.placeholder = "cm"
        weightTextField.placeholder = "kg"
        calculateButton.layer.cornerRadius = 5
        calculateButton.layer.masksToBounds = true
        calculateButton.setTitle("BMI 계산하기", for: .normal)
    }

    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        
        bmiManager.getBMI(height: heightTextField.text!, weight: weightTextField.text!)

    }
    

    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if heightTextField.text == "" || weightTextField.text == "" {
            mainLabel.text = "키와 몸무게를 입력해야만 합니다"
            mainLabel.textColor = UIColor.red
            return false
        }
        mainLabel.text = "키와 몸무게를 입력해주세요"
        mainLabel.textColor = UIColor.black
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            let secondVC = segue.destination as! SecondViewController
            secondVC.bmi = bmiManager.getBMI(height: heightTextField.text!, weight: weightTextField.text!)
        }
        heightTextField.text = ""
        weightTextField.text = ""
        
    }
}

extension ViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        //textFiled.resignFirstResponder() 같은 역할임
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if Int(string) != nil || string == "" {
            return true //글자 입력을 허용(숫자를 입력할 경우)
        }
        return false // 글자 입력을 허용하지 않음.

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //두개의 텍스트 필드를 모두 종료(키보드 내려가기)
        if heightTextField.text != "", weightTextField.text != "" {
            weightTextField.resignFirstResponder()
            return true
            //첫번째 텍스트 필드 입력을 완료했을 경우, 두번째 텍스트 필드로 넘어가기
        } else if heightTextField.text != "" {
            weightTextField.becomeFirstResponder()
            return true
        }
        return false
    }
}
