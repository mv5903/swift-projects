//
//  Data.swift
//  Really Simple To-Do List
//
//  Created by Matthew Vandenberg on 12/10/21.
//  Manage list data stored in UserDefaults based on custom ListItem object array.
//

import Foundation
import UIKit

class Data {
    static var userDefaults = UserDefaults.standard
    
    /**
     Adds a ListItem object to userDefaults.
     */
    static func addItem(item: ListItem) -> Void {
        var items = getItems()
        items.append(item)
        if let encoded = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encoded, forKey: "items")
        }
    }
    
    /**
     Removes the specified ListItem object from userDefaults.
     */
    static func deleteItem(item: ListItem) -> Void {
        var items = getItems()
        if (!itemExists(item: item)) {
            print("Item does not exist in list!")
        }
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
        if let encoded = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encoded, forKey: "items")
        }
    }
    
    /**
     Gets array of all ListItem objects contained in userDefaults.
     */
    static func getItems() -> [ListItem] {
        if let data = UserDefaults.standard.data(forKey: "items") {
            do {
                let storedItems = try JSONDecoder().decode([ListItem].self, from: data)
                return storedItems
            } catch let err {
                print(err)
                return [ListItem]()
            }
        }
        return [ListItem]()
    }
    
    static func getItemsPrint() -> [ListItem] {
        if let data = UserDefaults.standard.data(forKey: "items") {
            do {
                let storedItems = try JSONDecoder().decode([ListItem].self, from: data)
                return storedItems
            } catch let err {
                print(err)
                return [ListItem]()
            }
        }
        return [ListItem]()
    }
    
    /**
     Checks if a ListItem object exists in the userDefaults ListItem objects list.
     */
    static func itemExists(item: ListItem) -> Bool {
        return getItems().contains(item)
    }
    
}

class ListItem : Codable, Equatable {
    var title: String
    var desc: String
    var dueDate: Date
    
    init(title: String, desc: String, dueDate: Date) {
        self.title = title
        self.desc = desc
        self.dueDate = dueDate
    }
    
    static func == (a: ListItem, b: ListItem) -> Bool {
        return
            a.title == b.title &&
            a.desc == b.desc &&
            a.dueDate == b.dueDate
    }
    
    func updateTitle(title: String) -> Void {
        Data.deleteItem(item: self)
        self.title = title
        Data.addItem(item: self)
    }
    
    func updateDescription(desc: String) -> Void {
        Data.deleteItem(item: self)
        self.desc = desc
        Data.addItem(item: self)
    }
    
    func updateDueDate(dueDate: Date) -> Void {
        Data.deleteItem(item: self)
        self.dueDate = dueDate
        Data.addItem(item: self)
    }
}
