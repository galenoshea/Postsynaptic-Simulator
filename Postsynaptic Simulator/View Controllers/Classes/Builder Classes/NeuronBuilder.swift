//
//  NeuronBuilder.swift
//  The Neuron Education Project
//
//  Created by Galen O'Shea on 2017-10-12.
//  Copyright © 2017 SOIL. All rights reserved.
//

import Foundation
import SpriteKit

class NeuronBuilder {

    //Mark: variables of the NeuronBuilder class
    
    private let background = SKSpriteNode(imageNamed: "neuronsbackground") //www.freepik.com/free-photo/neurons-bright-background_886448.htm#term=neuron&page=1&position=2
    
    private var scene = SKScene()
    
    private var resetTimer = Timer()
    private var firingTimer = Timer()
    
    private var dendrites = [Dendrite]()
    private lazy var cellBody = CellBody(scene: scene)
    private let threshold: Double = -55
    
    private var thresholdReached = false
    private var hidden = true
    
    internal var won = false
    internal var lost = false
    
    internal var activateTimer = false
    private var actionPotentialEmitter = SKEmitterNode(fileNamed: "MySpark.sks")
    private var sceneName : String = "Level"
    private var resetTime: TimeInterval = 0
    private let drawPaths = true
    internal lazy var instructions = InstructionsPopUp(scene: self.scene, text: "OVERWRITE THIS")
    
    
//----------------------------------- Getters -----------------------------------------
    
    internal func getVoltage()-> Double{
        return self.cellBody.getVoltage()
    }
    
    internal func getThreshold()-> Double{
        return self.threshold
    }
    
    internal func getDendrites()-> [Dendrite]{
        return self.dendrites
    }
    
    //Mark: get Nodes from scene
    private func getNodes()-> [SKNode]{
        var nodes = [SKNode]()
        for child in self.scene.children {
            if((child.name)?.contains("Node"))!{
                nodes.append(child)
            }
        }
        return nodes
    }
    

//----------------------------------- Setters -----------------------------------------
    
    func setSceneName(_ s: String){
        self.sceneName = s
    }
    
    func setResetTime(_ t: TimeInterval){
        self.resetTime = t
    }
    
    internal func setDendrites(_ d: [Dendrite]){
        self.dendrites = d
    }
    
    internal func setInstructions(_ t: String){
        self.instructions.setInstructionsText(t)
    }
    
    //Mark: sets the scene
    internal func setScene(scene: SKScene){
        self.scene = scene
        self.addBackground()
        self.scene.addChild(self.instructions)
        self.scene.addChild(self.cellBody)
        self.resetVoltageTimer(time: self.resetTime)
    }

//-------------------------------------------------------------------------------------
    
    //Mark: check number of shots left
    internal func checkNumShotsLeft(){
        var count = 0
        
        for d in dendrites{
            if(d.getNumShots() > 0){
                count += 1
            }
        }
        
        if(count == 0){
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(5000), execute: {
                if(!self.won){
                    self.addPopUpLoss()
                }
            })
        }
    }
        
    //Mark: adds background to scene
    private func addBackground(){
        self.background.setScale(3.1)
        self.background.zPosition = -10
        self.background.position = CGPoint(x: 0,y: 0)
        self.background.name = "Background"
        self.scene.addChild(background)
    }
    
    //Mark: check if passed threshold
    internal func checkIfWon(){
        if (self.cellBody.getVoltage() >= threshold && !self.won && !self.lost){
            self.addPopUpWin()
            self.won = true
        }
    }
    
    //Mark: makes a pop up on the scene
    internal func addPopUpWin(){
        let win = PopUp(scene: self.scene, text: "YOU WIN!", colour: .blue)
        win.setFontColour(font: .cyan)
        self.scene.addChild(win)
        self.won = true
    }
    
    //Mark: makes a pop up on the scene
    internal func addPopUpLoss(){
        let loss = PopUp(scene: self.scene, text: "YOU LOSE!", colour: .red)
        loss.setFontColour(font: .black)
        self.scene.addChild(loss)
        self.lost = true
    }
    
    //Mark: creates a dendrite path
    private func createDendrite(path: [Int]) -> CGMutablePath {
        let dendrite = CGMutablePath()
        for p in path {
            for node in getNodes() {
                if(((node.name)?.contains(String(describing: p)))! && (p == path.first!)) {
                    dendrite.move(to: node.position)
                }
                else if((node.name)?.contains(String(describing: p)))! {
                    dendrite.addLine(to: node.position)
                }
            }
        }
        dendrite.addLine(to: cellBody.position)
        return dendrite
    }
    
    //Mark: creates eachh dendrite path from the array of points
    internal func initDendrites(){
        for d in self.dendrites {
            d.setPath(createDendrite(path: d.getPathOrder()))
        }
        if(self.drawPaths){
            draw()
        }
    }
    
    //Mark: draw dendrite paths on scene
    private func draw(){
        for d in self.dendrites {
            let p = SKShapeNode()
            p.path = d.getPath()
            p.zPosition = 2
            p.strokeColor = UIColor.black
            p.lineWidth = 20
            self.scene.addChild(p)
        }
    }
    

    
    //Mark: handle touches
    internal func touchSynapse(_ location: String){
        for d in dendrites {
            if (location == d.getSynapseName()){
                if(d.getNumShots() > 0 && d.isAuto() == false){
                    addTrans(dendrite: d)
                    d.takeShot()
                }
            }
        }
    }
    
    //Mark: used to hide instructions
    internal func hideInstructions(){
        self.instructions.removeFromParent()
    }

