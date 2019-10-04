//
//  Cache.swift
//  Astronomy
//
//  Created by Ciara Beitel on 10/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class Cache<Key: Hashable, Value> {
    private var cacheDictionary: [Key : Value] = [:]
    
    private var queue = DispatchQueue(label: "Queue")
    
    func cache(value: Value, for key: Key) {
        queue.async {
            self.cacheDictionary.updateValue(value, forKey: key)
        }
    }
    
    func value(for key: Key) -> Value? {
        queue.sync {
            return cacheDictionary[key]
        }
    }
}
