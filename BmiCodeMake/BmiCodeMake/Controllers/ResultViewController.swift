//
//  ResultViewController.swift
//  BmiCodeMake
//
//  Created by 정주호 on 13/09/2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmi: BMI?
    
    lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "BMI 결과 값"
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.frame.size.height = 50
        label.textColor = .black
        label.textAlignment = .center
        label.layer.cornerRadius = 5
        label.text = "23.2"
        return label
    }()
    
    lazy var adviceLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.text = "더 먹으세요"
        return label
    }()
    
    lazy var resultStackView: UIStackView = {
        let stv = UIStackView(arrangedSubviews: [resultLabel, numberLabel, adviceLable])
        stv.translatesAutoresizingMaskIntoConstraints = false
        stv.axis = .vertical
        stv.alignment = .fill
        stv.distribution = .fillEqually
        stv.spacing = 15
        return stv
    }()
    
    let resetButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("다시 계산하기", for: .normal)
        button.backgroundColor = .blue
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.titleLabel?.textColor = .white
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeResultUI()
    }
    
    func makeResultUI() {
        view.backgroundColor = .darkGray
        view.addSubview(resultStackView)
        view.addSubview(resetButton)
        
        resultStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resultStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130).isActive = true
        resultStackView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        resetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        resetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        resetButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        resetButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
    }
    
    @objc func resetButtonTapped() {
        dismiss(animated: true)
    }
}
