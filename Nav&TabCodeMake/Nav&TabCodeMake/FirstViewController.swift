//
//  FirstViewController.swift
//  Nav&TabCodeMake
//
//  Created by 정주호 on 22/08/2022.
//

import UIKit

class FirstViewController: UIViewController {
    
    // 로그인 여부에 관련된 참/거짓 저장하는 속성
    var isLoggedIn = false
    
    //var navigationController: UINavigationController? <-이미 UIViewController 안에 저장속성으로 선언 되어있음
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        makeUI()

        // ⭐️ 로그인이 되어있지 않다면 로그인화면 띄우기
        if !isLoggedIn {
            let vc = LoginViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false, completion: nil)
        }
        
        
    }
    
    func makeUI() {
        view.backgroundColor = .gray
        
        // (네비게이션바 설정관련) iOS버전 업데이트 되면서 바뀐 설정⭐️⭐️⭐️
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()  // 불투명으로
        //appearance.backgroundColor = .brown     // 색상설정
        
        //appearance.configureWithTransparentBackground()  // 투명으로
        
        navigationController?.navigationBar.tintColor = .blue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        //navigationController?.navigationBar.prefersLargeTitles = true -> 네비게이션 바 크기 크게 만들기
        
        title = "Main"
        
    }
    
}
