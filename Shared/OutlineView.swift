//
//  OutlineView.swift
//  Expanding hierarchy
//
//  Created by dominator on 11/07/20.
//

import SwiftUI

struct OutlineView: View {
    var body: some View {
        List{
            OutlineGroup(Record.mvvm, children: \.subRecords) { record in
                RecordRow(record: record)
            }
            
            Section(header: Text("Swift Package Dependencies")) {
                OutlineGroup(Record.packages, children: \.subRecords) { record in
                    RecordRow(record: record)
                }
            }
            
        }
        .listStyle(SidebarListStyle())
        .navigationTitle("Outline Group")
        .frame(minWidth: 100, idealWidth: 200, maxWidth: .infinity, minHeight: 300, idealHeight: 400, maxHeight: .infinity, alignment: .center)
    }
}

struct OutlineView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OutlineView()
        }
    }
}
