//
//  DataManager.swift
//  Exchange
//
//  Created by Dima Biliy on 20.07.2020.
//  Copyright © 2020 ew. All rights reserved.
//

import Foundation

protocol DataManager {
    func obtainNumbers() -> [[Int]]
    func randomPersent() -> (Int,Bool)
}

class DataManagerImplementation: DataManager{
    func obtainNumbers() -> [[Int]] {
        var mockViewsPoints = [[Int()]]
        for _ in 0...50{
            var allPoints = [Int()]
            for _ in 0...6{
                let int = Int.random(in: 3..<9)
                allPoints.append(int)
            }
            mockViewsPoints.append(allPoints)
        }
        mockViewsPoints.removeFirst()
        return mockViewsPoints
    }
    
    func randomPersent() -> (Int,Bool){
        let int = Int.random(in: 3..<93)
        let boole = Bool.random()
        return (int,boole)
    }
}
