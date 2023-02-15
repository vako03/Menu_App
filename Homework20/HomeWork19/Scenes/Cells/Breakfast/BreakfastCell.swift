//
//  BreakfastCell.swift
//  HomeWork19
//
//  Created by valeri mekhashishvili on 2/9/23.
//

import UIKit

class BreakfastCell: UICollectionViewCell {

    @IBOutlet private weak var breakfastImage: UIImageView!
    
    @IBOutlet private weak var breakfastTitle: UILabel!

    static let identifier = "BreakfastCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(with model: BreakfastCellModel) {
        breakfastImage.image = UIImage(named: model.imageName)
        breakfastTitle.text = model.breakfastTitle
        breakfastTitle.numberOfLines = 0
        self.breakfastImage.layer.cornerRadius = 20
    }
}
