//
//  Level6Class.swift
//  The Neuron Education Project
//
//  Created by Galen O'Shea on 2018-02-01.
//  Copyright © 2018 SOIL. All rights reserved.
//

import Foundation

class Level6: LevelScene {
    
    private let dendrite1 = Dendrite(synapseName: "Node101", pathOrder: [101,11,12], transType: ExcitTransmitter.self, decay: 0, delay: 1, numShots: 100, auto: true)
    private let dendrite2 = Dendrite(synapseName: "Node102", pathOrder: [102,13,11,12], transType: InhibitTransmitter.self, decay: 0, delay: 1.5, numShots: 100, auto: false)
    
    private let dendrite3 = Dendrite(synapseName: "Node103", pathOrder: [103,13,11,12], transType: InhibitTransmitter.self, decay: 0, delay: 1.5, numShots: 100, auto: false)
    private let dendrite4 = Dendrite(synapseName: "Node104", pathOrder: [104,12], transType: ExcitTransmitter.self, decay: 0, delay: 2, numShots: 100, auto: true)
    
    private let instructions = "Objective: Avoid creating an action potential! You'll notice Excititory graded potentials are firing automatically! Hold them off by using Inhibitory graded potentials to win!"
    
    override var instructionsText: String {
        get { return instructions }
        set {}
    }
    
    override var dendrites: [Dendrite] {
        get { return [dendrite1, dendrite2, dendrite3, dendrite4] }
        set {}
    }
    
    override var levelName: String {
        get { return "Level 6" }
        set {}
    }
    
    override var resetTime: TimeInterval {
        get { return 5 }
        set {}
    }
    
    override func update(_ currentTime: TimeInterval) {
        if(nb.activateTimer == false){
            nb.activateTimer = true
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(45000), execute: {
                if(!self.nb.lost){
                    self.nb.addPopUpWin()
                }
            })
        }
        
        startAutoFire()
        
        if (nb.getVoltage() >= -55 && !nb.lost && !nb.won){
            nb.addPopUpLoss()
        }
    }
}
