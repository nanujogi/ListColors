//
//  SearchField.swift
//  ListColors
//
//  Created by Nanu Jogi on 16/07/19.
//  Copyright © 2019 Greenleaf Software. All rights reserved.
//

import SwiftUI
import Combine

struct SearchField : View {
    
    @Binding var searchText: String

    var dismissButtonTitle = "Cancel"
    var dismissButtonCallback: (() -> Void)?
    
    var body: some View {
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
                    Text("Cancel").foregroundColor(.gray)
                }).animation(.default)
            } 
            
        }.padding(4) // end of HStack
    }
}

