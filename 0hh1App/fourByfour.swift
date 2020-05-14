//
//  fourByfour.swift
//  0hh1App
//
//  Created by Kaoru Murai on 3/4/20.
//  Copyright © 2020 Kaoru Murai. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit


class fourByfour : SKLabelNode {
    var trans: Int
    //override init () {
        //super.init()
   // }
    
    init (labelFont: String, labelText: String, transDirection: Int, viewHeight: CGFloat) {
        self.trans = transDirection
        super.init()
        self.fontName = labelFont
        self.text = labelText
        //self.fontSize = 50
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
        if (self.trans == 0){
            //print("touched")
                let transition1 = SKTransition.doorsOpenVertical(withDuration: 1)
            //let transition = SKTransition.crossFade(withDuration: 1)
                
            var view = self.scene?.view
            
            let scene = GameScene(size: self.scene!.size, gameView: view!)
                scene.scaleMode = SKSceneScaleMode.aspectFill
                self.scene?.view?.presentScene(scene, transition: transition1)
        }
            
        else {
            let transition2 = SKTransition.doorsOpenHorizontal(withDuration: 1)
            //let transition = SKTransition.crossFade(withDuration: 1)
                
            var view = self.scene?.view
            
            let scene = GameScene(size: self.scene!.size, gameView: view!)
                scene.scaleMode = SKSceneScaleMode.aspectFill
                self.scene?.view?.presentScene(scene, transition: transition2)
        }
        
    }
    
}
