//
//  ContentView.swift
//  Shared
//
//  Created by dominator on 11/07/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List{
                NavigationLink(
                    destination: HierarchyList(),
                    label: {
                        Label("Hierarchy List", systemImage: "list.bullet.indent")
                    })
                NavigationLink(
                    destination: OutlineView(),
                    label: {
                        Label("Outline Group", systemImage: "list.triangle")
                    })
                NavigationLink(
                    destination: DisclosureView(),
                    label: {
                        Label("Disclosure Group", systemImage: "menubar.arrow.down.rectangle")
                    })
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Expanding hierarchy")
            .frame(minWidth: 100, idealWidth: 200, maxWidth: .infinity, minHeight: 300, idealHeight: 400, maxHeight: .infinity, alignment: .center)
            HierarchyList()
            Text("Select an file")
                .font(.title)
                .foregroundColor(.secondary)
                .frame(minWidth: 400, idealWidth: 800, maxWidth: .infinity, minHeight: 400, idealHeight: 800, maxHeight: .infinity, alignment: .center)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
