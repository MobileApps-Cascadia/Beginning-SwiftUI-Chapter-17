import SwiftUI

class Selected: ObservableObject {
    @Published var items = [""]
}
struct Exercise: View {
    @StateObject var inventory = Selected()
    @State var tab = "Summary"
    var body: some View {
        NavigationStack{
            TabView (selection: $tab){
                Inventory()
                      .tabItem {
                          Image(systemName: "person.fill.questionmark")
                          Text("Inventory")
                      }
                      .tag("Inventory")
                  Weapons()
                      .tabItem {
                          Image(systemName: "person.fill.badge.plus")
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
              .navigationTitle(tab)
          }
      }
  }

struct Inventory: View {
     @EnvironmentObject var inventory: Selected
     var body: some View{
         List {
             Text("Here is what you have chosen to Steal")
             ForEach(0...$inventory.items.count - 1, id: \.self) { index in
                 if(!inventory.items[index].isEmpty){
                     Text(inventory.items[index])
                 }
             }
             
         }
     }
 }
 struct Weapons: View {
     @EnvironmentObject var inventory: Selected
     @State private var weapons = ["Sword", "Dagger", "Knife"]
     var body: some View{
         List {
             ForEach(0...$weapons.count - 1, id: \.self) { index in
                 Text(weapons[index])
                     .swipeActions {
                         Button ("Steal"){
                            inventory.items.append(weapons[index])
                         }
                         .tint(Color.red)
                     }
             }
         }
     }
 }
 struct Armor: View {
     @EnvironmentObject var inventory: Selected
     @State private var armor = ["Leather", "Cloth", "Steel"]
     var body: some View{
         List {
             ForEach(0...$armor.count - 1, id: \.self) { index in
                 Text(armor[index])
                     .swipeActions {
                         Button ("Steal"){
                             inventory.items.append(armor[index])
                         }
                         .tint(Color.purple)
                     }
             }
         }
     }
 }
