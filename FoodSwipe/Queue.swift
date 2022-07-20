//
//  Queue.swift
//  FoodSwipe
//
//  Created by Daniel Basman on 6/14/22.
//  Copyright © 2022 MakeSchool. All rights reserved.
//

import Foundation
struct Queue{
    
    var items:[foodObj] = []
    
    mutating func enqueue(element: foodObj)
    {
        items.append(element)
        size()
    }
    
    mutating func dequeue() -> foodObj?
    {
        
        if items.isEmpty {
            return nil
        }
        else{
            let tempElement = items.first
            items.remove(at: 0)
            size()
            return tempElement
        }
    }
    
    mutating func first() -> foodObj?
    {
        
        if items.isEmpty {
            return nil
        }
        else{
            let tempElement = items.first
            return tempElement
        }
    }
    
    mutating func index(index: Int) -> foodObj {
        return items[index]
        
    }
    
    mutating func size() -> Int {
        return items.count
    }
    
}
