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
    //컴퓨터가 랜덤으로 숫자선택
    var comNumber = Int.random(in: 1...10)
    //내가 선택한 숫자를 저장하는 변수
    //var myNumber: Int = 1

    //앱의 화면에 들어오면 가장 먼저 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
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
        //guard let num = Int(numString) else {return}
        //myNumber 변수에 숫자로 변환한 문자열을 저장
        //myNumber = num
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        //다른 방법
        //숫자 레이블에 저장된 문자열을 가져오기
        guard let myNumString = numberLable.text else {return}
        //타입변환 = 문자열 -> 정수
        guard let myNumber = Int(myNumString) else {return}
        
        //컴퓨터의 숫자와 내가 선택한 숫자 비교 후 메인 레이블에 표시
        if comNumber > myNumber {
            mainLable.text = "Up"
        } else if comNumber < myNumber {
            mainLable.text = "Down"
        } else {
            mainLable.text = "Bingo!😎"
        }
    
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        //메인레이블 텍스트 "선택하세요"
        mainLable.text = "선택하세요"
        //컴퓨터의 랜덤숫자 다시 선택
        comNumber = Int.random(in: 1...10)
        //숫자 레이블 공백 ""
        numberLable.text = ""
    }
    
    
}

