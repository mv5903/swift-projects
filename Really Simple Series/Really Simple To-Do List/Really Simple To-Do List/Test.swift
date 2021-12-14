//
//  Test.swift
//  Really Simple To-Do List
//
//  Created by Matthew Vandenberg on 12/12/21.
//

import Foundation

struct Test {
    static func getText() -> String {
        
        clearUserDefaults()
        
        let testDate = Date(timeIntervalSinceReferenceDate: 1000000000)
        
        let a = ListItem(title: "Test", desc: "Text", dueDate: testDate)
        
        for i in 1...3 {
            Data.addItem(item: a)
        }
        
        printItems()
        
        return "Hello There"
    }
    
    static func clearUserDefaults() -> Void {
        //TEMPORARY FOR TESTING PURPOSES: START
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
        //END
    }
    
    /**
     Returns current date within the device's specific locale.
     */
    static func printItems() -> Void {
        let allItems = Data.getItems()
        print("{")
        allItems.forEach { item in
            print("[\(item.title), \(item.desc), \(item.getDate())]")
        }
        print("}")
    }
}
