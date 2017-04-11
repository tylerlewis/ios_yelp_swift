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
    var displayedOptions: [FilterItem]!
    var isDisplayingOptions: Bool?
    var persistList: Bool?
    
    init(header: String?, options: [FilterItem], displayedOptions: [FilterItem], isDisplayingOptions: Bool?, persistList: Bool?) {
        self.header = header
        self.options = options
        self.displayedOptions = displayedOptions
        self.isDisplayingOptions = isDisplayingOptions ?? false
        self.persistList = persistList ?? false
    }
}
