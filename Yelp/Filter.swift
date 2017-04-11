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
    let optionDisplayIndex: Int?
    var isDisplayingOptions: Bool?
    
    init(header: String?, options: [FilterItem], optionDisplayIndex: Int, isDisplayingOptions: Bool?) {
        self.header = header
        self.options = options
        self.optionDisplayIndex = optionDisplayIndex
        self.isDisplayingOptions = isDisplayingOptions ?? false
    }
}
