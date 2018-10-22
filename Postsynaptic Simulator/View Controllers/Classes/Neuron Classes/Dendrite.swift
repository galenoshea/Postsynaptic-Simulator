//
//  Dendrite.swift
//  The Neuron Education Project
//
//  Created by Galen O'Shea on 2018-04-08.
//  Copyright © 2018 SOIL. All rights reserved.
//

import Foundation
import SpriteKit

class Dendrite {
    
    //Mark: dendrite class
    private var synapseName: String
    private var pathOrder: [Int]
    private var transType: Transmitter.Type
    private var decay: TimeInterval
    private var delay: TimeInterval
    private var numShots: Int
    private var shoot = true
    private var path = CGMutablePath()
    private var auto = false
    
    init(synapseName: String, pathOrder: [Int], transType: Transmitter.Type, decay: TimeInterval, delay: TimeInterval, numShots: Int, auto: Bool){
        self.synapseName = synapseName
        self.pathOrder = pathOrder
        self.transType = transType
        self.decay = decay
        self.delay = delay
        self.numShots = numShots
        self.auto = auto
    }
    
    func getPathOrder()->[Int]{
        return self.pathOrder
    }
    
    func getTransType()-> Transmitter.Type{
        return self.transType
    }
    
    func getDecay()-> TimeInterval{
        return self.decay
    }
    
    func getDelay()-> TimeInterval{
        return self.delay
    }
    
    func getSynapseName()-> String{
        return self.synapseName
    }
    
    func getNumShots()-> Int{
        return self.numShots
    }
    
    func takeShot(){
        self.numShots -= 1
    }
    
    func isAuto()->Bool{
        return self.auto
    }
    
    func canShoot()->Bool{
        return self.shoot
    }
    
    func disableShoot(){
        self.shoot = false
    }
    
    func enableShoot(){
        self.shoot = true
    }
    
    func setPath(_ path: CGMutablePath){
        self.path = path
    }
    
    func getPath()-> CGMutablePath{
        return self.path
    }
}
