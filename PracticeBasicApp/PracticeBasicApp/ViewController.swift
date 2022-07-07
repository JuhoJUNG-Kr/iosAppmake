//
//  ViewController.swift
//  PracticeBasicApp
//
//  Created by 정주호 on 06/07/2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var mainLable: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    weak var timer: Timer?
    
    var number = 0
    
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
        number = Int(sender.value * 60)
        mainLable.text = "\(number)sec"
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        //1초씩 지나갈 때마다 실행.
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(doSomething), userInfo: nil, repeats: true)
        
        
        //클로저를 사용하여 만들기
//        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
//            // do something here 반복하고 싶은 코드
//            if number > 0 {
//                number -= 1
//                slider.value = Float(number) / Float(60)
//                mainLable.text = "\(number) sec"
//            } else {
//                number = 0
//                cofigureUI()
//                timer?.invalidate() //타이머를 사용할 경우 시작하기전, 끝난 후 비활성화 시키기
//                //시스템 사운드 (기본 사운드) 재생
//                AudioServicesPlayAlertSound(SystemSoundID(1322))
//            }
//
//        }

    }
    //함수를 이용하여 만들기
    @objc func doSomething() {
        if number > 0 {
            number -= 1
            slider.value = Float(number) / Float(60)
            mainLable.text = "\(number) sec"
        } else {
            number = 0
            cofigureUI()
            timer?.invalidate() //타이머를 사용할 경우 시작하기전, 끝난 후 비활성화 시키기
            //시스템 사운드 (기본 사운드) 재생
            AudioServicesPlayAlertSound(SystemSoundID(1322))
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        cofigureUI()
        number = 0
        timer?.invalidate() //타이머 자체를 없애는 방법
    }
    

}

