//
//  Exercises.swift
//  Chapter17
//
//  Created by Mike Panitz on 5/14/23.
//

import SwiftUI

struct RPGItem: Identifiable {
    let id = UUID()
    let name: String
}

struct ExercisesView: View {
    @State private var summaryItems: [RPGItem] = []
    @State private var weaponItems: [RPGItem] = [
        RPGItem(name: "Sword"),
        RPGItem(name: "Bow"),
        RPGItem(name: "Staff")
    ]
    @State private var armorItems: [RPGItem] = [
        RPGItem(name: "Helmet"),
        RPGItem(name: "Chestplate"),
        RPGItem(name: "Gauntlets")
    ]

    var body: some View {
        TabView {
            SummaryView(items: $summaryItems)
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Summary")
                }

            WeaponsView(items: weaponItems, summaryItems: $summaryItems)
                .tabItem {
                    Image(systemName: "figure.archery")
                    Text("Weapons")
                }

            ArmorView(items: armorItems, summaryItems: $summaryItems)
                .tabItem {
                    Image(systemName: "shield")
                    Text("Armor")
                }
        }
    }
}

struct SummaryView: View {
    @Binding var items: [RPGItem]

    var body: some View {
        List {
            ForEach(items) { item in
                Text(item.name)
            }
            .onDelete { indices in
                items.remove(atOffsets: indices)
            }
        }
    }
}

struct WeaponsView: View {
    @State private var purchasedItems: [RPGItem] = []

    let items: [RPGItem]
    @Binding var summaryItems: [RPGItem]

    var body: some View {
        List {
            ForEach(items) { item in
                Text(item.name)
                    .swipeActions(edge: .trailing) {
                        Button(action: {
                            purchaseItem(item)
                        }) {
                            Label("Purchase", systemImage: "cart")
                        }
                    }
                    .swipeActions(edge: .leading) {
                        Button(action: {
                            undoPurchase(item)
                        }) {
                            Label("Undo", systemImage: "arrow.uturn.backward")
                        }
                        .tint(.red)
                    }
            }
        }
    }

    func purchaseItem(_ item: RPGItem) {
        purchasedItems.append(item)
        summaryItems.append(item)
    }

    func undoPurchase(_ item: RPGItem) {
        if let index = purchasedItems.firstIndex(where: { $0.id == item.id }) {
            purchasedItems.remove(at: index)
        }

        if let index = summaryItems.firstIndex(where: { $0.id == item.id }) {
            summaryItems.remove(at: index)
        }
    }
}

struct ArmorView: View {
    @State private var purchasedItems: [RPGItem] = []

    let items: [RPGItem]
    @Binding var summaryItems: [RPGItem]

    var body: some View {
        List {
            ForEach(items) { item in
                Text(item.name)
                    .swipeActions(edge: .trailing) {
                        Button(action: {
                            purchaseItem(item)
                        }) {
                            Label("Purchase", systemImage: "cart")
                        }
                    }
                    .swipeActions(edge: .leading) {
                        Button(action: {
                            undoPurchase(item)
                        }) {
                            Label("Undo", systemImage: "arrow.uturn.backward")
                        }
                        .tint(.red)
                    }
            }
        }
    }

    func purchaseItem(_ item: RPGItem) {
        purchasedItems.append(item)
        summaryItems.append(item)
    }

    func undoPurchase(_ item: RPGItem) {
        if let index = purchasedItems.firstIndex(where: { $0.id == item.id }) {
            purchasedItems.remove(at: index)
        }

        if let index = summaryItems.firstIndex(where: { $0.id == item.id }) {
            summaryItems.remove(at: index)
        }
    }
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView()
    }
}
