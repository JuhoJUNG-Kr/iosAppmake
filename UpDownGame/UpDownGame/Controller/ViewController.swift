//
//  ViewController.swift
//  UpDownGame
//
//  Created by 정주호 on 28/04/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLable: UILabel!
    @IBOutlet weak var numberLable: UILabel!
    
    var upDownManager = UpDownManager()


    //앱의 화면에 들어오면 가장 먼저 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        //메인 레이블 "선택하세요" 표시
        mainLable.text = "선택하세요"
        //숫자 레이블 공백 ""
        numberLable.text = ""
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        //버튼의 숫자를 가져오기
        guard let numString = sender.currentTitle else {return}
        //버튼 숫자의 따른 numberLable 텍스트 변경
        numberLable.text = numString
        //선택한 숫자를 변수에 저장
        //Int()로 문자열을 숫자로 변환
        guard let num = Int(numString) else {return}
        //myNumber 변수에 숫자로 변환한 문자열을 저장
        upDownManager.setUsersNum(num: num)
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        mainLable.text = upDownManager.getResult()
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        upDownManager.allReset()
        configureUI()
    }
    
    
}

