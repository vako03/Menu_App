//
//  AddViewController.swift
//  HomeWork19
//
//  Created by valeri mekhashishvili on 2/8/23.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    @IBOutlet private weak var addItem: UITabBarItem!
    
    
    var favoriteList: [ListCellModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ListViewCell", bundle: .main), forCellReuseIdentifier: "ListViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favoriteList = list.filter { $0.isFavorite }
        tableView.reloadData()
    }
}
func openAlert(with title: String, and description: String) {
    let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "ok", style: .cancel))
}


extension AddViewController: ListViewCellDelegetate {
    func onFavourite() {
        openAlert(with: "Favourite", and: "Information updated successfully")
    }
}

extension AddViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favoriteList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let lists = favoriteList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListViewCell") as! ListViewCell
        cell.setup(with: lists)
        cell.delegate = self
        return cell
    }
    
}

