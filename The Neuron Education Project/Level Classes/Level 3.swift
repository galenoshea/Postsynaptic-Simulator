//
//  GameplayLevel3Class.swift
//  The Neuron Education Project
//
//  Created by Galen O'Shea on 2018-01-31.
//  Copyright © 2018 SOIL. All rights reserved.
//

import Foundation

class Level3:LevelScene {
    private let dendrite1 = Dendrite(synapseName: "Node101", pathOrder: [101,17,14], transType: ExcitTransmitter.self, decay: 0, delay: 2, numShots: 100, auto: false)
    private let dendrite2 = Dendrite(synapseName: "Node102", pathOrder: [102,12,11], transType: ExcitTransmitter.self, decay: 0, delay: 2, numShots: 100, auto: false)
    private let dendrite3 = Dendrite(synapseName: "Node103", pathOrder: [103,13,15,16], transType: ExcitTransmitter.self, decay: 0, delay: 2, numShots: 100, auto: false)
    
    private let instructions = "Objective: Get the Cell Body to reach an action potential! The threshold is at -55mV... You'll have to use your knowledge of spatial summations!"
    
    override var instructionsText: String {
        get { return instructions }
        set {}
    }
    
    override var dendrites: [Dendrite] {
        get { return [dendrite1, dendrite2, dendrite3] }
        set {}
    }
    
    override var levelName: String {
        get { return "Level 3" }
        set {}
    }
    
    override var resetTime: TimeInterval {
        get { return 2 }
        set {}
    }

}
