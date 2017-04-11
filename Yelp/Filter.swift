//
//  Filter.swift
//  Yelp
//
//  Created by Tyler Hackley Lewis on 4/10/17.
//  Copyright © 2017 Timothy Lee. All rights reserved.
//

import Foundation

class Filter: NSObject {
    let header: String?
    let options: [FilterItem]!
    var displayOption: FilterItem!
    var isDisplayingOptions: Bool?
    
    init(header: String?, options: [FilterItem], displayOption: FilterItem, isDisplayingOptions: Bool?) {
        self.header = header
        self.options = options
        self.displayOption = displayOption
        self.isDisplayingOptions = isDisplayingOptions ?? false
    }
}
