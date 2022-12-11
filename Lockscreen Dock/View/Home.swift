//
//  Home.swift
//  Lockscreen Dock
//
//  Created by Sam Prince K on 11/12/22.
//

import SwiftUI
import ActivityKit
import WidgetKit

struct Home: View {
    
    @State var addedShortcuts: [Applink] = []
    @State var availableAppLinks: [Applink] = []
    var body: some View {
        List {
            Section{
                HStack(spacing: 0){
                    ForEach(addedShortcuts) { link in
                        Image(link.name)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:60, height: 60)
                            .frame(maxWidth: .infinity)
                            .onTapGesture {
                                withAnimation(.easeOut){
                                    addedShortcuts.removeAll(where: {$0 == link})
                                }
                            }
                        
                        
                    }
                    .frame(height: 85)
                }
            } header: {
                Text("Preview")
            }
            .listRowInsets(.init(top:0,leading:0,bottom:0,trailing:0))
            
            Section {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15){
                        ForEach(availableAppLinks.filter({!addedShortcuts.contains($0)})){link in
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
                .disabled(addedShortcuts.count >= 4)
                .opacity(addedShortcuts.count >= 4 ? 0.6 : 1)
            } header: {
                Text("Tap to add Shortcut")
            }
            .listRowInsets(.init(top:0,leading:0,bottom:0,trailing:0))
            
            Button (action: addDockLockScreen){
                HStack{
                    Text("Add Lockscreen Dock")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Image(systemName: "dock.rectangle")
                }
            }
            .disabled(addedShortcuts.count < 2)
            .opacity(addedShortcuts.count < 2 ? 0.6 : 1)
        }
        .onAppear{
            for link in appLinks{
                if let url = URL(string: link.deepLink){
                    if UIApplication.shared.canOpenURL(url){
                        
                        var updatedLink = link
                        updatedLink.appURL = url
                        availableAppLinks.append(updatedLink)
                    }
                }
            }
        }
    }
    func addDockLockScreen(){
        let activityAttribute = DockAttributes(name: "LockScreen Dock", addedLinks: addedShortcuts)
        
        let initialContentState = DockAttributes.ContentState()
        do{
            let activity = try Activity<DockAttributes>.request(attributes: activityAttribute, contentState: initialContentState)
            print("Activity Added \(activity.id)")
        }catch{
            print(error.localizedDescription)
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
