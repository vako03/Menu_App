//
//  listCellModel.swift
//  HomeWork19
//
//  Created by valeri mekhashishvili on 2/9/23.
//

import Foundation

struct ListCellModel {
    public init(profileImage: String, userName: String, foodImage: String, foodName: String, isFavorite: Bool = false, id: UUID = .init()) {
        self.profileImage = profileImage
        self.userName = userName
        self.foodImage = foodImage
        self.foodName = foodName
        self.isFavorite = isFavorite
        self.id = id
    }
    
    let profileImage: String
    let userName: String
    let foodImage: String
    let foodName: String
    var isFavorite: Bool
    let id: UUID
}
