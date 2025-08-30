//  ShoppingListView.swift
//  MD103
//
//  Created by Andrew Hershey on 8/26/25.

import SwiftUI

struct ShoppingListView: View {
    @State private var items = ["Eggs", "Apples"]
    @State private var newItem = ""

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(items, id: \.self) { item in
                        HStack {
                            Text(item)
                            Spacer()
                            Button(action: {
                                if let index = items.firstIndex(of: item) {
                                    items.remove(at: index)
                                }
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }

                HStack {
                    TextField("Add item", text: $newItem)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button(action: {
                        if !newItem.trimmingCharacters(in: .whitespaces).isEmpty {
                            items.append(newItem)
                            newItem = ""
                        }
                    })
                    {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                            .foregroundColor(.blue)
                    }
                }
                .padding()
            }
            .navigationTitle("Shopping List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button(action: { items.sort() }) {
                            Label("Sort A - Z", systemImage: "textformat.abc")
                        }
                        Button(action: { items.reverse() }) {
                            Label("Sort Items Backwards", systemImage: "arrow.up.arrow.down")
                        }
                    } label: {
                        Label("Options", systemImage: "ellipsis.circle")
                    }
                }
            }
        }
    }
}

#Preview {
    ShoppingListView()
}

