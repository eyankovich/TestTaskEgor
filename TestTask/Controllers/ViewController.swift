//
//  ViewController.swift
//  TestTask
//
//  Created by Егор Янкович on 12/5/20.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK:- Variables
    var filmsListTable: [Film] = []
    var imageF = UIImage()
    
    struct Cells {
        static let filmCell = "filmCell"
    }
    
    lazy var filmsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Settings"
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var filmsTable: UITableView = {
        let table = UITableView()
        table.layer.cornerRadius = 10
        table.backgroundColor = UIColor.init(named: "Color1")
        table.register(FilmCell.self, forCellReuseIdentifier: Cells.filmCell)
        return table
    }()
    
    // MARK:-  LifeCykle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTabButtons()
        self.setupView()
        view.backgroundColor = .white
        filmsTable.delegate = self
        filmsTable.dataSource = self
    }
    
    // MARK:- Methods
    private func setupView() {
        view.addSubview(filmsLabel)
        filmsLabel.snp.makeConstraints { (make) in
            make.top.equalTo(120)
            make.left.equalTo(20)
        }
        
        self.view.addSubview(filmsTable)
        self.filmsTable.snp.makeConstraints { (make) in
            make.top.equalTo(filmsLabel).inset(70)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(-50)
        }
    }
    
    private func setTabButtons() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Load Data", style: .plain, target: self, action: #selector(loadData))
    }
    
    private func fetchData() -> [Film] {
        
        var tempArray: [Film] = []
        let films = Parcer.parce(url: "http://www.mocky.io/v2/57cffac8260000181e650041")!
        films.forEach{
            let url = URL(string:$0.image)
            let data = try? Data(contentsOf: url!)
            let image = UIImage(data: data!)
            
            tempArray.append(Film(image: image!, rusFilmName: $0.name, engFilmName: $0.name_eng))
        }
        return tempArray
    }
    
    @objc private func loadData(){
        filmsListTable = fetchData()
        filmsTable.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filmsListTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.filmCell) as! FilmCell
        let film = filmsListTable[indexPath.row]
        cell.set(film: film )
        return cell
    }
}
