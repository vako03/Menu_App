//
//  FavouriteViewCell.swift
//  HomeWork19
//
//  Created by valeri mekhashishvili on 2/12/23.
//

import UIKit

protocol TabarDataDelegate: AnyObject {
    
    func deleteDataTo(_ data: Any?)
}

class FavouriteViewCell: UITableViewCell {
    
    weak var delegate: TabarDataDelegate?
    
    @IBOutlet private weak var profileImageView: UIImageView!
    
    @IBOutlet private  weak var userName: UILabel!
    
    @IBOutlet private weak var foodImageView: UIImageView!
    
    @IBOutlet private weak var foodName: UILabel!
    
    @IBOutlet weak var buttonChangable: UIButton!
    
    
    
    var SelectedIndexPath = IndexPath()
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         SelectedIndexPath = indexPath
    }

    @IBAction func didTapDeleteBtn(_ sender: Any) {
        print("didTapDeleteBtn")
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    @IBAction func addPostTapped(_ sender: UIButton) {
        
    }
    
    func openAlert(with title: String, and description: String) {
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .cancel))
    }

}

