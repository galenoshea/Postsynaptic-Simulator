//
//  Level5Class.swift
//  The Neuron Education Project
//
//  Created by Galen O'Shea on 2018-02-01.
//  Copyright © 2018 SOIL. All rights reserved.
//

import Foundation

class Level5:LevelScene {
    private let dendrite1 = Dendrite(synapseName: "Node101", pathOrder: [101,11,12], transType: ExcitTransmitter.self, decay: 0, delay: 3, numShots: 10, auto: false)
    private let dendrite2 = Dendrite(synapseName: "Node102", pathOrder: [102,12], transType: ExcitTransmitter.self, decay: 0, delay: 1, numShots: 10, auto: false)
    
    private let instructions = "Objective: Get the Cell Body to reach an action potential! The threshold is at -55mV... Be careful, you only get 10 shots with each synapse so you'll have to use your knowledge of the spatial summations and synaptic coiciedence potentiation!"
    
    override var instructionsText: String {
        get { return instructions }
        set {}
    }
    
    override var dendrites: [Dendrite] {
        get { return [dendrite1, dendrite2] }
        set {}
    }
    
    override var levelName: String {
        get { return "Level 5" }
        set {}
    }
    
    override var resetTime: TimeInterval {
        get { return 5 }
        set {}
    }
}

