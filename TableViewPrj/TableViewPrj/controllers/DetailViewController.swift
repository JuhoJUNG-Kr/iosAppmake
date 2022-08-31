//
//  DetailViewController.swift
//  TableViewPrj
//
//  Created by 정주호 on 31/08/2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var mainImgView: UIImageView!
    
    @IBOutlet weak var movieNameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var movieData: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup UI Func

    func setupUI() {
        mainImgView.image = movieData?.movieImage
        movieNameLabel.text = movieData?.movieName
        descriptionLabel.text = movieData?.movieDescription
    }

}
