//
//  ListViewCell.swift
//  HomeWork19
//
//  Created by valeri mekhashishvili on 2/9/23.
//

import UIKit

protocol ListViewCellDelegetate {
    func onFavourite()
}

class ListViewCell: UITableViewCell {
    var model: ListCellModel?
    
    var delegate: ListViewCellDelegetate?
    
    var onFavourite: (() -> Void)?
    
    
    
    
    @IBOutlet private weak var profileImageView: UIImageView!
    
    @IBOutlet private  weak var userName: UILabel!
    
    @IBOutlet private weak var foodImageView: UIImageView!
    
    @IBOutlet private weak var foodName: UILabel!
    @IBOutlet weak var buttonChangable: UIButton!
    
    @IBAction func buttonStart(_ sender: Any) {
        
        if model?.isFavorite == true {
            model?.isFavorite = false
            buttonChangable.setImage(UIImage(named: "icons8-love-24"), for: .normal)
            
            guard let selectedIndex = list.firstIndex(where: { $0.id == model?.id ?? .init() }) else { return }
            list[selectedIndex].isFavorite = false
        } else {
            model?.isFavorite = true
            buttonChangable.setImage(UIImage(named: "icons8 orange"), for: .normal)
            
            guard let selectedIndex = list.firstIndex(where: { $0.id == model?.id ?? .init() }) else { return }
            list[selectedIndex].isFavorite = true
        }
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.profileImageView.layer.borderWidth = 1.0
        super.setSelected(selected, animated: animated)
        self.foodImageView.layer.cornerRadius = 15
        
        
        
        
        
    }
    
    @IBAction func onFavourite(_ sender: Any) {
        delegate?.onFavourite()
        
    }
    func setup(with model: ListCellModel) {
        self.model = model
        profileImageView.image = UIImage(named: model.profileImage)
        userName.text = model.userName
        foodImageView.image  = UIImage(named: model.foodImage)
        foodName.text = model.foodName
        buttonChangable.setImage(model.isFavorite ? .init(named: "icons8 orange") : .init(named: "icons8-love-24"), for: .normal)
    }
}



