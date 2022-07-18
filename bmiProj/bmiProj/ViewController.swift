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
        heightTextField.keyboardType = UIKeyboardType.numberPad
        weightTextField.keyboardType = UIKeyboardType.numberPad
        heightTextField.placeholder = "cm"
        weightTextField.placeholder = "kg"
        calculateButton.layer.cornerRadius = 8
        calculateButton.layer.masksToBounds = true
        calculateButton.setTitle("BMI 계산하기", for: .normal)
    }

    @IBAction func calculateButtonTapped(_ sender: UIButton) {
    }
    
}

extension ViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        //textFiled.resignFirstResponder() 같은 역할임
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        //글자수 10 글자 제한 만들기
        let maxLength = 3
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)

        return newString.count <= maxLength
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
