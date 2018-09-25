//
//  InhibitoryTransmitter.swift
//  The Neuron Education Project
//
//  Created by Galen O'Shea on 2017-11-05.
//  Copyright © 2017 SOIL. All rights reserved.
//

import Foundation
import SpriteKit

class InhibitTransmitter : Transmitter {
    
    //Mark: private vars
    private let inhibitColour: UIColor = .red
    private let inhibitMultiplier: Double = -1.0
    
    //Mark: initializer
    init(dendrite: Dendrite){
        super.init(colour: inhibitColour, multiplier: inhibitMultiplier, dendrite: dendrite)
        self.physicsBody!.categoryBitMask = CollisionCategory.inhibitTrans
        self.physicsBody!.contactTestBitMask = CollisionCategory.excitTrans | CollisionCategory.inhibitTrans
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
