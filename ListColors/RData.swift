//
//  RData.swift
//  ListColors
//
//  Created by Nanu Jogi on 16/07/19.
//  Copyright © 2019 Greenleaf Software. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import Combine

class RData: BindableObject {
    
    var didChange = PassthroughSubject<Void, Never>()
    
    var models:[Restaurant] = []
    
    var searchName = [Restaurant]()  {
        didSet {
            DispatchQueue.main.async {
                self.didChange.send() // this send() call will send values to subscribers.
            }
        }
    }
    func getData() {
        
        let first = Restaurant(name: "Joe's Original")
        let second = Restaurant(name: "The Real Joe's Original")
        let third = Restaurant(name: "Original Joe's")
        let fourth = Restaurant(name: "NJ")
        
        self.models.append(first)
        self.models.append(second)
        self.models.append(third)
        self.models.append(fourth)
        
        searchName = models
//        FilterWords(words: "")
    }
    
    func FilterWords(words: String)  {
        print("Words is \(words)")
        if words == "" {
            searchName = models
        } else {
            searchName = models.filter({ (value) -> Bool in
                value.name.range(of: words, options: .caseInsensitive) != nil
            })
            
            
//            searchName = models.isEmpty ? models : models.filter({ (value) -> Bool in
//                value.name.range(of: words, options: .caseInsensitive) != nil
//            })
            print(searchName)
        }
    }
    
}
