//
//  PopUp.swift
//  The Neuron Education Project
//
//  Created by Galen O'Shea on 2018-02-07.
//  Copyright © 2018 SOIL. All rights reserved.
//


import Foundation
import SpriteKit

class PopUp : SKSpriteNode{
    
    //Mark:
    private var popUpSize = CGSize(width: 350, height: 150)
    private var popUpScale: CGFloat = 1
    private var popUpColour: UIColor = .white
    private var popUpLabel = SKLabelNode(fontNamed: "Futura")
    
    //Mark:
    init(scene: SKScene, text: String,colour: UIColor){
        self.popUpColour = colour
        super.init(texture: nil, color: popUpColour, size: popUpSize)
        self.zPosition = 10
        self.position  = CGPoint(x: 0, y: 0)
        self.setScale(popUpScale)
        scene.addChild(setLabel(text: text))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     //Mark: sets font colour
    func setFontColour(font: SKColor){
        self.popUpLabel.fontColor = font
    }
    
     //Mark: sets label
    func setLabel(text: String)-> SKLabelNode{
        self.popUpLabel.name = "PopUpLabel"
        self.popUpLabel.zPosition = 11
        self.popUpLabel.horizontalAlignmentMode = .center
        self.popUpLabel.verticalAlignmentMode = .center
        self.popUpLabel.position = self.position
        self.popUpLabel.text = text
        self.popUpLabel.fontSize = 60
        return self.popUpLabel
    }
}

