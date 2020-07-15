//
//  OutlineVCWrapper.swift
//  Expanding hierarchy (iOS)
//
//  Created by dominator on 16/07/20.
//

import SwiftUI

struct OutlineVCWrapper: UIViewControllerRepresentable{
    func makeUIViewController(context: Context) -> OutlineViewController {
        OutlineViewController()
    }
    
    func updateUIViewController(_ uiViewController: OutlineViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = OutlineViewController
    
    
}
