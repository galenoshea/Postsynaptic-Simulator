//
//  CellBody.swift
//  The Neuron Education Project
//
//  Created by Galen O'Shea on 2017-11-09.
//  Copyright © 2017 SOIL. All rights reserved.
//

import Foundation
import SpriteKit

class CellBody : SKSpriteNode {
    
    //Mark: cell body vars
    internal var cellBodyGlow = SKSpriteNode(imageNamed: "electricParticle")
    private let cellBodyTexture = SKTexture(imageNamed: "cellBody")
    private let cellBodyColour:UIColor = .black
    private let cellBodySize:CGSize = CGSize(width: 201, height: 301)
    private let cellBodyScale:CGFloat = 1.3
    private let cellBodyName = "Soma"
    internal var voltageLabel = SKLabelNode(fontNamed: "Futura")
    private var voltage: Double = -70 {
        didSet { voltageLabel.text = "\((voltage * 10).rounded(.toNearestOrEven) / 10) mV" }
    }

    //Mark: initializer for cell body
    init(scene: SKScene){
        super.init(texture: cellBodyTexture, color: cellBodyColour, size: cellBodySize)
        self.name = cellBodyName
        self.zPosition = 4
        self.anchorPoint = CGPoint(x: 0.5,y : 0.67)
        self.position  = CGPoint(x: 0, y: (-UIScreen.main.bounds.height/2) * 1.2)
        
        
        
        self.setScale(cellBodyScale)
        self.physicsBody = SKPhysicsBody(circleOfRadius: cellBodySize.width/2 - 50)
        self.physicsBody?.affectedByGravity = false
        self.physicsBody!.categoryBitMask = CollisionCategory.cellBody
        self.physicsBody!.contactTestBitMask = CollisionCategory.excitTrans | CollisionCategory.inhibitTrans
        scene.addChild(setLabel())
        scene.addChild(setGlow())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getVoltage()-> Double{
        return self.voltage
    }
    
    func setVoltage(v: Double){
        self.voltage = v
    }
    
    //Mark: sets voltage label
    func setLabel() -> SKLabelNode{
        self.voltageLabel.name = "VoltageLabel"
        self.voltageLabel.zPosition = 5
        self.voltageLabel.horizontalAlignmentMode = .center
        self.voltageLabel.verticalAlignmentMode = .center
        self.voltageLabel.position = self.position
        self.voltageLabel.text = "-70.0 mV"
        self.voltageLabel.fontSize = 60
        self.voltageLabel.fontColor = SKColor.white
        return self.voltageLabel
    }
    
    //Mark: sets the glow fade
    func setGlowAlpha(){
        self.cellBodyGlow.alpha = abs(CGFloat(-70 - self.voltage)) / 10
    }
    
    //Mark: updates glow
    func updateGlow(){
        var colour : UIColor = .clear
        setGlowAlpha()
        if (voltage > -70){
            colour = .blue
        }
        else if(voltage < -70){
            colour = .red
        }
        let colourize = SKAction.colorize(with: colour, colorBlendFactor: 1, duration: 0.5)
        self.cellBodyGlow.run(colourize)
        // if(self.voltage <= -55){self.cellBodyGlow.setScale(CGFloat(6 + abs(-70 - self.voltage) / 3))}
    }
    
    //Mark: sets glow
    func setGlow() -> SKSpriteNode{
        self.cellBodyGlow.name = "Glow"
        self.cellBodyGlow.zPosition = 3
        self.cellBodyGlow.position = self.position
        self.cellBodyGlow.size = CGSize(width: 100, height: 100)
        self.cellBodyGlow.setScale(6)
        self.cellBodyGlow.alpha = 0
        return self.cellBodyGlow
    }
}
