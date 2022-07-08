//
//  ViewController.swift
//  TextFieldProject
//
//  Created by 정주호 on 08/07/2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textFiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFiled.delegate = self
        setUp()
    }
    
    func setUp() {
        textFiled.keyboardType = UIKeyboardType.emailAddress
        textFiled.placeholder = "put your email"
        textFiled.borderStyle = .roundedRect
        textFiled.clearButtonMode = .always
        textFiled.returnKeyType = .next
        textFiled.becomeFirstResponder()
    }
    
    //화면 바깥을 터치했을 때 키보드 내리기 (화면의 탭을 감지하는 메서드)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        //textFiled.resignFirstResponder() 같은 역할임
    }
    
    //텍스트 필드의 입력을 시작할 때 호출 (시작할지 말지의 여부 허락하는 것)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function)
        view.backgroundColor = UIColor.gray
        return true
    }
    
    //텍스트 필드의 입력을 시작한 순간의 시점을 알수있음
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        print("유저가 텍스트 필드 입력을 시작했습니다")
    }
    
    //텍스트 필드의 클리어 기능 (한번에 지우기) 온 오프 on off
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    //텍스트 필드 글자 내용이 (한글자 한글자) 입력되거나 지워질 때 호출이 되고 허락 여부
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        print(#function)
        //글자수 10 글자 제한 만들기
        let maxLength = 10
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)

        return newString.count <= maxLength
    }
    
    //텍스트 필드의 엔터키가 눌러지면 다음 동작을 허락할 것인지 말 것인지
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        if textFiled.text == "" {
            textField.placeholder = "Type something!"
            return false
        } else {
            return true
        }
    }
    
    //텍스트 필드의 입력이 끝날 때 호출, (끝날지 말지를 허락)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    //텍스트 필드의 입력이 실제 끝냈을 때 호출 (시점)
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print(#function)
        print("유저가 텍스트 필드 입력을 끝냈습니다.")
    }
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        textFiled.resignFirstResponder()
        
    }
    


}

