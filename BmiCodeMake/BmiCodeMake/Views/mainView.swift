//
//  mainView.swift
//  BmiCodeMake
//
//  Created by 정주호 on 14/09/2022.
//

import UIKit

// MARK: - UI
class mainViewUI: UIView {
    
    lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.text = "키와 몸무게를 입력해 주세요"
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var tallLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        label.text = "키"
        label.backgroundColor = .clear
        label.textColor = .black
        return label
    }()
    
    lazy var tallTextField:UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .white
        tf.clearButtonMode = .always
        tf.textColor = .black
        tf.keyboardType = .numberPad
        tf.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 0.0))
        tf.leftViewMode = .always
        tf.placeholder = "cm 단위로 입력하세요"
        tf.layer.cornerRadius = 5
        tf.clipsToBounds = true
        return tf
    }()
    
    lazy var weightLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        label.text = "몸무게"
        label.backgroundColor = .clear
        label.textColor = .black
        return label
    }()
    
    lazy var weightTextField:UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = .white
        tf.clearButtonMode = .always
        tf.textColor = .black
        tf.keyboardType = .numberPad
        tf.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 0.0))
        tf.leftViewMode = .always
        tf.placeholder = "kg 단위로 입력하세요"
        tf.layer.cornerRadius = 5
        tf.clipsToBounds = true
        return tf
    }()
    
    lazy var tallStackView: UIStackView = {
        let stv = UIStackView(arrangedSubviews: [tallLabel, tallTextField])
        stv.translatesAutoresizingMaskIntoConstraints = false
        stv.axis = .horizontal
        stv.spacing = 10
        stv.distribution = .fill
        return stv
    }()
    
    lazy var weightStackVIew: UIStackView = {
        let stv = UIStackView(arrangedSubviews: [weightLabel, weightTextField])
        stv.translatesAutoresizingMaskIntoConstraints = false
        stv.axis = .horizontal
        stv.spacing = 10
        stv.distribution = .fill
        return stv
    }()
    
    lazy var mainStackView: UIStackView = {
        let stv = UIStackView(arrangedSubviews: [mainLabel, tallStackView, weightStackVIew])
        stv.translatesAutoresizingMaskIntoConstraints = false
        stv.axis = .vertical
        stv.spacing = 20
        stv.alignment = .fill
        stv.distribution = .fill
        return stv
    }()
    
    let mainButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("BMI 계산하기", for: .normal)
        button.backgroundColor = .blue
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 5
        //button.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        tallTextField.delegate = self
        weightTextField.delegate = self
    }
    
    // MARK: - Auto layout

    func makeUI() {
        backgroundColor = .darkGray
        addSubview(mainStackView)
        addSubview(mainButton)
        
        mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 130).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        
        tallStackView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        weightStackVIew.heightAnchor.constraint(equalToConstant: 35).isActive = true
        tallLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        weightLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        mainButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        mainButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        mainButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        mainButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50).isActive = true
    }
    

    
}

// MARK: - Extension

extension mainViewUI: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 두개의 텍스트필드를 모두 종료 (키보드 내려가기)
        if tallTextField.text != "", weightTextField.text != "" {
            weightTextField.resignFirstResponder()
            return true
        // 두번째 텍스트필드로 넘어가도록
        } else if tallTextField.text != "" {
            weightTextField.becomeFirstResponder()
            return true
        }
        return false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tallTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
}
