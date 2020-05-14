//
//  HowToPlayButton.swift
//  0hh1App
//
//  Created by Kaoru Murai on 3/5/20.
//  Copyright © 2020 Kaoru Murai. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

class howToPlayButton : SKLabelNode {
    override init () {
        super.init()
    }
    
    init(labelFont: String, viewHeight: CGFloat){
        super.init(fontNamed: labelFont)
        self.text = "How to Play"
        //self.fontSize = 40
        self.fontSize = viewHeight / 20
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
        
        let transition = SKTransition.doorsOpenVertical(withDuration: 1)
        
        var view = self.scene?.view
        
        let scene = HowToPlayScene(size: self.scene!.size)
        
        scene.scaleMode = SKSceneScaleMode.aspectFill
        
        self.scene?.view?.presentScene(scene, transition: transition)
    }
}
