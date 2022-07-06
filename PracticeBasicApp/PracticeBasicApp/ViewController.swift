//
//  ViewController.swift
//  PracticeBasicApp
//
//  Created by 정주호 on 06/07/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLable: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cofigureUI()
    }
    
    func cofigureUI() {
        mainLable.text = "choisi le second"
        slider.setValue(0.5, animated: true)
    }
    @IBAction func sliderChanged(_ sender: UISlider) {
        //슬라이더의 밸류값을 가지고 메인 레이블의 텍스트를 셋팅
        let seconds = Int(slider.value * 60)
        mainLable.text = "\(seconds)sec"
        
    }
    @IBAction func startButtonTapped(_ sender: UIButton) {
        //1초씩 지나갈 때마다 실행.
        mainLable.text = ""
    }
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        cofigureUI()
    }
    

}

