//
//  ViewController.swift
//  BmiCodeMake
//
//  Created by 정주호 on 13/09/2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI

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
        button.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - view did load

    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    // MARK: - Auto layout

    func makeUI() {
        view.backgroundColor = .darkGray
        view.addSubview(mainStackView)
        view.addSubview(mainButton)
        
        mainStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        
        tallStackView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        weightStackVIew.heightAnchor.constraint(equalToConstant: 35).isActive = true
        tallLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        weightLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        mainButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        mainButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        mainButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        mainButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
    }
    
    @objc func calculateButtonTapped() {
        let resultVC = ResultViewController()
        resultVC.modalPresentationStyle = .fullScreen
        present(resultVC, animated: true, completion: nil)
    }
}

// MARK: - Extension

extension ViewController: UITextFieldDelegate {
    
}

