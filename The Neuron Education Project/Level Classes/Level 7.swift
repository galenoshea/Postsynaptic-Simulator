//
//  Level7Class.swift
//  The Neuron Education Project
//
//  Created by Galen O'Shea on 2018-02-01.
//  Copyright © 2018 SOIL. All rights reserved.
//

import Foundation

class Level7: LevelScene {
    private let dendrite1 = Dendrite(synapseName: "Node101", pathOrder: [101,107,111], transType: ExcitTransmitter.self, decay: 5, delay: 1, numShots: 100, auto: false)
    private let dendrite2 = Dendrite(synapseName: "Node102", pathOrder: [102,108,104,106,109,105,111], transType: ExcitTransmitter.self, decay: 9, delay: 1, numShots: 100, auto: false)
    private let dendrite3 = Dendrite(synapseName: "Node103", pathOrder: [103,110,109,105,111], transType: ExcitTransmitter.self, decay: 7, delay: 1, numShots: 100, auto: false)
    
    private let instructions = "Objective: Get the Cell Body to reach an action potential! The threshold is at -55mV... You'll notice your graded potentials decay as they propogate down the dendrite... Use your knowledge of spatial summation and synaptic coiciedence potentiation to get them to the cell body!"
    
    override var instructionsText: String {
        get { return instructions }
        set {}
    }
    
    override var dendrites: [Dendrite] {
        get { return [dendrite1, dendrite2, dendrite3] }
        set {}
    }
    
    override var levelName: String {
        get { return "Level 7" }
        set {}
    }
    
    override var resetTime: TimeInterval {
        get { return 0 }
        set {}
    }

}