//------------------------------------ Timing Methods --------------------------------------------------
    
    //Mark: adds the pulse effect to the axon
    private func pulseActionPotential() {
        let difference = abs(threshold - getVoltage())
        let interval = 1 / difference
        if(thresholdReached == false){
            thresholdReached = true
            _ = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) {
                (_) in
                self.actionPotentialEmitter?.position = CGPoint(x: self.cellBody.position.x,y: self.cellBody.position.y - 120)
                if(self.hidden == true){
                    self.scene.addChild(self.actionPotentialEmitter!)
                    self.hidden = false
                }
                else {
                    self.actionPotentialEmitter!.removeFromParent()
                    self.hidden = true
                }
            }
        }
    }
    
    //Mark: reset voltage time
    private func resetVoltageTimer(time: TimeInterval) {
        if(time > 0){
            resetTimer = Timer.scheduledTimer(timeInterval: time, target: self, selector: #selector(self.resetVolts), userInfo: nil, repeats: true)
        }
    }
    
    //Mark: Helper method for reset Voltage timer
    @objc private func resetVolts(){
        if(cellBody.getVoltage() >= -69){ cellBody.setVoltage(v: cellBody.getVoltage() - 1)  }
        else if(cellBody.getVoltage() <= -71){ cellBody.setVoltage(v: cellBody.getVoltage() + 1)}
        else if(cellBody.getVoltage() < -69 && cellBody.getVoltage() > -71){ cellBody.setVoltage(v: -70)}
        cellBody.setGlowAlpha()
    }
    
    
    //Mark: auto fire fuction
    internal func autoFire(){
        for d in dendrites {
            if(d.isAuto() ==  true){
                autoFireTrans(dendrite: d)
            }
        }
    }
    
    //Mark: auto fire fuction
    internal func autoFireTrans(dendrite: Dendrite){
        _ = Timer.scheduledTimer(withTimeInterval: dendrite.getDelay(), repeats: true) {
            (_) in
            self.addTrans(dendrite: dendrite)
        }
    }
 
//-------------------------------------- Add Transmitter --------------------------------------------------------
    
    //Mark: adds a transmitter
    internal func addTrans(dendrite: Dendrite){
        if(dendrite.canShoot()){
            if(dendrite.getTransType() == ExcitTransmitter.self){
                let excitTrans = ExcitTransmitter(dendrite: dendrite)
                self.scene.addChild(excitTrans)
                excitTrans.moveTrans()
            }
            if(dendrite.getTransType() == InhibitTransmitter.self){
                let inhibitTrans = InhibitTransmitter(dendrite: dendrite)
                self.scene.addChild(inhibitTrans)
                inhibitTrans.moveTrans()
            }
            if(dendrite.getDelay() != 0){
                dendrite.disableShoot()
                DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(Int(dendrite.getDelay() * 1000)), execute: {
                    dendrite.enableShoot()
                })
            }
        }
    }
    
//-------------------------------------- Contact Handlers ------------------------------------------------------
    
    //Mark: actual handler for collision detection
    internal func contactHandler(_ contact: SKPhysicsContact){
        let categoryA = contact.bodyA.categoryBitMask
        let categoryB = contact.bodyB.categoryBitMask
        if(categoryA == CollisionCategory.cellBody || categoryB == CollisionCategory.cellBody){
            if(categoryA == CollisionCategory.cellBody){
                if let otherNode = contact.bodyB.node {
                    cellBodyContact(trans: otherNode as! Transmitter,scene: self.scene)
                }
            }
            else if(categoryB == CollisionCategory.cellBody){
                if let otherNode = contact.bodyA.node {
                    cellBodyContact(trans: otherNode as! Transmitter, scene: self.scene)
                }
            }
        }
        else {
            let bodyA = contact.bodyA.node as! Transmitter
            let bodyB = contact.bodyB.node as! Transmitter
            transContact(firstTrans: bodyA, secondTrans: bodyB, scene: self.scene)
        }
    }
    
    //Mark: handle cell body and transmitter contact
    private func cellBodyContact(trans: Transmitter,scene: SKScene){
        if(trans.alpha != 0){
            cellBody.setVoltage(v: cellBody.getVoltage() + trans.getCharge())
            cellBody.updateGlow()
        }
        if(cellBody.getVoltage() > threshold){
            pulseActionPotential()
        }
        trans.removeFromParent()
    }
    
    //Mark: handle transmitter contact
    private func transContact(firstTrans: Transmitter, secondTrans: Transmitter, scene: SKScene){
        if(abs(firstTrans.getCharge()) >= abs(secondTrans.getCharge())){
            firstTrans.sumCharge(trans: secondTrans)
            secondTrans.removeFromParent()
            firstTrans.fadeTrans()
        }
        else if(abs(firstTrans.getCharge()) < abs(secondTrans.getCharge())){
            secondTrans.sumCharge(trans: firstTrans)
            firstTrans.removeFromParent()
            secondTrans.fadeTrans()
        }
    }
}

