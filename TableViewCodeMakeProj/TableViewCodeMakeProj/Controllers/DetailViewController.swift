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
        // [1] 멤버가 없다면 (새로운 멤버를 추가하는 화면)
        if member == nil {
            // 입력이 안되어 있다면.. (일반적으로) 빈문자열로 저장
            let name = detailView.nameTextField.text ?? ""
            let age = Int(detailView.ageTextField.text ?? "")
            let phoneNumber = detailView.phoneNumberTextField.text ?? ""
            let address = detailView.addressTextField.text ?? ""
            
            // 새로운 멤버 (구조체) 생성
            var newMember =
            Member(name: name, age: age, phone: phoneNumber, address: address)
            newMember.memberImage = detailView.mainImageView.image
            
            // 1) 델리게이트 방식이 아닌 구현⭐️
            let index = navigationController!.viewControllers.count - 2
            // 전 화면에 접근하기 위함
            let vc = navigationController?.viewControllers[index] as! ViewController
            // 전 화면의 모델에 접근해서 멤버를 추가
            vc.memberListManager.makeNewMember(newMember)
            
            
            // 2) 델리게이트 방식으로 구현⭐️
            //delegate?.addNewMember(newMember)
            
            
        // [2] 멤버가 있다면 (멤버의 내용을 업데이트 하기 위한 설정)
        } else {
            // 이미지뷰에 있는 것을 그대로 다시 멤버에 저장
            member!.memberImage = detailView.mainImageView.image
            
            let memberId = Int(detailView.memberIdTextField.text!) ?? 0
            member!.name = detailView.nameTextField.text ?? ""
            member!.age = Int(detailView.ageTextField.text ?? "") ?? 0
            member!.phone = detailView.phoneNumberTextField.text ?? ""
            member!.address = detailView.addressTextField.text ?? ""
            
            // 뷰에도 바뀐 멤버를 전달 (뷰컨트롤러 ==> 뷰)
            detailView.member = member
            
            // 1) 델리게이트 방식이 아닌 구현⭐️
            let index = navigationController!.viewControllers.count - 2
            // 전 화면에 접근하기 위함
            let vc = navigationController?.viewControllers[index] as! ViewController
            // 전 화면의 모델에 접근해서 멤버를 업데이트
            vc.memberListManager.updateMemberInfo(index: memberId, member!)
            /*위의 코드 설명.
             navigationController는 뷰 컨트롤러를 배열로 가지는 viewControllers를 관리 할 수 있음
             따라서 viewControllers의 count  - 1 을 해주면 바로 전화면으로 넘어감. 하지만 우리는
             가장 첫 번쨰 화면으로 넘어가야하기 때문에 - 2를 해줌
             0번째 화면인(배열의 맨 첫번째) 기본 메인 화면에 접근을 할 수있음. 그걸 index에 넣어준 뒤,
             타입캐스팅을 하고 vc에 넣어주면 우리는 쉽게 memberListManager에 접근해서 updateMemberInfo 함수를
             실행시킨 뒤, 새로운 정보를 저장할 수 있는거임.
            */
            // 델리게이트 방식으로 구현⭐️
            //delegate?.update(index: memberId, member!)
        }
        
        // (일처리를 다한 후에) 전화면으로 돌아가기
        self.navigationController?.popViewController(animated: true)
    }
}
