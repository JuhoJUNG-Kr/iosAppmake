//
//  ViewController.swift
//  TableViewPrj
//
//  Created by 정주호 on 24/08/2022.
//

import UIKit
//table view를 사용하기 전에 UITableViewDataSource 프로토콜을 채택한다.
class ViewController: UIViewController,UITableViewDataSource {
    
    var moviesArray: [Movie] = [

    ]

    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //테이블뷰는 델리게이트가 아닌 데이터 소스에 할당할 것.
        //델리게이트 패턴과 같지만 이름만 데이터 소스임. 
        tableView.dataSource = self
        //테이블 뷰에서 하나하나의 셀의 높이
        tableView.rowHeight = 120
    }
    
    
    //프로토콜 안에 내장된 필수 구현사항을 구현해주기! ⭐️
    //1) 몇개의 컨텐츠를 표시 할거니? 하고 물어보는 메서드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //배열의 갯수를 세어서 표시하기
        return moviesArray.count
    }
    //2) 구체적인 셀의 형태는 어떻게 할거야? 하고 물어보는 메서드
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //기존에 만들어 놓은 셀을 꺼내서 쓸거야~(스토리보드에서 만들어 놓은 테이블 뷰 셀) identifier 확인할것
        /*
         타입캐스팅을 하는 이유
         dequeueReusableCell메서드는 UITableViewCell 타입이므로 타입캐스팅 as! MainTableViewCell 로 바꾸어서
         let cell <- 이것의 타입을 UITableViewCell 이 아닌 MainTableViewCell로 변환해야 한다. 옵션을 눌러서 타입을 확인해보자
         */
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        //인덱스 패스의 중요한 두가지 개념
        //row는 행을 나타내고, section은 행을 가지는 그룹을 나타냄
        //ex) 0번째 그룹(section)의 2번째 행(row)
        //indexPath.section
        //indexPath.row
        
        let movie = moviesArray[indexPath.row]
        cell.mainImageView.image = movie.movieImage
        cell.movieNameLabel.text = movie.movieName
        cell.descriptionLabel.text = movie.movieDescription
        //셀 클릭했을 때, 색깔이 바뀌지 않음
        //cell.selectionStyle = .none
        return cell
    }
    

}

