//
//  AddItem.swift
//  Really Simple To-Do List
//
//  Created by Matthew Vandenberg on 12/15/21.
//

import Foundation
import SwiftUI

struct AddItem : View {
    @State var isPresented: Bool = false
    
    var listManager: ListManager
    
    @State var newItemName: String = ""
    @State var newItemDescription: String = ""
    @State var newItemDate: Date = Date()
    
    var body: some View {
        Image(systemName: "plus.circle").resizable().scaledToFill().frame(width: 25, height: 25)
            .onTapGesture {
                self.isPresented = true
            }
            .sheet(isPresented: $isPresented, content: {
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
                            Button(action: addItem) {
                                Text("Add Item")
                            }
                        }
                    }.navigationBarTitle(Text("Add New Task"))
                }
            })
    }
    
    func addItem() -> Void {
        var currentItems = listManager.decodeList()
        print("Added Item: \(newItemName):\(newItemDescription):\(newItemDate)")
        currentItems.append(ListItem(title: newItemName, desc: newItemDescription, date: newItemDate))
        listManager.encodeList(theItems: currentItems)
        listManager.refreshList()
        isPresented = false
    }
}


