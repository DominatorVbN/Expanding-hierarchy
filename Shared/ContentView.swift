//
//  ContentView.swift
//  Shared
//
//  Created by dominator on 11/07/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var selection: Set<Int> = [0]
    
    var body: some View {
        NavigationView {
            
            List(selection: self.$selection) {
                
                NavigationLink(
                    destination: HierarchyList(),
                    label: {
                        Label("Hierarchy List", systemImage: "list.bullet.indent")
                    }
                )
                .tag(0)
                
                NavigationLink(
                    destination: OutlineView(),
                    label: {
                        Label("Outline Group", systemImage: "list.triangle")
                    }
                )
                .tag(1)
                
                NavigationLink(
                    destination: DisclosureView(),
                    label: {
                        Label("Disclosure Group", systemImage: "menubar.arrow.down.rectangle")
                    }
                )
                .tag(2)
                
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Expanding hierarchy")
            
            HierarchyList()
            
            Text("Select a file")
                .font(.title)
                .foregroundColor(.secondary)
                .frame(minWidth: 200, idealWidth: 300, maxWidth: .infinity, minHeight: 500, idealHeight: 800, maxHeight: .infinity, alignment: .center)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
