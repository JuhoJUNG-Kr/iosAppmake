//
//  ViewController.swift
//  TableViewPrj
//
//  Created by 정주호 on 24/08/2022.
//

import UIKit
//table view를 사용하기 전에 UITableViewDataSource 프로토콜을 채택한다.
class ViewController: UIViewController {
    
    //var moviesArray: [Movie] = []
    
    //mvc 패턴이므로 dataManager 생성자를 생성하기(뷰컨에서 사용하기 위해)
    private var movieDataManager = DataManager()
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        //테이블뷰는 델리게이트가 아닌 데이터 소스에 할당할 것.
        //데이터 소스는 테이블 뷰가 어떤 형태를 가질 것인지에 대한 설정임
        //델리게이트는 테이블 뷰를 클릭하거나 스크롤 하거나 닫거나 할 때를 위한 세세한 설정임
        //둘다 따로 설정해야함
        tableView.dataSource = self
        //델리게이트 패턴을 위해 대리자 설정
        tableView.delegate = self
        //테이블 뷰에서 하나하나의 셀의 높이
        tableView.rowHeight = 120

        //mvc 패턴을 위해 만든 생성자 에서 makeMovieData함수를 호출하여 서버에서 데이터 받아오기
        movieDataManager.makeMovieData()
        /*⭐️그 후 생성자에 데이터가 받아졌으면,
         makeMovieData() 함수는 리턴형이 없는 서버에서 데이터를 받아오는 수단일 뿐이므로,
         먼저 뷰컨에서 만든 생성자 movieDataManager 안에 서버 데이터를 받아준 후,
         DataManager 파일 안에 리턴형이 [Movie]배열인 함수를 만들어 뷰컨의 배열안에 다시 넣어준다.
         쉽게 이해하기위해 makeMovieData() 함수는 리턴형이 없는 서버 데이터만을 받는 함수
         getMovieData() 는 리턴형을 [Movie] 배열로 만들어 직접 사용할 수 있게 해주는 함수
         */
        //moviesArray = movieDataManager.getMovieData()
        
        //네비게이션 바 타이틀은 이미 애플이 만들어놓았기 때문에 title 만 써줘도 됨
        title = "Movie"
    }
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        movieDataManager.updateMovieData()
        //데이터가 추가되었거나 변경되었으니 테이블 뷰를 새로 불러오세요~ 하는 메서드⭐️ 필수
        tableView.reloadData()
    }
}



// MARK: - Extension for Viewcon
//테이블 뷰 데이터 소스와 같은 뷰컨 안의 프로토콜들은 항상 익스텐션으로 구현
extension ViewController: UITableViewDataSource {
    //프로토콜 안에 내장된 필수 구현사항을 구현해주기! ⭐️
    //1) 몇개의 컨텐츠를 표시 할거니? 하고 물어보는 메서드
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //배열의 갯수를 세어서 표시하기
        return movieDataManager.getMovieData().count
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
        let moviesArray = movieDataManager.getMovieData()
        let movie = moviesArray[indexPath.row]
        cell.mainImageView.image = movie.movieImage
        cell.movieNameLabel.text = movie.movieName
        cell.descriptionLabel.text = movie.movieDescription
        //셀 클릭했을 때, 색깔이 바뀌지 않음
        //cell.selectionStyle = .none
        return cell
    }
}


extension ViewController: UITableViewDelegate {
    
    //테이블 뷰 안에서 셀이 선택되었을때
    //몇번째 셀이 선택되었는지는 설정할 필요 없음 indexPath 안에 자동으로 전달 받을 수있음.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //세그웨이를 통해 다음 화면으로 넘어가기. (스토리보드로 만들때만 가능)
        //센더에 인덱스패스 파라미터를 넣어 내가 선택한 행의 정보를 받아옴
        performSegue(withIdentifier: "toDetail", sender: indexPath)
    }
    
    //스토리보드로 작성시 데이터를 전달할 때, prepare 메서드를 사용한다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //세그웨이의 identifier의 이름이 내가 지정한 이름인 경우,
        if segue.identifier == "toDetail" {
            //타입캐스팅을 사용하여 타입을 맞춰준 뒤(내가 나타내고 싶은 화면의 클래스 이름) 사용
            let detailVC = segue.destination as! DetailViewController
            //먼저 전체 영화 데이터를 받아온다
            let array = movieDataManager.getMovieData()
            //그 후에, 내가 선택한 영화의 정보를 sender에서 꺼내기 위해 IndexPath로 타입캐스팅
            let indexPath = sender as! IndexPath
            //해준뒤, 내가 선택한 영화의 정보를 배열 안에서 꺼내오기
            detailVC.movieData = array[indexPath.row]
        }
    }

    
}

