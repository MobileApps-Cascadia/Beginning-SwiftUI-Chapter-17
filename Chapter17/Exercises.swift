//
//  Exercises.swift
//  Chapter17
//
//  Created by Mike Panitz on 5/14/23.
//

import SwiftUI

class Inventory: ObservableObject {
    @Published var items = [""]
}

struct Exercises: View {
    @StateObject var inventory = Inventory()
    @State var title = "Summary"
    var body: some View {
        NavigationStack {
            TabView(selection: $title) {
                Summary()
                    .tabItem {
                        Image(systemName: "book.closed")
                        Text("Summary")
                    }
                    .tag("Summary")
                Weapons()
                    .tabItem {
                        Image(systemName: "wrench.adjustable")
                        Text("Weapons")
                    }
                    .tag("Weapons")
                Armor()
                    .tabItem {
                        Image(systemName: "shield")
                        Text("Armor")
                    }
                    .tag("Armor")
            }
            .environmentObject(inventory)
            .navigationTitle(title)
        }
    }
}

struct Summary: View {
    @EnvironmentObject var inventory: Inventory
    var body: some View{
        List {
            ForEach(0...$inventory.items.count - 1, id: \.self) { index in
                if(!inventory.items[index].isEmpty){
                    Text(inventory.items[index])
                }
            }
        }
    }
}
struct Weapons: View {
    @EnvironmentObject var inventory: Inventory
    @State private var weapons = ["Sword", "Axe", "Bow"]
    var body: some View{
        List {
            ForEach(0...$weapons.count - 1, id: \.self) { index in
                Text(weapons[index])
                    .swipeActions {
                        Button ("Purchase"){
                            inventory.items.append(weapons[index])
                        }
                    }
            }
        }
    }
}
struct Armor: View {
    @EnvironmentObject var inventory: Inventory
    @State private var armor = ["Leather Armor", "Chain Mail", "Plate Mail"]
    var body: some View{
        List {
            ForEach(0...$armor.count - 1, id: \.self) { index in
                Text(armor[index])
                    .swipeActions {
                        Button ("Purchase"){
                            inventory.items.append(armor[index])
                        }
                    }
            }
        }
    }
}

struct Exercise_Previews: PreviewProvider {
    static var previews: some View {
        Exercises()
    }
}

