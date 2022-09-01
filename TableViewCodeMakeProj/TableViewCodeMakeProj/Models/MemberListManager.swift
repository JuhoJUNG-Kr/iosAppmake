//
//  MemberListManager.swift
//  TableViewCodeMakeProj
//
//  Created by 정주호 on 01/09/2022.
//

import Foundation

final class MemberListManager {
    
    private var membersList: [Member] = []
    
    func makeMembersListData() {
        membersList = [
            Member(name: "홍길동", age: 20, phone: "07 04 28 62 84", address: "Seoul"),
            Member(name: "임꺽정", age: 25, phone: "07 89 92 04 82", address: "Busan"),
            Member(name: "스티브", age: 50, phone: "07 06 29 17 93", address: "USA"),
            Member(name: "쿡", age: 30, phone: "06 93 81 73 03", address: "LA"),
            Member(name: "베조스", age: 40, phone: "07 92 71 78 93", address: "Hawai"),
            Member(name: "배트맨", age: 40, phone: "06 81 93 94 02", address: "Godam"),
            Member(name: "조커", age: 40, phone: "07 77 77 77 77", address: "Godam")
        ]
    }
    
    //전체 멤버 리스트 열기
    func getMembersList() -> [Member] {
        return membersList
    }
    
    //새로운 멤버 만들기
    func makeNewMember(_ member: Member) {
        membersList.append(member)
    }
    
    //기존의 멤버 정보 업데이트
    func updateMemberInfo(index: Int, _ member: Member) {
        membersList[index] = member
    }
    
    //특정 멤버 얻기 (굳이 필요 없지만, 서브 스크립트 구현해보기
    subscript(index: Int) -> Member {
        get {
            return membersList[index]
        }
        set {
            membersList[index] = newValue
        }
    }
}
