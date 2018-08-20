//
//  ExpandableNames.swift
//  Connect
//
//  Created by Abdoulaye Diallo on 11/26/17.
//  Copyright © 2017 224apps. All rights reserved.
//

import Foundation

struct ExpandableNames {
    var  isExpanded: Bool
    var names: [Contact]
}

struct Contact {
    let name: String
    var hasFavorited: Bool
}
