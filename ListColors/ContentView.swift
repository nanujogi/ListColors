//  ContentView.swift
//  ListColors
//  Created by Nanu Jogi on 13/07/19.
//  Copyright © 2019 Greenleaf Software. All rights reserved.

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObjectBinding var store: RData
    @State var searchText: String = ""
    
    var body: some View {
        Group {
            NavigationView {
                VStack(alignment: .leading) {
                    SearchField(searchText: $searchText)
                    ScrollView(.horizontal, showsIndicators: false ) {
                        HStack {
                            ForEach(store.searchName) { data in
                                Text(data.name)
                                    .listRowBackground(Color.pink)
                            }
                        }
                    }
                } // end of VStack
                    .navigationBarTitle(Text("Restaurants"))
                    .navigationBarItems(trailing: Button(action: searchName, label: { Text("Search") }))
                
            } // end of NavigationView
        }  // end of group
            .onAppear(perform: {
                self.store.getData() })
    }
    
    func searchName() {
        let strnames = SearchField(searchText: $searchText)
        store.FilterWords(words: "\(strnames.searchText)")
        
    }
}
