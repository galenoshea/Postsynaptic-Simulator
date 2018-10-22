//
//  CollisionCategory.swift
//  The Neuron Education Project
//
//  Created by Galen O'Shea on 2017-11-09.
//  Copyright © 2017 SOIL. All rights reserved.
//

import Foundation

class CollisionCategory {
    
    //Mark: collision categories
    internal static let none: UInt32 = 0
    internal static let excitTrans: UInt32 = 0b1
    internal static let inhibitTrans: UInt32 = 0b1 << 1
    internal static let cellBody: UInt32 = 0b1 << 2
    
    private enum CollisionDetection {
        case none
        case excitTrans
        case inhibitTrans
        case cellBody
    }
    
    private var collisionDetections =
    [ 0: CollisionDetection.none,
      0b1: CollisionDetection.excitTrans,
      0b1<<1: CollisionDetection.inhibitTrans,
      0b1<<2: CollisionDetection.cellBody,
    ]
}
