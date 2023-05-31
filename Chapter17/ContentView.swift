//
//  ContentView.swift
//  Chapter14
//
//  Created by Mike Panitz on 4/18/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            NavigationLink("Basic + Overflow") {
                PageView()
            }
            .padding()
            
            NavigationLink("Select Tab Programmatically") {
                SelectingTabView()
            }
            .padding()

            NavigationLink("One Way Data Sharing") {
                ShareDataOneWayView()
            }
            .padding()

            NavigationLink("Data Sharing through the Environment") {
                EnvironmentSharingView()
            }
            .padding()

            
            NavigationLink("Custom Environment Value") {
                CustomEnvKeyDemo()
            }
            .padding()
            
            NavigationLink("Luchau Exercise") {
                Exercise()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
