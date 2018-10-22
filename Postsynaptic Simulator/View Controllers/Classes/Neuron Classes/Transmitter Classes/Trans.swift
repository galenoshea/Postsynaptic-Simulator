//
//  Trans.swift
//  The Neuron Education Project
//
//  Created by Galen O'Shea on 2017-11-16.
//  Copyright © 2017 SOIL. All rights reserved.
//

import Foundation
import SpriteKit

protocol Trans {
    var path: CGMutablePath { get set}
    var decayDuration: TimeInterval { get set}
    var defaultZPosition: CGFloat { get set}
    var defaultScale: CGFloat { get set}
    var defaultSize:CGSize { get set}
    var charge: Double { get set}
    var colour: UIColor { get set}
    
}


