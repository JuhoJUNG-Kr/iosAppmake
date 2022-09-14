//
//  ResultView.swift
//  BmiCodeMake
//
//  Created by 정주호 on 14/09/2022.
//

import UIKit

class ResultView: UIView {
    
    lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.text = "Result BMI"
        return label
    }()
    
    lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        return label
    }()
    
    lazy var adviceLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var resultStackView: UIStackView = {
        let stv = UIStackView(arrangedSubviews: [resultLabel, numberLabel, adviceLable])
        stv.translatesAutoresizingMaskIntoConstraints = false
        stv.axis = .vertical
        stv.alignment = .fill
        stv.distribution = .fill
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
        button.clipsToBounds = true
//        button.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeResultUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func makeResultUI() {
        backgroundColor = .darkGray
        addSubview(resultStackView)
        addSubview(resetButton)
        
        
        numberLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        resultStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        resultStackView.topAnchor.constraint(equalTo: topAnchor, constant: 130).isActive = true
        resultStackView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        resetButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        resetButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        resetButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        resetButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50).isActive = true
    }
}
