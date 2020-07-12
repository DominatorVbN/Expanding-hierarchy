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
                destination: text,
                label: {
                    Label {
                        Text(record.name)
                    } icon: {
                        Image(systemName: "swift")
                            .foregroundColor(.red)
                    }
                }
            )
            
        case .folder:
            Label(record.name, systemImage: "folder.fill")
                .accentColor(.yellow)
            
        case .package:
            Label(record.name, systemImage: "shippingbox.fill")
                .accentColor(.gray)
            
        }
        
    }
    
    var text: some View {
        Text(record.name)
            .font(.title)
            .foregroundColor(.secondary)
            .frame(minWidth: 200, idealWidth: 300, maxWidth: .infinity, minHeight: 500, idealHeight: 800, maxHeight: .infinity, alignment: .center)
    }
    
}

struct RecordRow_Previews: PreviewProvider {
    static var previews: some View {
        RecordRow(record: Record(name: "Folder", type: .folder, subRecords: nil))
    }
}
