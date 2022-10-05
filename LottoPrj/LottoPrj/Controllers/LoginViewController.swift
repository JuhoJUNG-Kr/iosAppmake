//
//  LoginViewController.swift
//  LottoPrj
//
//  Created by 정주호 on 04/10/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = loginView
        setupAddTarget()
    }
    
    func setupAddTarget() {
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginView.passwordResetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
    }
    
    // 로그인 버튼 누르면 동작하는 함수
    @objc func loginButtonTapped() {
        // 서버랑 통신해서, 다음 화면으로 넘어가는 내용 구현
        if loginView.emailTextField.text == "" && loginView.passwordTextField.text == "" {
            let alert = UIAlertController(title: "Attention", message: "Veuillez entrer votre identifiant ou mot de passe", preferredStyle: .alert)
            let success = UIAlertAction(title: "Confirmer", style: .default) { action in
            }
            alert.addAction(success)
            // 실제 띄우기
            self.present(alert, animated: true, completion: nil)
        } else {
            dismiss(animated: true)
        }
        
    }
    
    // 리셋버튼이 눌리면 동작하는 함수
    @objc func resetButtonTapped() {
        //만들기
        let alert = UIAlertController(title: "Modifier le mot de passe", message: "Vous avez oublié votre mot de passe?", preferredStyle: .alert)
        let success = UIAlertAction(title: "Oui", style: .default) { action in
        }
        let cancel = UIAlertAction(title: "Non", style: .cancel) { action in
        }
        
        alert.addAction(success)
        alert.addAction(cancel)
        
        // 실제 띄우기
        self.present(alert, animated: true, completion: nil)
    }

}
