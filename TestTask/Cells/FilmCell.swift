//
//  FilmCell.swift
//  TestTask
//
//  Created by Егор Янкович on 12/5/20.
//

import UIKit
import SnapKit

class FilmCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViews()
    }
    
    // MARK: - UI Variables
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
        label.font = .boldSystemFont(ofSize: 25)
        return label
    }()
    
    private var engFilmName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 10)
        return label
    }()
    
    private func setupViews() {
        
        // imageFilm
        self.addSubview(self.imageFilm)
        self.imageFilm.snp.updateConstraints { (make) in
            make.top.left.equalTo(10)
            make.bottom.equalTo(-10)
            make.size.equalTo(CGSize(width: 40, height: 40))
        }
        
        // rusFilmName
        self.addSubview(self.rusFilmName)
        self.rusFilmName.snp.updateConstraints { (make) in
            make.top.bottom.equalTo(0)
            make.left.equalTo(imageFilm).inset(70)
            make.bottom.equalTo(-10)
        }
        
        // engFilmName
        self.addSubview(self.engFilmName)
        self.engFilmName.snp.updateConstraints { (make) in
            make.top.bottom.equalTo(35)
            make.left.equalTo(imageFilm).inset(70)
            make.bottom.equalTo(-10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(film: Film) {
        imageFilm.image = film.image
        rusFilmName.text = film.rusFilmName
        engFilmName.text = film.engFilmName
    }
}


