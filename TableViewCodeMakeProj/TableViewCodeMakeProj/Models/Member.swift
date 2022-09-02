//
//  Member.swift
//  TableViewCodeMakeProj
//
//  Created by 정주호 on 01/09/2022.
//

import UIKit
//디테일 뷰 컨트롤러에서 일어나는 일(정보 업데이트 or 삭제)를 메인 뷰 컨으로 전달하기 위해 프로토콜을 채택
//AnyObject 타입으로 설정해야 클래스에서만 사용할 수 있는 프로토콜이 된다
protocol MemberDelegate: AnyObject {
    //멤버 추가하기
    func addNewMember(_ member: Member)
    //기존 멤버의 정보 업데이트
    //몇번째 멤버의 업테이트인지 알아야 함
    func update(index: Int, _ member: Member)
}

//클래스는 무겁기 때문에 간단한 데이터 모델 같은 경우는 구조체로 만들자
struct Member {
    //타입 저장 속성. 모든 인스턴스가 공통으로 사용할 수 있는 속성
    lazy var memberImage: UIImage? = {
        //이름이 없다면, 시스템 사람 이미지 세팅(기본 사진)
        guard let name = name else {
            return UIImage(systemName: "person")
        }
        //해당 이름으로 된 이미지가 없으면, 시스템 사람 이미지 셋팅(기본 사진)
        return UIImage(named: "\(name).png") ?? UIImage(systemName: "person")
    }()
    
    static var memberNumbers: Int = 0
    
    let memberId: Int
    var name: String?
    var age: Int?
    var phone: String?
    var address: String?
    
    init(name: String?, age: Int?, phone: String?, address: String?) {
        self.memberId = Member.memberNumbers
        //나머지 저장속성은 외부에서 셋팅
        self.name = name
        self.age = age
        self.phone = phone
        self.address = address
        
        //멤버를 생성하면 항상 타입 저장속성의 정수값 + 1
        Member.memberNumbers += 1
    }
}
