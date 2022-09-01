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
    
    // MARK: - ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        setupTableViewConstraints()
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
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
