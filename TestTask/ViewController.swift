//
//  ViewController.swift
//  TestTask
//
//  Created by Егор Янкович on 12/5/20.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTabButtons()
        view.backgroundColor = .yellow
    }
    
    private func setTabButtons() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Load Data", style: .plain, target: self, action: #selector(loadData))
    }
    
    @objc private func loadData(){
        print("worked")
    }
    
}

