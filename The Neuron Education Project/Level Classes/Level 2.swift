//
//  GameplayLevel2Class.swift
//  The Neuron Education Project
//
//  Created by Galen O'Shea on 2017-10-23.
//  Copyright © 2017 SOIL. All rights reserved.
//
import Foundation

class Level2: LevelScene {
    private let dendrite1 = Dendrite(synapseName: "Node100", pathOrder: [100,1,2,3,4,5,6,7,8], transType: ExcitTransmitter.self, decay: 0, delay: 0.75, numShots: 1000, auto: false)
    
    private let instructions = "Objective: Just like Level 1, get the Cell Body to reach an action potential by getting to a threshold of -55mV. You'll notice the Cell Body will try to reach back to an equilibrium... This is known as Regenative Action Potentials. Hint: Try to maximize the Temproal Summation!"
    
    override var instructionsText: String {
        get { return instructions }
        set {}
    }
    
    override var dendrites: [Dendrite] {
        get { return [dendrite1] }
        set {}
    }
    
    override var levelName: String {
        get { return "Level 2" }
        set {}
    }
    
    override var resetTime: TimeInterval {
        get { return 3 }
        set {}
    }
}

