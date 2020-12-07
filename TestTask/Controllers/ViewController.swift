//
//  ViewController.swift
//  TestTask
//
//  Created by Егор Янкович on 12/5/20.
//

import UIKit
import SnapKit
import BottomSheet

class ViewController: UIViewController {
    
    // MARK:- Variables
    var filmsListTable: [Film] = []
    var imageF = UIImage()
    var fullFilmListArray: [FilmItems] = []
    
    
    struct DataForInfo {
        static var image: String = ""
        static var name: String = ""
        static var name_eng: String = ""
        static var premiere: String = ""
        static var description: String = ""
    }
    
    struct Cells {
        static let filmCell = "filmCell"
    }
    
    lazy var filmsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Films"
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
    
    private lazy var bottomSheetTransitioningDelegate = BottomSheetTransitioningDelegate(
        contentHeights: [.bottomSheetAutomatic, UIScreen.main.bounds.size.height - 200],
        presentationDelegate: self)
    
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
    
    @objc private func presentViewController() {
        let viewController = FilmInfoViewController(contentHeight: 400)
        viewController.transitioningDelegate = bottomSheetTransitioningDelegate
        viewController.modalPresentationStyle = .custom
        present(viewController, animated: true)
    }
    
    
    private func setTabButtons() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Load Data", style: .plain, target: self, action: #selector(loadData))
    }
    
    private func fetchData() -> [Film] {
        var tempArray: [Film] = []
        let url = "http://www.mocky.io/v2/57cffac8260000181e650041"
        let films = Parcer.parce(url: url)
        if films != nil {
            fullFilmListArray = films!
            films!.forEach{
                let url = URL(string:$0.image)
                let data = try? Data(contentsOf: url!)
                let image = UIImage(data: data!)
                tempArray.append(Film(image: image!, rusFilmName: $0.name, engFilmName: $0.name_eng))
            }
        } else {
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
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DataForInfo.image = fullFilmListArray[indexPath.row].image
        DataForInfo.name = fullFilmListArray[indexPath.row].name
        DataForInfo.name_eng = fullFilmListArray[indexPath.row].name_eng
        DataForInfo.premiere = fullFilmListArray[indexPath.row].premiere
        DataForInfo.description = fullFilmListArray[indexPath.row].description
        presentViewController()
    }
}

extension ViewController: BottomSheetPresentationControllerDelegate {
    
    func bottomSheetPresentationController(
        _ controller: UIPresentationController,
        shouldDismissBy action: BottomSheetView.DismissAction
    ) -> Bool {
        return true
    }
    
    func bottomSheetPresentationController(
        _ controller: UIPresentationController,
        didCancelDismissBy action: BottomSheetView.DismissAction
    ) {
        print("Did cancel dismiss by \(action)")
    }
    
    func bottomSheetPresentationController(
        _ controller: UIPresentationController,
        willDismissBy action: BottomSheetView.DismissAction?
    ) {
        print("Will dismiss dismiss by \(String(describing: action))")
    }
    
    func bottomSheetPresentationController(
        _ controller: UIPresentationController,
        didDismissBy action: BottomSheetView.DismissAction?
    ) {
        print("Did dismiss dismiss by \(String(describing: action))")
    }
}


