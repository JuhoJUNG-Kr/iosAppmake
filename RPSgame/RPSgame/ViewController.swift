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
    var myChoice: Rps = Rps.rock
    var computerChoice: Rps = Rps(rawValue: Int.random(in: 0...2))!
    
    //함수, 메서드
    //viewDidLoad = 앱 화면에 들어오면 처음 실행되는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1) 첫번째/두번째 이미지뷰에 준비(묵) 이미지를 띄워야 함
        comImgView.image = #imageLiteral(resourceName: "ready")
        myImgView.image = UIImage(named: "ready.png")
        // 2) 첫번째/두번째 레이블에 "준비"라고 문자열을 띄워야 함
        comChoiceLable.text = "준비"
        myChoiceLable.text = "준비"
    }
    
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        //버튼의 문자(text= 가위, 바위 보)를 가져옴
        let title = sender.currentTitle!
        //가위 바위 보를 선택하여 그 정보를 저장
        switch title {
        case "가위":
            myChoice = Rps.scissors
        case "바위":
            myChoice = Rps.rock
        case "보":
            myChoice = Rps.paper
        default:
            break
        }
        
    }
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        //컴퓨터가 랜덤으로 선택 한 것을 이미지 뷰에 표시
        //컴퓨터가 랜덤 선택한 것을 레이블에 표시
        switch computerChoice {
        case Rps.rock:
            comImgView.image = #imageLiteral(resourceName: "rock")
            comChoiceLable.text = "바위!"
        case Rps.paper:
            comImgView.image = #imageLiteral(resourceName: "paper")
            comChoiceLable.text = "보!"
        case Rps.scissors:
            comImgView.image = #imageLiteral(resourceName: "scissors")
            comChoiceLable.text = "가위!"
        }
        //내가 선택 한 것을 이미지 뷰에 표시
        //내가 선택 한 것을 레이블에 표시
        switch myChoice {
        case .rock:
            myImgView.image = #imageLiteral(resourceName: "rock")
            myChoiceLable.text = "바위!"
        case .paper:
            myImgView.image = #imageLiteral(resourceName: "paper")
            myChoiceLable.text = "보!"
        case .scissors:
            myImgView.image = #imageLiteral(resourceName: "scissors")
            myChoiceLable.text = "가위!"
        }
        //기존의 선택된 정보(가위 바위 보)를 비교 후 판단/표시
        if computerChoice == myChoice {
            mainLable.text = "비겼습니다"
        } else if computerChoice == .rock && myChoice == .paper {
            mainLable.text = "이겼습니다!"
        } else if computerChoice == .paper && myChoice == .scissors {
            mainLable.text = "이겼습니다!"
        } else if computerChoice == .scissors && myChoice == .rock {
            mainLable.text = "이겼습니다!"
        } else {
            mainLable.text = "졌네...허접❤︎허접❤︎"
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        //컴퓨터의 이미지 뷰 초기화
        //컴퓨터의 레이블 초기화
        comImgView.image = #imageLiteral(resourceName: "ready")
        comChoiceLable.text = "준비"
        //내 선택 이미지 뷰 초기화
        //내 선택 레이블 초기화
        myImgView.image = #imageLiteral(resourceName: "ready")
        myChoiceLable.text = "준비"
        //메인 레이블 "선택하세요" 표시
        if mainLable.text == "졌네...허접❤︎허접❤︎" {
            mainLable.text = "허접❤︎ 또 하려구?"
        } else {
            mainLable.text = "선택하세요"
        }
        //컴퓨터가 다시 랜덤 가위 바위 보를 선택하고 저장
        computerChoice = Rps(rawValue: Int.random(in: 0...2))!
    }
    
}

