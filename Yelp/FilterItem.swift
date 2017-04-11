//
//  FilterOption.swift
//  Yelp
//
//  Created by Tyler Hackley Lewis on 4/10/17.
//  Copyright © 2017 Timothy Lee. All rights reserved.
//

import Foundation

class FilterItem: NSObject {
    let text: String?
    let isOn: Bool?
    
    init(text: String, isOn: Bool) {
        self.text = text
        self.isOn = isOn
    }
}
