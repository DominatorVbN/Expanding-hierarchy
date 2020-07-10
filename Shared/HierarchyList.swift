//
//  OutlineView.swift
//  Expanding hierarchy
//
//  Created by dominator on 11/07/20.
//

import SwiftUI

struct HierarchyList: View {
    
    @ScaledMetric var size:CGFloat = 30
    
    var body: some View {
        List(Record.mvvm, children: \.subRecords) { record in
            RecordRow(record: record)
        }
        .listStyle(SidebarListStyle())
        .navigationTitle("Hierachy list")
        .frame(minWidth: 100, idealWidth: 200, maxWidth: .infinity, minHeight: 300, idealHeight: 400, maxHeight: .infinity, alignment: .center)
    }
}

struct HierarchyList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HierarchyList()
        }
    }
}
