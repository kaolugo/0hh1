//
//  replayButton.swift
//  0hh1App
//
//  Created by Kaoru Murai on 3/3/20.
//  Copyright © 2020 Kaoru Murai. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit


class replayButton : SKLabelNode {
    
    override init () {
        //scene = gameScene
        
        super.init()
        
    }
    
    init(labelFont: String){
        super.init(fontNamed: labelFont)
        self.text = "Replay ↻"
        self.fontSize = 40
        self.fontColor = SKColor.white
        self.colorBlendFactor = 1.0
    }
    
    init (labelFont: String, labelText: String, fontSize: CGFloat) {
        super.init(fontNamed: labelFont)
        self.text = labelText
        self.fontSize = fontSize
        self.fontColor = SKColor.white
        self.colorBlendFactor = 1.0
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isUserInteractionEnabled: Bool {
        set {
            // ignore
        }
        get {
            return true
        }
    }

   
 
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touched")
        let transition = SKTransition.doorsOpenVertical(withDuration: 1)
        //let transition = SKTransition.crossFade(withDuration: 1)
            
        var view = self.scene?.view
        
        let scene = GameStart(size: self.scene!.size)
        //let scene = GameScene(size: self.scene!.size, gameView: view!)
            scene.scaleMode = SKSceneScaleMode.aspectFill
            self.scene?.view?.presentScene(scene, transition: transition)
    }
 
    
}
