//
//  Instructions.swift
//  The Neuron Education Project
//
//  Created by Galen O'Shea on 2018-04-25.
//  Copyright © 2018 SOIL. All rights reserved.
//

import Foundation
import SpriteKit

class Instructions: SKLabelNode {

    init(scene: SKScene,instructions: String){
       // let instructionsSize = CGSize(width: scene.frame.width, height: scene.frame.height)
        
        super.init(text: instructions)
        
        self.name = "InstructionsLabel"
        self.zPosition = 13
        self.horizontalAlignmentMode = .center
        self.verticalAlignmentMode = .center
        self.position = self.position
        self.color = .black
        self.fontColor = .black
        self.text = instructions
        self.fontSize = 60
        scene.addChild(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
