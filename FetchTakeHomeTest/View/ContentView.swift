//
//  ContentView.swift
//  FetchTakeHomeTest
//
//  Created by Kuiduan Zeng on 3/8/24.
//

import SwiftUI

struct ContentView: View {
    @State var items: [Item] = []
    
    var body: some View {
        VStack {
            Text("List of Items")
                .font(.headline)
            List(items) { item in
                Text("List ID: " + String(item.listId))
                    .font(.subheadline)
                Text("ID: " + String(item.id))
                    .font(.subheadline)
                Text("Name: " + (item.name ?? ""))
                Spacer()
            }.onAppear {
                ApiCall().getItems { (items) in
                    self.items = items
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
