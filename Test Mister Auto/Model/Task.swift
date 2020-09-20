//
//  Task.swift
//  Test Mister Auto
//
//  Created by Mohammed Hajajate on 9/20/20.
//  Copyright © 2020 Mohammed Hajajate. All rights reserved.
//

import Foundation

struct Task: Codable {
    let userId: Int?
    let id: Int?
    let title: String?
    var completed: Bool = false
}
