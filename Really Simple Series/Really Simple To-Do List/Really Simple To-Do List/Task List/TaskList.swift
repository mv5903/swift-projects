//
//  TaskList.swift
//  Really Simple To-Do List
//
//  Created by Matthew Vandenberg on 12/15/21.
//

import Foundation
import SwiftUI

struct TaskList : View {
    @ObservedObject var listManager : ListManager
    var body: some View {
        GeometryReader { g in
            let HEIGHT = g.size.height
            let WIDTH = g.size.width
            VStack {
                ZStack {
                    Preferences().position(x: 30, y: -15)
                    AddItem(listManager: listManager).position(x: WIDTH - 30, y: -15)
                }
                Form {
                    ForEach(listManager.decodeList(), id: \.self) { item in
                        Section {
                            Item(listManager: listManager, item: item)
                        }
                    }
                }.position(x: WIDTH / 2, y: HEIGHT / 2).frame(height: HEIGHT)
            }
        }
    }
}

struct Item : View {
    var listManager: ListManager
    var item: ListItem
    @State private var showingConfirmAlert = false
    @State private var editPresented = false
    var body: some View {
        HStack {
            Text(item.title)
            Spacer()
            Text(item.getDate())
        }
        .contentShape(Rectangle())
        .onLongPressGesture {
            let impact = UIImpactFeedbackGenerator(style: .rigid)
            impact.impactOccurred()
        }
        .contextMenu
        {
            Button(action: {
                NavigationLink(destination: EditItem(listManager: listManager, newItemName: item.title, newItemDescription: item.desc, newItemDate: item.date)) {
                }
            }) {
                Label("Edit \"\(item.title)\"", systemImage: "pencil")
            }
            Button(role: .destructive) {
                deleteItem(item: item)
            } label: {
                Label("Delete \"\(item.title)\"", systemImage: "trash")
            }
        }
    }
    
    func showEditScreen() -> Void {
       
    }

    func deleteItem(item: ListItem) -> Void {
        var currentItems = listManager.decodeList()
        var itemToRemove = 0
        for i in 0...currentItems.count-1 {
            if (item.id == currentItems[i].id) {
                itemToRemove = i
                break
            }
        }
        currentItems.remove(at: itemToRemove)
        listManager.encodeList(theItems: currentItems)
        listManager.refreshList()
    }
}
