//
//  EditItem.swift
//  Really Simple To-Do List
//
//  Created by Matthew Vandenberg on 12/15/21.
//

import Foundation
import SwiftUI

struct EditItem : View {
    
    var listManager: ListManager
    
    @State var newItemName: String
    @State var newItemDescription: String
    @State var newItemDate: Date
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Task Name")) {
                    TextField("Task Name", text: $newItemName)
                }
                Section(header: Text("Task Description")) {
                    TextField("Task Description", text: $newItemDescription)
                }
                Section(header: Text("Task Name")) {
                    DatePicker(selection: $newItemDate, displayedComponents: [.date, .hourAndMinute]) {
                        Text("Due Date")
                    }
                }
                Section(header: Text("Add Item")) {
                    Button(action: editItem) {
                        Text("Confirm Changes")
                    }
                }
            }.navigationBarTitle(Text("Edit \"\(newItemName)\""))
        }
    }
    
    func editItem() -> Void {
        var currentItems = listManager.decodeList()
        print("EDITED Item: \(newItemName):\(newItemDescription):\(newItemDate)")
        currentItems.append(ListItem(title: newItemName, desc: newItemDescription, date: newItemDate))
        listManager.encodeList(theItems: currentItems)
        listManager.refreshList()
    }
}
