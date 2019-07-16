//  ContentView.swift
//  ListColors
//  Created by Nanu Jogi on 13/07/19.
//  Copyright © 2019 Greenleaf Software. All rights reserved.

import SwiftUI
import Combine

struct ContentView: View {
    
    @ObjectBinding var store: RData
//    @Binding var strnames: String
    
    var body: some View {
         Group {
            NavigationView {
                VStack {
                    SearchField()
                    
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
//                self.store.FilterWords(words: "joe") })
                self.store.getData() })
    }
    
    func searchName() {
        // strnames = SearchField().searchText
//        print(SearchField().$searchText)
//        print(store.FilterWords(words: SearchField().searchText))
        print("srcText")
    }
}
