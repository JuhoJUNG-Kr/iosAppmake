//
//  ViewController.swift
//  LottoPrj
//
//  Created by 정주호 on 04/10/2022.
//

import UIKit

final class MainViewController: UIViewController {
    
    var isLoggedIn = false

        override func viewDidLoad() {
            super.viewDidLoad()
            makeUI()
            if !isLoggedIn {
                let vc = LoginViewController()
                vc.modalPresentationStyle = .fullScreen
                present(vc, animated: false, completion: nil)
            }
        }
    
    func makeUI() {
        view.backgroundColor = .gray

//         (네비게이션바 설정관련) iOS버전 업데이트 되면서 바뀐 설정⭐️⭐️⭐️
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()  // 불투명으로
//        appearance.backgroundColor = .brown     // 색상설정

        //appearance.configureWithTransparentBackground()  // 투명으로

        navigationController?.navigationBar.tintColor = .blue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance

        title = "Main"

    }


}

