//
//  Instructions.swift
//  The Neuron Education Project
//
//  Created by Galen O'Shea on 2018-04-14.
//  Copyright © 2018 SOIL. All rights reserved.
//

import Foundation
import SpriteKit

class InstructionsPopUp: SKSpriteNode {
    
    //Mark:
    private var instructionsSize = CGSize(width: 400, height: 400 )
    private var instructionsScale: CGFloat = 1
    private var instructionsColour: UIColor = .white
    private let instructionsLabel = SKLabelNode(fontNamed: "Futura")
    private var continueButton = SKSpriteNode()
    private let screenMod: CGFloat = 1.5
    
    //Mark:
    init(scene: SKScene, text: String){
        instructionsSize = CGSize(width: scene.frame.width, height: scene.frame.height)
        super.init(texture: nil, color: instructionsColour, size: instructionsSize)
        self.zPosition = 10
        self.name = "Instructions"
        self.position  = CGPoint(x: 0, y: 0)
        self.setScale(instructionsScale)
        self.setContinue()
        self.setInstructionsLabel(text: text)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //Mark:
    func setInstructionsText(_ t: String){
        instructionsLabel.text = t
    }
    
    //Mark:
    func setInstructionsLabel(text: String){
        instructionsLabel.name = "InstructionsLabel"
        instructionsLabel.zPosition = 19
        instructionsLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        instructionsLabel.preferredMaxLayoutWidth = self.size.width * 0.8
        instructionsLabel.numberOfLines = 15
        instructionsLabel.horizontalAlignmentMode = .center
        instructionsLabel.verticalAlignmentMode = .center
        instructionsLabel.position = CGPoint(x: 0, y: UIScreen.main.bounds.height/2 * 0.8)
        instructionsLabel.color = .black
        instructionsLabel.fontColor = .black
        instructionsLabel.text = text
        instructionsLabel.fontSize = 40
        self.addChild(instructionsLabel)
    }
    
    //Mark: sets continue label
    func setContinueLabel()->SKLabelNode{
        let continueLabel = SKLabelNode(fontNamed: "Futura")
        continueLabel.name = "ContinueLabel"
        continueLabel.zPosition = 13
        continueLabel.horizontalAlignmentMode = .center
        continueLabel.verticalAlignmentMode = .center
        continueLabel.color = .white
        continueLabel.text = "Continue"
        continueLabel.fontSize = 60
        continueLabel.position = CGPoint(x: 0, y: (-UIScreen.main.bounds.height/2) * screenMod)
        return continueLabel
    }
    
    
    //Mark: 
    func setContinue(){
        self.continueButton.name = "Continue"
        self.continueButton.zPosition = 12
        self.continueButton.color = .purple
        self.continueButton.size = CGSize(width: self.frame.width, height: 140)
        self.continueButton.position = CGPoint(x: 0, y: (-UIScreen.main.bounds.height/2) * screenMod)
        self.addChild(self.continueButton)
        self.addChild(setContinueLabel())
    }

}
