//
//  Movie.swift
//  TableViewPrj
//
//  Created by 정주호 on 29/08/2022.
//

import UIKit

// MARK: - Movie Data

//하나의 획일된 데이터파일을 불러올 경우, class 보다 struct 가 빠르고 안정성이 있다.
struct Movie {
    //서버를 통해 데이터를 바로바로 가져올 수 있는 경우에는 let으로 설정하는 것이 좋다
    //영화 이미지는 옵셔널로 선언했기 때문에, 이미지가 없는 경우가 있을 수 있으므로 var를 선언하여 에러를 차단한다.
    var movieImage: UIImage?
    let movieName: String
    let movieDescription: String
    
}
