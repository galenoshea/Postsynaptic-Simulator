//
//  Transmitter.swift
//  The Neuron Education Project
//
//  Created by Galen O'Shea on 2017-11-05.
//  Copyright © 2017 SOIL. All rights reserved.
//

import Foundation
import SpriteKit

class Transmitter : SKSpriteNode {
    
    //Mark: vars
    private var path: CGMutablePath
    private var decay: TimeInterval
    private var transSpeed: CGFloat = 200
    private let defaultRadiusAdjustment: CGFloat = 1/4
    private let defaultTexture = SKTexture(imageNamed: "electricParticle")
    private let defaultZPosition:CGFloat = 0
    private var defaultScale:CGFloat = 1.0
    private var multiplier: Double = -14.0 // values will be overwritten by subclass
    private var colour: UIColor = .yellow
    private let defaultSize:CGSize = CGSize(width: 100, height: 100)
    
    //Mark: initializer
    init(colour: UIColor, multiplier: Double, dendrite: Dendrite){
        self.multiplier = multiplier
        self.decay = dendrite.getDecay()
        self.path = dendrite.getPath()
        super.init(texture: defaultTexture, color: colour, size: defaultSize)
        loadDefaultParams(defaultColour: colour)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Mark: get charge of transmitter
    func getCharge() -> Double{
        let charge = Double(self.alpha) *  self.multiplier / abs(self.multiplier) * (1 + ((abs(self.multiplier) - 1) / 6))
        return charge
    }

    //Mark: move action
    func moveTrans() {
        let followPath = SKAction.follow(self.path, asOffset: false, orientToPath: false, speed: self.transSpeed)
        self.run(followPath)
        self.fadeTrans()
    }
    
    //Mark: decay action
    func fadeTrans(){
        if(self.decay != 0){
            let decayAlpha = SKAction.fadeOut(withDuration: self.decay)
            let remove = SKAction.removeFromParent()
            let seq = SKAction.sequence([decayAlpha,remove])
            self.run(seq, withKey: "seq")
        }
    }
    
    //Mark: print transmitter statistics
    func printStats(){
        print("alpha: \(self.alpha) ")
        print("mulitplier: \(self.multiplier) ")
        print("charge: \(self.getCharge()) ")
        print("duration: \(self.decay) ")
        print("scale: \(self.defaultScale) ")
        print()
    }
    
    //Mark: assigns the appropriate deccay when two charges combine
    func calculateFadePerSecond(trans: Transmitter) -> TimeInterval{
        let fadePerSec = Double(self.alpha) / Double(self.decay)
        var newDur: TimeInterval
        if((self.multiplier > 0 && trans.multiplier > 0) || (self.multiplier < 0 && trans.multiplier < 0)){
            newDur = TimeInterval(Double(self.alpha + trans.alpha) / fadePerSec)
        }
        else{
            newDur = TimeInterval(Double(self.alpha - trans.alpha) / fadePerSec)
        }
        return newDur
    }
    
    //Mark: sums charges of two transmitters
    func sumCharge(trans: Transmitter){
        self.decay = self.calculateFadePerSecond(trans: trans)
        if(self.multiplier + trans.multiplier != 0){
            self.multiplier += trans.multiplier
        }
        else{
            self.multiplier /= abs(self.multiplier)
        }
        if((self.multiplier > 0 && trans.multiplier > 0) || (self.multiplier < 0 && trans.multiplier < 0)){
            self.alpha += trans.alpha
            self.defaultScale += abs(0.2 * CGFloat(trans.multiplier))
        }
        else {
            self.alpha -= trans.alpha
            self.defaultScale -= abs(0.2 * CGFloat(trans.multiplier))
        }
        self.setScale(self.defaultScale)
    }
    
    //Mark: adds parameters
    func loadDefaultParams(defaultColour: UIColor) {
        self.setScale(defaultScale)
        self.zPosition = defaultZPosition
        let colourize = SKAction.colorize(with: defaultColour, colorBlendFactor: 1, duration: 0)
        self.run(colourize)
        self.physicsBody = SKPhysicsBody(circleOfRadius: self.size.width*defaultRadiusAdjustment)
        self.physicsBody?.affectedByGravity = false
    }
    
}
