//
//  GameClear.swift
//  0hh1App
//
//  Created by Kaoru Murai on 3/1/20.
//  Copyright © 2020 Kaoru Murai. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class GameClear : SKScene {
    
    //var view: SKView
    
    override init (size: CGSize){
        //view = gameView
        
        super.init(size: size)
        
        self.backgroundColor = SKColor.black
        
        if let particlesUp = SKEmitterNode(fileNamed: "confetti") {
            particlesUp.position = CGPoint(x: size.width/2, y: 3 * (size.height/4) - 100)
            addChild(particlesUp)
        }
        
        if let particlesDown = SKEmitterNode(fileNamed: "ConfettiV2") {
            particlesDown.position = CGPoint(x: size.width/2, y: size.height/4 + 100)
            addChild(particlesDown)
        }
        
        if let particlesDownRed = SKEmitterNode(fileNamed: "ConfettiRed2") {
                   particlesDownRed.position = CGPoint(x: size.width/2, y: size.height/4 + 100)
                   addChild(particlesDownRed)
               }
        
        if let particlesUpRed = SKEmitterNode(fileNamed: "confettiRed") {
            particlesUpRed.position = CGPoint(x: size.width/2, y: 3 * (size.height/4) - 100)
            addChild(particlesUpRed)
        }
 
        
        let label = SKLabelNode(fontNamed: "AlNile")
        label.text = "Board Cleared !!"
        label.fontSize = 55
        label.fontColor = SKColor.white
        label.position = CGPoint(x: size.width/2, y: size.height/2)
        label.colorBlendFactor = 1.0
        
        //label.zPosition = 1
        addChild(label)
        
        //let view = SKView()
        let replay = replayButton(labelFont: "AlNile")
        
        replay.position = CGPoint(x: size.width/2, y: size.height/4 - 100)
        
        addChild(replay)
        
        
    }
    
    required init(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

}
