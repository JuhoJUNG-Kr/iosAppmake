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
        Movie(movieImage: UIImage(named: "batman.png"), movieName: "배트맨", movieDescription: "배트맨이 출현하는 영화"),
        Movie(movieImage: UIImage(named: "captain.png"), movieName: "캡틴 아메리카", movieDescription: "캡틴 아메리카의 기원. 캡틴 아메리카는 어떻게 탄생하게 되었을까?"),
        Movie(movieImage: UIImage(named: "ironman.png"), movieName: "아이언맨", movieDescription: "토니 스타크가 출현, 아이언맨이 탄생하게된 계기가 재미있는 영화"),
        Movie(movieImage: UIImage(named: "thor.png"), movieName: "토르", movieDescription: "아스가르드의 후계자 토르가 지구에 오게되는 스토리"),
        Movie(movieImage: UIImage(named: "hulk.png"), movieName: "헐크", movieDescription: "브루스 배너 박사의 실험을 통해 헐크가 탄생하게 되는 영화"),
        Movie(movieImage: UIImage(named: "spiderman.png"), movieName: "스파이더맨", movieDescription: "피터 파커 학생에서 스파이더맨이 되는 과정을 담은 스토리"),
        Movie(movieImage: UIImage(named: "blackpanther.png"), movieName: "블랙펜서", movieDescription: "와칸다의 왕위 계승자 티찰과 블랙펜서가 되다."),
        Movie(movieImage: UIImage(named: "doctorstrange.png"), movieName: "닥터스트레인지", movieDescription: "외과의사 닥터 스트레인지가, 히어로가 되는 과정을 담은 영화"),
        Movie(movieImage: UIImage(named: "guardians.png"), movieName: "가디언즈 오브 갤럭시", movieDescription: "빌런 타노스에 맞서서 세상을 지키려는 가오겔 멤버들")
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
        return cell
    }
    

}

