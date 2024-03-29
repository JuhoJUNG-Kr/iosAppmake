//
//  DetailViewController.swift
//  TableViewCodeMakeProj
//
//  Created by 정주호 on 02/09/2022.
//

import UIKit
import PhotosUI
// MARK: - 디테일 뷰의 컨트롤러

final class DetailViewController: UIViewController {
    //디테일 뷰 불러오기
    private let detailView = DetailView()
    //프로토콜을 채택한 메인 뷰컨의 대리자를 디테일 뷰컨에 생성!
    /*프로토콜의 타입이 anyobject이기 때문에 클래스만 사용할 수 있는 프로토콜이며
     델리게이트 대리자를 weak으로 선언한 이유는, 디테일 뷰컨과 메인 뷰컨이 서로를 가리키는 상황이므로
     강한 참조 타입으로 인해 메모리 누수가 생길 수 있으므로 weak으로 선언한다.*/
    weak var delegate: MemberDelegate?
    
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
        setupTapGestures()
    }
    
    private func setupData() {
        detailView.member = member
    }
    
    //디테일 뷰 안에 있는 버튼의 타겟 설정
    func setupButtonAction() {
        detailView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    //제스쳐 설정 (이미지 뷰가 눌리면 실행)
    func setupTapGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchUpImageView))
        detailView.mainImageView.addGestureRecognizer(tapGesture)
        detailView.mainImageView.isUserInteractionEnabled = true
    }
    
    @objc func touchUpImageView() {
        //기본설정
        var configuration = PHPickerConfiguration()
        //한계 없이 사진을 가져오게 하기
        configuration.selectionLimit = 0
        //사진 or 비디오 둘다 선택 가능
        configuration.filter = .any(of: [.images, .videos])
        
        //기본설정을 가지고, 피커뷰 컨트롤러 설정
        let picker = PHPickerViewController(configuration: configuration)
        //피커뷰 컨트롤러 대리자 설정
        picker.delegate = self
        //피커뷰 띄우기
        self.present(picker, animated: true)
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
            
//            // 1) 델리게이트 방식이 아닌 구현⭐️
//            let index = navigationController!.viewControllers.count - 2
//            // 전 화면에 접근하기 위함
//            let vc = navigationController?.viewControllers[index] as! ViewController
//            // 전 화면의 모델에 접근해서 멤버를 추가
//            vc.memberListManager.makeNewMember(newMember)
            
            
            // 2) 델리게이트 방식으로 구현⭐️
            delegate?.addNewMember(newMember)
            
            
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
            
//            // 1) 델리게이트 방식이 아닌 구현⭐️
//            let index = navigationController!.viewControllers.count - 2
//            // 전 화면에 접근하기 위함
//            let vc = navigationController?.viewControllers[index] as! ViewController
//            // 전 화면의 모델에 접근해서 멤버를 업데이트
//            vc.memberListManager.updateMemberInfo(index: memberId, member!)
            /*위의 코드 설명.
             navigationController는 뷰 컨트롤러를 배열로 가지는 viewControllers를 관리 할 수 있음
             따라서 viewControllers의 count  - 1 을 해주면 바로 전화면으로 넘어감. 하지만 우리는
             가장 첫 번쨰 화면으로 넘어가야하기 때문에 - 2를 해줌
             0번째 화면인(배열의 맨 첫번째) 기본 메인 화면에 접근을 할 수있음. 그걸 index에 넣어준 뒤,
             타입캐스팅을 하고 vc에 넣어주면 우리는 쉽게 memberListManager에 접근해서 updateMemberInfo 함수를
             실행시킨 뒤, 새로운 정보를 저장할 수 있는거임.
            */
            // 델리게이트 방식으로 구현⭐️
            delegate?.update(index: memberId, member!)
        }
        
        // (일처리를 다한 후에) 전화면으로 돌아가기
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - Picker View extension

//사진첩 기능
extension DetailViewController: PHPickerViewControllerDelegate {
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        //피커뷰 dismiss
        picker.dismiss(animated: true)
        
        let itemProvider = results.first?.itemProvider
        
        if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                DispatchQueue.main.async {
                    self.detailView.mainImageView.image = image as? UIImage
                }
            }
        } else {
            print("No image")
        }
    }
}


