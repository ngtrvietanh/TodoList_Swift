//
//  ItemModel.swift
//  TodoList
//
//  Created by Việt Anh on 26/11/24.
//

import Foundation

import Foundation
//Immutable Struct
struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion () -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
