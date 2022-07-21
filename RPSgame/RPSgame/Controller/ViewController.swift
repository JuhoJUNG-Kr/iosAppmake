//
//  ViewController.swift
//  RPSgame
//
//  Created by 정주호 on 28/04/2022.
//

import UIKit

class ViewController: UIViewController {
    
    //변수, 속성
    @IBOutlet weak var mainLable: UILabel!
    @IBOutlet weak var comImgView: UIImageView!
    @IBOutlet weak var myImgView: UIImageView!
    @IBOutlet weak var comChoiceLable: UILabel!
    @IBOutlet weak var myChoiceLable: UILabel!
    
    var rpsManager = RpsManager()

    
    //함수, 메서드
    //viewDidLoad = 앱 화면에 들어오면 처음 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        comImgView.image = rpsManager.getReady().rpsInfo.image
        myImgView.image = rpsManager.getReady().rpsInfo.image
        
        comChoiceLable.text = rpsManager.getReady().rpsInfo.name
        myChoiceLable.text = rpsManager.getReady().rpsInfo.name
    }
    
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        //버튼의 문자(text= 가위, 바위 보)를 가져옴
        guard let title = sender.currentTitle else {return}
        //let title = sender.currentTitle!
        //가위 바위 보를 선택하여 그 정보를 저장
        rpsManager.userGetSelected(name: title)
        
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        //컴퓨터가 랜덤으로 선택 한 것을 이미지 뷰에 표시
        //컴퓨터가 랜덤 선택한 것을 레이블에 표시
        comImgView.image = rpsManager.getComputerRPS().rpsInfo.image
        comChoiceLable.text = rpsManager.getComputerRPS().rpsInfo.name
        //내가 선택 한 것을 이미지 뷰에 표시
        //내가 선택 한 것을 레이블에 표시
        myImgView.image = rpsManager.getUserRPS().rpsInfo.image
        myChoiceLable.text = rpsManager.getUserRPS().rpsInfo.name
        //기존의 선택된 정보(가위 바위 보)를 비교 후 판단/표시
        mainLable.text = rpsManager.getRpsResult()
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        //컴퓨터의 이미지 뷰 초기화
        //컴퓨터의 레이블 초기화
        configureUI()
        
        //내 선택 이미지 뷰 초기화
        //내 선택 레이블 초기화

        //메인 레이블 "선택하세요" 표시
        if mainLable.text == "졌네...허접❤︎허접❤︎" {
            mainLable.text = "허접❤︎ 또 하려구?"
        } else {
            mainLable.text = "선택하세요"
        }
        //컴퓨터가 다시 랜덤 가위 바위 보를 선택하고 저장
        rpsManager.allReset()
    }
    
}

