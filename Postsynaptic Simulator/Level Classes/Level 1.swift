//
//  GameplayLevel1Class.swift
//  The Neuron Education Project
//
//  Created by Galen O'Shea on 2018-01-31.
//  Copyright © 2018 SOIL. All rights reserved.
//
import Foundation




class Level1: LevelScene{
    private let dendrite1 = Dendrite(synapseName: "Node100", pathOrder: [100,1,2], transType: ExcitTransmitter.self, decay: 0, delay: 1, numShots: 100, auto: false)
    
    private let instructions = "Objective: Get the Cell Body to reach an action potential by clicking on the excititory synapse! The threshold to achieve an action potential is at -55mV..."
    
    
    override var instructionsText: String {
        get { return instructions }
        set {}
    }
    
    override var dendrites: [Dendrite] {
        get { return [dendrite1] }
        set {}
    }
    
    override var levelName: String {
        get { return "Level 1" }
        set {}
    }
    
    override var resetTime: TimeInterval {
        get { return 0 }
        set {}
    }
    
    
    /*  -When Making a new level class make sure to inherit from Level as seen on line 9.
        -Copy both overrides as they will overwrite the dendrite paths and the level instructions
        -All you need to do is create a new dendrite and make sure you add it to the dendrite array as seen on line 20
        -if you want to specify new ways to win you can override the update function that is found in the Level class. An example of this is found in Level 8 code
     */
}
