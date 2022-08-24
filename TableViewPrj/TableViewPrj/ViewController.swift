//
//  ViewController.swift
//  TableViewPrj
//
//  Created by 정주호 on 24/08/2022.
//

import UIKit
//table view를 사용하기 전에 UITableViewDataSource 프로토콜을 채택한다.
class ViewController: UIViewController,UITableViewDataSource {
    


    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //테이블뷰는 델리게이트가 아닌 데이터 소스에 할당할 것.
        //델리게이트 패턴과 같지만 이름만 데이터 소스임. 
        tableView.dataSource = self
    }
    
    
    //프로토콜 안에 내장된 필수 구현사항을 구현해주기! ⭐️
    //1) 몇개의 컨텐츠를 표시 할거니? 하고 물어보는 메서드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    //2) 구체적인 셀의 형태는 어떻게 할거야? 하고 물어보는 메서드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    

}

