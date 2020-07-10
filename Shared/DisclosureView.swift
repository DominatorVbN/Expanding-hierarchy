//
//  DisclosureView.swift
//  Expanding hierarchy
//
//  Created by dominator on 11/07/20.
//

import SwiftUI

struct DisclosureView: View {
    
    @State var color: Color = .red
    @State var isExpanded = true
    @State var array: [Int] = Array(0..<5)

    var body: some View {
        ScrollView {
            VStack{
                
                GroupBox{
                    Toggle("Is expanded", isOn: $isExpanded)
                        .toggleStyle(SwitchToggleStyle(tint: color))
                }
                
                GroupBox{
                    DisclosureGroup("State based", isExpanded: $isExpanded) {
                        VStack(spacing: 20){
                            ForEach(array, id: \.self){ index in
                                HStack {
                                    Text("Dynamic content number \(index)")
                                        .font(.body)
                                        .foregroundColor(.secondary)
                                    Spacer()
                                }
                            }
                            Button("Add more") {
                                self.array = Array(0..<array.last! + 5)
                            }
                        }
                        .padding(.top)
                    }
                }
                
                GroupBox{
                    DisclosureGroup("Color picker") {
                        GroupBox {
                            ColorPicker("Select color", selection: $color)
                                .font(.body)
                        }
                        .padding(.vertical)
                    }
                }

                GroupBox{
                    DisclosureGroup("Nested Group") {
                        DisclosureGroup("Inner Group") {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(color)
                                .frame(height: 50)
                        }
                    }
                }
                
                Spacer()
                
            }
            .padding()
            .accentColor(color)
            .animation(.default)
        }
        .navigationTitle("Disclosure Groups")
        .frame(minWidth: 200, idealWidth: 300, maxWidth: .infinity, minHeight: 300, idealHeight: 400, maxHeight: .infinity, alignment: .center)
    }
    
}

struct DisclosureView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DisclosureView()
                .preferredColorScheme(.dark)
        }
    }
}
