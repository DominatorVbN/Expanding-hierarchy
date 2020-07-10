//
//  RecordRow.swift
//  Expanding hierarchy
//
//  Created by dominator on 11/07/20.
//

import SwiftUI

struct RecordRow: View {
    let record: Record
    
    @ViewBuilder
    var body: some View {
        switch record.type {
        case .file:
            NavigationLink(
                destination:
                    Text(record.name)
                    .font(.title)
                    .foregroundColor(.secondary)
                    .frame(minWidth: 200, idealWidth: 400, maxWidth: .infinity, minHeight: 200, idealHeight: 400, maxHeight: .infinity, alignment: .center)
                ,
                label: {
                    Label(record.name, systemImage: "swift")
                        .accentColor(.red)
                })
        case .folder:
            Label(record.name, systemImage: "folder.fill")
                .accentColor(.yellow)
        case .package:
            Label(record.name, systemImage: "shippingbox.fill")
                .accentColor(.gray)
        }
    }
}

struct RecordRow_Previews: PreviewProvider {
    static var previews: some View {
        RecordRow(record: Record(name: "Folder", type: .folder, subRecords: nil))
    }
}
