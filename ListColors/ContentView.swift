//  ContentView.swift
//  ListColors
//  Created by Nanu Jogi on 13/07/19.
//  Copyright © 2019 Greenleaf Software. All rights reserved.

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObjectBinding var store: RData
    //    @Binding var strnames: String
    
    @State var searchText: String = ""
    
    var dismissButtonTitle = "Cancel"
    var dismissButtonCallback: (() -> Void)?
    
    var body: some View {
        Group {
            NavigationView {
                VStack {
                    // SearchField()
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .padding(.leading)
                        TextField("Search ....", text: $searchText )
                            .textFieldStyle(.roundedBorder)
                            .padding(.leading)
                            .padding(.trailing)
                        
                        if !searchText.isEmpty {
                            Button(action: {
                                self.searchText = ""
                                self.dismissButtonCallback?()
                            }, label: {
                                Text("Cancel").color(.gray)
                            }).animation(.basic())
                        }
                        
                    }.padding(4) // end of HStack
                    
                    List {
                        ForEach(store.searchName) { data in
                            Text(data.name)
                                .listRowBackground(Color.pink)
                        }
                    }
                } // end of VStack
                    .navigationBarTitle(Text("Restaurants"))
                    .navigationBarItems(trailing: Button(action: searchName, label: { Text("Search") }))
                
            } // end of NavigationView
            
        }  // end of group
            .onAppear(perform: {
//                self.searchName()})
                
//                self.store.FilterWords(words: "\(self.$searchText)") })
                self.store.getData() })
    }
    
    func searchName() {
        let strnames = $searchText
        print(strnames.value)
        store.FilterWords(words: "\(strnames.value)")

    }
}
