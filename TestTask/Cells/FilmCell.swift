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
        label.minimumScaleFactor = 0.5
        label.lineBreakMode = .byClipping
        label.numberOfLines = 2
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

    // MARK: - Methods
    private func setupViews() {
        // imageFilm
        self.addSubview(self.imageFilm)
        self.imageFilm.snp.updateConstraints { (make) in
            make.top.left.equalTo(10)
            make.bottom.equalTo(-10)
            make.size.equalTo(CGSize(width: 60, height: 60))
        }

        // rusFilmName
        self.addSubview(self.rusFilmName)
        self.rusFilmName.snp.updateConstraints { (make) in
            make.top.bottom.equalTo(0)
            make.left.equalTo(imageFilm).inset(100)
            make.right.equalTo(-10)
        }

        // engFilmName
        self.addSubview(self.engFilmName)
        self.engFilmName.snp.updateConstraints { (make) in
            make.top.bottom.equalTo(50)
            make.left.equalTo(imageFilm).inset(100)
            make.bottom.equalTo(-10)
        }
    }

    func set(film: Film) {
        imageFilm.image = film.image
        rusFilmName.text = film.rusFilmName
        engFilmName.text = film.engFilmName
    }

    // MARK: - Initialisations
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
