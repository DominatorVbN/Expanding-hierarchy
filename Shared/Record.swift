//
//  Record.swift
//  Expanding hierarchy
//
//  Created by dominator on 11/07/20.
//

import Foundation

struct Record: Identifiable {
    enum RecordType{
        case folder
        case file
        case package
    }
    let id = UUID()
    let name: String
    let type: RecordType
    let subRecords: [Record]?
}


extension Record{
    static var mvvm: [Record]{
        [
            Record(
                name: "Project Name",
                type: .folder,
                subRecords: [
                    Record(
                        name: "Scenes",
                        type: .folder,
                        subRecords: [
                            Record(
                                name: "ContentView",
                                type: .folder,
                                subRecords: [
                                    Record(name: "ContentView.swift", type: .file, subRecords: nil),
                                    Record(name: "ConetentViewModel.swift", type: .file, subRecords: nil)
                                ]),
                            Record(
                                name: "OtherView",
                                type: .folder,
                                subRecords: [
                                    Record(name: "OtherView.swift", type: .file, subRecords: nil),
                                    Record(name: "OtherViewModel.swift", type: .file, subRecords: nil)
                                ]),
                        ]),
                    Record(
                        name: "Models",
                        type: .folder,
                        subRecords: [
                            Record(name: "User.swift", type: .file, subRecords: nil),
                            Record(name: "DataModel.swift", type: .file, subRecords: nil),
                        ])
                    
                ])
        ]
    }
    
    static var packages: [Record]{
        [
            Record(name: "ElegantAPI", type: .package, subRecords: [
                Record(name: "Sources", type: .folder, subRecords: nil)
            ]),
            Record(name: "GradientGraphView", type: .package, subRecords: [
                Record(name: "Sources", type: .folder, subRecords: nil)
            ])
        ]
    }
}
