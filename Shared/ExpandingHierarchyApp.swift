//
//  Expanding_hierarchyApp.swift
//  Shared
//
//  Created by dominator on 11/07/20.
//

import SwiftUI

@main
struct ExpandingHierarchyApp: App {
    
    @StateObject var theme: AppTheme = AppTheme(color: .red)
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .accentColor(theme.accentColor)
                .environmentObject(theme)
        }
    }
}


class AppTheme: ObservableObject {
    
    @Published var accentColor: Color
    
    init(color: Color) {
        self.accentColor = color
    }
}
