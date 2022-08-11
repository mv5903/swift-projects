//
//  TaskList.swift
//  Really Simple To-Do List
//
//  Created by Matthew Vandenberg on 12/10/21.
//

import Foundation
import SwiftUI

struct TaskList: View {
    @StateObject var items = Data()
    var body: some View {
        GeometryReader { geo in
            let HEIGHT = geo.size.height
            let WIDTH = geo.size.width
            VStack {
                ZStack {
                    Preferences().position(x: 30, y: -15)
                    AddItem().position(x: WIDTH - 30, y: -15)
                }
                Form {
                    ItemsView(listItems: items)
                }
                    .position(x: WIDTH / 2, y: HEIGHT / 2)
                    .frame(height: HEIGHT)
            }
        }
    }
}

struct ItemsView: View {
    @ObservedObject var listItems: Data
    
    var body: some View {
        ForEach(Data.getItems(), id: \.self) { item in
            Section {
                Task(item: item)
            }
        }
    }
}

struct Task: View {
    var item: ListItem
    var body: some View {
        HStack {
            Text(item.title)
            Spacer()
            Text(item.getDate())
        }
    }
}
