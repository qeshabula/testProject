//
//  Animal.swift
//  UIKitBasics
//
//  Created by Bula on 6/7/22.
//

import Foundation

class Animal {
    
    var type: StringLiteralType
    var color: String
    var weight: Int
    var name: String
    var cage: Cage
    
    init(type: String, color: String, weight: Int, name: String, cage: Cage) {
        
        self.type = type
        self.color = color
        self.weight = weight
        self.name = name
        self.cage = cage
    }
    
    func eat() {
        print("\(name) eats")
    }
    
    func show() {
        print("\(name) sits in \(cage.type)")
    }
    
}
