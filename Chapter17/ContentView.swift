//
//  ContentView.swift
//  Chapter14
//
//  Created by Mike Panitz on 4/18/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            SelectingTabView()
                .tabItem {
                    Image(systemName: "a.circle")
                    Text("Nav View")
                }
            PageView()
                .tabItem {
                    Image(systemName: "b.circle")
                    Text("Buttons")
                }
//            NavSepFilesView()
//                .tabItem {
//                    Image(systemName: "c.circle")
//                    Text("Sep Files")
//                }
        }
        .tabItem {
            Image(systemName: "1.circle")
            Text("Demos")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
