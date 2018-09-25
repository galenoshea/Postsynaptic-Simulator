//
//  Level1ViewController.swift
//  The Neuron Education Project
//
//  Created by Galen O'Shea on 2018-08-06.
//  Copyright © 2018 SOIL. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

class GameViewController: UIViewController {
    
    internal var name: String = "Level Name"
    
    @IBOutlet weak var levelView: SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationController?.navigationBar.isHidden = false
        
        
        if let view = self.levelView as SKView? {
            
            if(self.name == "Level 1"){
                if let scene = Level1(fileNamed: self.name){
                    scene.scaleMode = .aspectFill
                    levelView.presentScene(scene, transition: SKTransition.fade(withDuration: 0.5))
                }
            }
            
            else if(self.name == "Level 2"){
                if let scene = Level2(fileNamed: self.name){
                    scene.scaleMode = .aspectFill
                    view.presentScene(scene, transition: SKTransition.fade(withDuration: 0.5))
                }
            }
            
            else if(self.name == "Level 3"){
                if let scene = Level3(fileNamed: self.name){
                    scene.scaleMode = .aspectFill
                    view.presentScene(scene, transition: SKTransition.fade(withDuration: 0.5))
                }
            }
            
            else if(self.name == "Level 4"){
                if let scene = Level4(fileNamed: self.name){
                    scene.scaleMode = .aspectFill
                    view.presentScene(scene, transition: SKTransition.fade(withDuration: 0.5))
                }
            }
            
            else if(self.name == "Level 5"){
                if let scene = Level5(fileNamed: self.name){
                    scene.scaleMode = .aspectFill
                    view.presentScene(scene, transition: SKTransition.fade(withDuration: 0.5))
                }
            }
            
            else if(self.name == "Level 6"){
                if let scene = Level6(fileNamed: self.name){
                    scene.scaleMode = .aspectFill
                    view.presentScene(scene, transition: SKTransition.fade(withDuration: 0.5))
                }
            }
            
            
            else if(self.name == "Level 7"){
                if let scene = Level7(fileNamed: self.name){
                    scene.scaleMode = .aspectFill
                    view.presentScene(scene, transition: SKTransition.fade(withDuration: 0.5))
                }
            }
            
            else if(self.name == "Level 8"){
                if let scene = Level8(fileNamed: self.name){
                    scene.scaleMode = .aspectFill
                    view.presentScene(scene, transition: SKTransition.fade(withDuration: 0.5))
                }
            }
            
            else {
                print("Level does not exist")
            }
            
            view.ignoresSiblingOrder = true
            view.showsFPS = false
            view.showsNodeCount = false
            
        }
        
        self.title = self.name
    
    }

    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
