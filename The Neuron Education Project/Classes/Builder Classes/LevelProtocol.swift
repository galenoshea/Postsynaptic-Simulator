//
//  LevelProtocol.swift
//  Postsynaptic Simulator
//
//  Created by Galen O'Shea on 2018-09-10.
//  Copyright © 2018 SOIL. All rights reserved.
//

import Foundation

protocol LevelProtocol {
    var levelName: String { get }
    var instructionsText: String { get }
    var resetTime:  TimeInterval { get }
    var dendrites: [Dendrite] { get }
}
