//
//  ListManager.swift
//  Really Simple To-Do List
//
//  Created by Matthew Vandenberg on 12/15/21.
//

import Foundation
import SwiftUI

class ListManager : ObservableObject {
    @Published var isUpdating = ""
    @AppStorage("items") var items: [[String]] = [["TESTONE", "DESCONE", "10000000000"], ["TESTTWO", "DESCTWO", "10000000000"], ["TESTTHREE", "DESCTHREE", "10000000000"]]
    /*
     Think of data being represnted in tsv format, like so:
     TITLE     DESC            DATE
     Laundry   takes 50 mins   today
     Shopping  only groceries  tomorrow
     Homework  page 1-20       "" (if blank, there's no due date, etc)
     */
    
    init() {
        isUpdating = "."
    }
    
    /**
     Returns a 2d array of list
     */
    public func decodeList() -> [ListItem] {
        //For now, items will be TITLE, DESC, and DATE in that order
        var obj = [ListItem]()
        items.forEach { item in
            if (item.count == 3) {
                obj.append(ListItem(title: item[0], desc: item[1], date: Date.init(timeIntervalSince1970: Double(item[2]) ?? 0)))
            } else {
                obj.append(ListItem(id: item[0], title: item[1], desc: item[2], date: Date.init(timeIntervalSince1970: Double(item[3]) ?? 0)))
            }
            
        }
        return obj
    }
    
    /**
     Takes a array of dictionaries, where each dictionary represents one item in the list.
     */
    public func encodeList(theItems: [ListItem]) -> Void {
        var obj = [[String]]()
        theItems.forEach { item in
            obj.append(["\(item.id)", "\(item.title)", "\(item.desc)", "\(item.date.timeIntervalSince1970)"])
        }
        items = obj
    }
    
    public func refreshList() -> Void {
        print("Refresh Called!")
        isUpdating += "."
    }
}

class ListItem : Hashable, Equatable {
    var id: String
    var title: String
    var desc: String
    var date: Date
    
    init(title: String, desc: String, date: Date) {
        self.id = UUID().uuidString
        print("ID Randomly Generated: \(id)")
        self.title = title
        self.desc = desc
        self.date = date
    }
    
    init(id: String, title: String, desc: String, date: Date) {
        self.id = id
        self.title = title
        self.desc = desc
        self.date = date
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
    
    static func == (a: ListItem, b: ListItem) -> Bool {
        return
            a.title == b.title &&
            a.desc == b.desc &&
            a.date == b.date
    }
    
    func getDate() -> String {
        let df = DateFormatter()
        df.dateStyle = .medium
        df.timeStyle = .none
        df.locale = Locale(identifier: "en_US")
        return df.string(from: self.date)
    }
}

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}
