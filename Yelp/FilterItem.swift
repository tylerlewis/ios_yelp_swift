//
//  FilterOption.swift
//  Yelp
//
//  Created by Tyler Hackley Lewis on 4/10/17.
//  Copyright © 2017 Timothy Lee. All rights reserved.
//

import Foundation

class FilterItem: NSObject {
    var text: String?
    var isOn: Bool?
    var value: Any?
    
    init(text: String, isOn: Bool, value: Any) {
        self.text = text
        self.isOn = isOn
        self.value = value
    }
}
