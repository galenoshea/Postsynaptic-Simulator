//
//  Level4Class.swift
//  The Neuron Education Project
//
//  Created by Galen O'Shea on 2018-02-01.
//  Copyright © 2018 SOIL. All rights reserved.
//

import Foundation

class Level4:LevelScene {
    private let dendrite1 = Dendrite(synapseName: "Node101", pathOrder: [101,11,12,14,15], transType: ExcitTransmitter.self, decay: 0, delay: 0.7, numShots: 150, auto: false)
    private let dendrite2 = Dendrite(synapseName: "Node102", pathOrder: [102,13,14,15], transType: InhibitTransmitter.self, decay: 0, delay: 2, numShots: 100, auto: true)
    
    private let instructions = "Objective: Get the Cell Body to reach an action potential! The threshold is at -55mV... You'll notice there are now Inhibitory graded potentials as well!"
    
    override var instructionsText: String {
        get { return instructions }
        set {}
    }
    
    override var dendrites: [Dendrite] {
        get { return [dendrite1, dendrite2] }
        set {}
    }
    
    override var levelName: String {
        get { return "Level 4" }
        set {}
    }
    
    override var resetTime: TimeInterval {
        get { return 5 }
        set {}
    }

}

