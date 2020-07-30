//
//  DataModel.swift
//  Exchange
//
//  Created by Dima Biliy on 25.07.2020.
//  Copyright © 2020 ew. All rights reserved.
//

import Foundation

struct DataModel: Decodable {
    let rates: [String: Double]
    let base, date: String
}
