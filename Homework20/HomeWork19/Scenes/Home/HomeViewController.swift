//
//  HomeViewController.swift
//  HomeWork19
//
//  Created by valeri mekhashishvili on 2/8/23.
//

import UIKit

class HomeViewController: UIViewController  {
    
    @IBOutlet private  weak var posterImageView: UIImageView!
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    @IBAction private func arrowButtonTapped(_ sender: UIButton) {
            let visibleCells = collectionView.visibleCells
            if let visibleCell = visibleCells.last {
                let indexPath = collectionView.indexPath(for: visibleCell)
                if indexPath!.row + 1 < collectionView.numberOfItems(inSection: indexPath!.section) {
                    let nextIndexPath = IndexPath(row: indexPath!.row + 1, section: indexPath!.section)
                    collectionView.scrollToItem(at: nextIndexPath, at: .right, animated: true)
                }
            }
        }
    
    @IBOutlet private weak var homeItem: UITabBarItem!
    
    var breakfast: [BreakfastCellModel] =  [
        .init(imageName: "breakfast1", breakfastTitle: "Toasted English Muffin"),
        .init(imageName: "breakfast2", breakfastTitle: "Eggs Benedict"),
        .init(imageName: "breakfast3", breakfastTitle: "Breakfast Burrito"),
        .init(imageName: "breakfast4", breakfastTitle: "French Toast"),
        
        ]
     
    override func viewDidLoad() {
        super.viewDidLoad()
        self.posterImageView.layer.cornerRadius = 20
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "BreakfastCell", bundle: nil), forCellWithReuseIdentifier: BreakfastCell.identifier)
    }

}

extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        breakfast.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let breakfasts = breakfast[indexPath.row]

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BreakfastCell.identifier, for: indexPath) as! BreakfastCell
        cell.setup(with: breakfasts)
        return cell
    }
    
    
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(indexPath.row)
        
    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.height, height: collectionView.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        5
    }
    
}

