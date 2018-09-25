//
//  Transmitter.swift
//  The Neuron Education Project
//
//  Created by Galen O'Shea on 2017-11-01.
//  Copyright © 2017 SOIL. All rights reserved.
//

import Foundation
import SpriteKit

class ExcitTransmitter : Transmitter {

    //Mark: private vars
    private let excitColour: UIColor = .blue
    private let excitMultiplier: Double = 1.0
    
    //Mark: initializer
    init(dendrite: Dendrite){
        super.init(colour: excitColour, multiplier: excitMultiplier, dendrite: dendrite)
        self.physicsBody!.categoryBitMask = CollisionCategory.excitTrans
        self.physicsBody!.contactTestBitMask = CollisionCategory.excitTrans | CollisionCategory.inhibitTrans 
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
