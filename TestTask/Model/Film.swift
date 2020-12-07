//
//  Film.swift
//  TestTask
//
//  Created by Егор Янкович on 12/5/20.
//

import UIKit

class Film {
    
    var image: UIImage
    var rusFilmName: String
    var engFilmName: String
    
    init(image: UIImage, rusFilmName: String, engFilmName: String) {
        self.image = image
        self.rusFilmName = rusFilmName
        self.engFilmName = engFilmName
    }
}
