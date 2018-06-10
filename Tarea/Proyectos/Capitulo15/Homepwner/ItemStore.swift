//
//  ItemStore.swift
//  Homepwner
//
//  Created by user140663 on 6/10/18.
//  Copyright © 2018 pkmntr. All rights reserved.
//

import Foundation

class ItemStore {
    
    var allItems: [Item] = []
    
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        let movedItem = allItems[fromIndex]
        allItems.remove(at: fromIndex)
        allItems.insert(movedItem, at: toIndex)
    }
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
    
    func removeItem(_ item: Item) {
        if let index = allItems.index(of: item) {
            allItems.remove(at: index)
        }
    }
    
}
