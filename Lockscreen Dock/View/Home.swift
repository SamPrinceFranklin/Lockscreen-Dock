//
//  Home.swift
//  Lockscreen Dock
//
//  Created by Sam Prince K on 11/12/22.
//

import SwiftUI

struct Home: View {
    
    @State var addedShortcuts: [Applink] = []
    var body: some View {
        List {
            Section{
                
            } header: {
                Text("Preview")
            }
            .listRowInsets(.init(top:0,leading:0,bottom:0,trailing:0))
            
            Section {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15){
                        ForEach(appLinks.filter({!addedShortcuts.contains($0)})){link in
                            VStack(spacing: 8){
                                Image(link.name)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width:60, height: 60)
                                
                                Text(link.name)
                                    .font(.caption2)
                                    .foregroundColor(.gray)
                            }
                            .contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation(.easeOut){
                                    addedShortcuts.append(link)
                                }
                            }
                            
                        }
                    }
                    .frame(height:100)
                    .padding(.horizontal,10)
                }
            } header: {
                Text("Tap to add Shortcut")
            }
            .listRowInsets(.init(top:0,leading:0,bottom:0,trailing:0))
            
            Button {
                
            } label: {
                HStack{
                    Text("Add Lockscreen Dock")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Image(systemName: "dock.rectangle")
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
