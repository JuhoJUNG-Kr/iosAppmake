//
//  ViewController.swift
//  TableViewCodeMakeProj
//
//  Created by 정주호 on 01/09/2022.
//

import UIKit

final class ViewController: UIViewController {
    
    //테이블 뷰(테이블 뷰를 만들 땐, 따로 클래스 파일을 만들 필요 x) 딱히 기능이 없기 때문
    private let tableView = UITableView()
    
    var memberListManager = MemberListManager()
    
    //네이게이션 안에 넣기 위한 버튼
    lazy var plusButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        return button
    }()
    
    // MARK: - ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        //처음에는 반드시 비즈니스 모델(뷰컨에 만든 멤버리스트 저장속성 인스턴스)에 데이터를 받아올것!
        view.backgroundColor = .white
        setupNaviBar()
        setupTableView()
        setupData()
        setupTableViewConstraints()
    }
    
//    //어떤 화면으로 넘어갔다가 다시 다른 화면이 재호출 될 때 사용하는 메서드
      //커스텀 델리게이트 패턴으로 사용할 때는 딱히 필요가 없다.
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        //디테일 화면에서 다시 테이블 뷰로 넘어올 때, 테이블 뷰 새로고침 해주세요~
//        tableView.reloadData()
//    }
    
    // MARK: - Navigation Bar Set Up

    func setupNaviBar() {
        title = "Members List"
        view.backgroundColor = .white
        // (네비게이션바 설정관련) iOS버전 업데이트 되면서 바뀐 설정⭐️⭐️⭐️
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()  // 불투명으로
        appearance.backgroundColor = .white    // 색상설정
        //appearance.configureWithTransparentBackground()  // 투명으로
        navigationController?.navigationBar.tintColor = .blue
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        //navigationController?.navigationBar.prefersLargeTitles = true -> 네비게이션 바 크기 크게 만들기
        
        //네비게이션 바 오른쪽 상단 버튼 설정
        self.navigationItem.rightBarButtonItem = self.plusButton
    }
    //데이터 불러오기 함수
    func setupData() {
        memberListManager.makeMembersListData() //일반적으로는 서버에 요청
    }
    //테이블 뷰 셋업 함수
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        //각 셀의 높이
        tableView.rowHeight = 60
        //스토리 보드가 아닌 코드로 작성했기 때문에, 자동으로 셀이 등록되지 않음. 반드시 해줄 것!⭐️
        //무엇을 등록? 뷰 폴더 안에 내가 만들어 놓은 셀을 등록할 것.
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MemberCell")
    }
    
    @objc func plusButtonTapped() {
        let detailVC = DetailViewController()
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    // MARK: - AutoLayout Table View

    func setupTableViewConstraints() {
        //뷰컨안에 테이블 뷰 넣기
        view.addSubview(tableView)
        //자동 오토레이아웃 끄기
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
            
        ])
    }
}
// MARK: - ViewCon Extention

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memberListManager.getMembersList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath) as! MyTableViewCell
        
        cell.member = memberListManager[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //디테일 화면으로 넘어가는 코드
        let detailVC = DetailViewController()
        //뷰컨에서 디테일 뷰컨으로 넘어가는 시기이기 때문에 이곳에서 델리게이트를 채택한다
        detailVC.delegate = self
        
        let array = memberListManager.getMembersList()
        
        detailVC.member = array[indexPath.row]
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension ViewController: MemberDelegate {
    
    func addNewMember(_ member: Member) {
        memberListManager.makeNewMember(member)
        tableView.reloadData()
    }
    
    func update(index: Int, _ member: Member) {
        memberListManager.updateMemberInfo(index: index, member)
        tableView.reloadData()
    }
}
