//
//  FilmInfoViewController.swift
//  TestTask
//
//  Created by Егор Янкович on 12/6/20.
//

import UIKit

class FilmInfoViewController: UIViewController {
    
    private let contentHeight: CGFloat
    
    init(contentHeight: CGFloat) {
        self.contentHeight = 200
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCykle
    override func viewDidLoad() {
        self.setupViews()
        super.viewDidLoad()
        self.setData()
    }
    
    // MARK: - GUI Variables to BottomSheetView
    let borderView: UIView = {
        let border = UIView()
        border.translatesAutoresizingMaskIntoConstraints = false
        border.backgroundColor = .white
        border.alpha = 0.4
        return border
    }()
    
    private var imageFilm: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    private var rusFilmName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 32)
        return label
    }()
    
    private var engFilmName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    
    private var dateFilm: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    
    private var infoFilm: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    // MARK:- Methods
    
    private func setData() {
        let url = URL(string:ViewController.DataForInfo.image)
        let data = try? Data(contentsOf: url!)
        let imagef = UIImage(data: data!)
        rusFilmName.text = ViewController.DataForInfo.name
        engFilmName.text = ViewController.DataForInfo.name_eng
        dateFilm.text =  ViewController.DataForInfo.premiere
        infoFilm.text = ViewController.DataForInfo.description
        imageFilm.image = imagef
    }
    
    private func setupViews(){
        view.backgroundColor = .white
        view.addSubview(borderView)
        
        // imageFilm
        view.addSubview(self.imageFilm)
        self.imageFilm.snp.updateConstraints { (make) in
            make.top.left.equalTo(10)
            make.bottom.equalTo(-10)
            make.size.equalTo(CGSize(width: 170, height: 170))
        }
        
        // rusFilmName
        view.addSubview(self.rusFilmName)
        self.rusFilmName.snp.updateConstraints { (make) in
            make.top.bottom.equalTo(view).inset(10)
            make.left.equalTo(imageFilm).inset(200)
            make.right.equalTo(-10)
        }
        
        // engFilmName
        view.addSubview(self.engFilmName)
        self.engFilmName.snp.updateConstraints { (make) in
            make.top.bottom.equalTo(50)
            make.left.equalTo(imageFilm).offset(200)
        }
        
        // dateFilm
        view.addSubview(self.dateFilm)
        self.dateFilm.snp.updateConstraints { (make) in
            make.top.bottom.equalTo(75)
            make.left.equalTo(imageFilm).inset(200)
            make.right.equalTo(-10)
        }
        
        // infoFilm
        view.addSubview(self.infoFilm)
        self.infoFilm.snp.updateConstraints { (make) in
            make.top.bottom.equalTo(200)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            // make.bottom.equalTo(10)
        }
    }
}
