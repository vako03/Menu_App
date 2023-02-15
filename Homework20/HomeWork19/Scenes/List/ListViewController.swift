//
//  ListViewController.swift
//  HomeWork19
//
//  Created by valeri mekhashishvili on 2/8/23.
//

import UIKit
protocol TabbarDataDelegate: AnyObject {
    
    func sendDataToSecondTab(_ data: Any?)
}

var list: [ListCellModel] = [
    .init(profileImage: "images1", userName: "Allen Allen", foodImage: "breakfast1", foodName: "Eggs Benedict"),
    .init(profileImage: "images2", userName: "Alberty Alexander", foodImage: "download1", foodName: "Breakfast Burrito"),
    .init(profileImage: "images3", userName: "Bell Bennett", foodImage: "breakfast4", foodName: "French Toast")
]

class ListViewController: UIViewController {
    
    weak var delegate: TabbarDataDelegate?

    @IBOutlet private weak var listButton: UITabBarItem!
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ListViewCell", bundle: .main), forCellReuseIdentifier: "ListViewCell")
    }
    
    func openAlert(with title: String, and description: String) {
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .cancel))
        present(alert, animated: true)
    }
}

extension ListViewController: ListViewCellDelegetate {
    func onFavourite() {
        openAlert(with: "Favourite", and: "Information updated successfully")
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let lists = list[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListViewCell") as! ListViewCell
        cell.setup(with: lists)
        cell.delegate = self
        return cell
    }
    
}

