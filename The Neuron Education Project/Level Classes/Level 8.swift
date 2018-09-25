//
//  Level8Class.swift
//  The Neuron Education Project
//
//  Created by Galen O'Shea on 2018-02-01.
//  Copyright © 2018 SOIL. All rights reserved.
//

import Foundation

import Foundation

class Level8: LevelScene {
    private let dendrite1 = Dendrite(synapseName: "Node101", pathOrder: [101,16,15,14,13], transType: ExcitTransmitter.self, decay: 15, delay: 1, numShots: 100, auto: false)
    private let dendrite2 = Dendrite(synapseName: "Node102", pathOrder: [102,14,13], transType: ExcitTransmitter.self, decay: 19, delay: 1, numShots: 100, auto: false)
    private let dendrite3 = Dendrite(synapseName: "Node103", pathOrder: [103,16,15,14,13], transType: ExcitTransmitter.self, decay: 0, delay: 0, numShots: 100, auto: false)
    private let dendrite4 = Dendrite(synapseName: "Node104", pathOrder: [104,15,14,13], transType: ExcitTransmitter.self, decay: 17, delay: 1, numShots: 100, auto: false)
    private let dendrite5 = Dendrite(synapseName: "Node105", pathOrder:  [105,13], transType: InhibitTransmitter.self, decay: 5, delay: 4, numShots: 100, auto: true)
    private let dendrite6 = Dendrite(synapseName: "Node106", pathOrder: [106,14,13], transType: ExcitTransmitter.self, decay: 20, delay: 1, numShots: 100, auto: false)
    private let dendrite7 = Dendrite(synapseName: "Node107", pathOrder: [107,13], transType: ExcitTransmitter.self, decay: 20, delay: 1, numShots: 100, auto: false)
    
    private let instructions = "Objective: Get the Cell Body to reach an action potential! The threshold is at -55mV... This time try to create a stronger action potential by surpassing the threshold greatly! The Stength is defined by the frequency of the charge propogating through the Axon Hillock"
    
    override var instructionsText: String {
        get { return instructions }
        set {}
    }
    
    override var dendrites: [Dendrite] {
        get { return [dendrite1, dendrite2, dendrite3, dendrite4,dendrite5,dendrite6,dendrite7] }
        set {}
    }
    
    override var levelName: String {
        get { return "Level 8" }
        set {}
    }
    
    override var resetTime: TimeInterval {
        get { return 5 }
        set {}
    }
    
    override func update(_ currentTime: TimeInterval) {
        startAutoFire()
        if (nb.getVoltage() >= nb.getThreshold() && !nb.won && !nb.lost){
            if(nb.getVoltage() >= -50){
                nb.addPopUpWin()
            }
            else{
                nb.addPopUpLoss()
            }
        }
    }
}

 
