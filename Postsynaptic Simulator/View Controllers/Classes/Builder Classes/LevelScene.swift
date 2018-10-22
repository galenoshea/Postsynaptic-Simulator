//
//  LevelProtocol.swift
//  The Neuron Education Project
//
//  Created by Galen O'Shea on 2018-04-07.
//  Copyright © 2018 SOIL. All rights reserved.
//

import Foundation
import SpriteKit

class LevelScene: SKScene, SKPhysicsContactDelegate {
    
    internal let nb = NeuronBuilder()
    internal var dendrites = [Dendrite]()
    internal var instructionsText = "Override this string"
    internal var levelName = "Level Name"
    internal var resetTime : TimeInterval = 0
    var levelVC: UIViewController?
    internal var instructionsClosed = false
    internal var autoFireStarted = false
    
     //Mark: set nb
    internal func setLevel(name: String, resetTime: TimeInterval){
        nb.setSceneName(name)
        nb.setResetTime(resetTime)
        nb.setDendrites(self.dendrites)
    }
    
    //Mark: begins contact handler
    internal func didBegin(_ contact: SKPhysicsContact) {
        nb.contactHandler(contact)
    }
    
     //Mark: moves objects to view
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        setLevel(name: self.levelName, resetTime: self.resetTime)
        nb.setScene(scene: self)
        nb.initDendrites()
        nb.setInstructions(self.instructionsText)
    }
    
     //Mark: updates
    internal override func update(_ currentTime: TimeInterval) {
        startAutoFire()
        nb.checkIfWon()
        nb.checkNumShotsLeft()
    }
    
    internal func startAutoFire(){
        if(self.instructionsClosed == true && self.autoFireStarted == false){
            autoFireStarted = true
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(5000), execute: {
                self.nb.autoFire()
            })
        }
    }
    
     //Mark: handles touches
    internal override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if (atPoint(location).name == "ContinueLabel" || atPoint(location).name == "Continue" ) {
                nb.hideInstructions()
                self.instructionsClosed = true
            }
            
            if(atPoint(location).name != nil){
                nb.touchSynapse((atPoint(location).name)!)
            }
            
        }
    }
}
