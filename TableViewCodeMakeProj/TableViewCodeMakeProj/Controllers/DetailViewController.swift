//
//  DetailViewController.swift
//  TableViewCodeMakeProj
//
//  Created by 정주호 on 02/09/2022.
//

import UIKit

// MARK: - 디테일 뷰의 컨트롤러

final class DetailViewController: UIViewController {
    //디테일 뷰 불러오기
    private let detailView = DetailView()
    
    //셀을 클릭했을 때, 멤버 정보를 받아오기
    var member: Member?
    
    //super. 안해도 됨
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonAction()
        setupData()
    }
    
    private func setupData() {
        detailView.member = member
    }
    
    //디테일 뷰 안에 있는 버튼의 타겟 설정
    func setupButtonAction() {
        detailView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    @objc func saveButtonTapped() {
        print("button Tapped")
    }
}
