//
//  HowToPlayScene.swift
//  0hh1App
//
//  Created by Kaoru Murai on 3/5/20.
//  Copyright © 2020 Kaoru Murai. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

class HowToPlayScene : SKScene {
    private var howToImage = SKSpriteNode()
    private var howToText = SKSpriteNode()
    private var counter = 1
    private var imageTexture = SKTexture()
    private var textTexture = SKTexture()
    // rules
    /*
     1.) goal of the game: fill the board
     2.) tap once to turn a tile blue
     3.) tap twice to turn a tile red
     4.) three tiles of the same color in a row isn't allowed
     5.) three tiles of the same color in a column isn't allowed either
     6.) a full row must have as many red tiles as it has blue ones
     7.) a full column must have an equal number of each color too !
     8.) no two rows an now two columns can be the same
     9.) happy tiling !!
     */
    override init (size: CGSize) {
        super.init(size: size)
        //self.scaleMode = .resizeFill
        
        self.backgroundColor = SKColor.black
        
        // image for how to play
        howToImage = SKSpriteNode(imageNamed: "How to Play 1")
        howToImage.position = CGPoint(x: size.width/2, y: size.height/2 - 50)
        //howToImage.setScale(3/4)
        howToImage.setScale(size.width / size.height)
        
        
        //howToImage.setScale(size.height / 2)
        addChild(howToImage)
        
        // text for how to play
        howToText = SKSpriteNode(imageNamed: "How to Text 1")
        howToText.position = CGPoint(x: size.width/2, y: size.height/2 + 200)
        howToText.setScale(0.28)
        howToText.zPosition = 10
        addChild(howToText)
        
        let titleButton = replayButton(labelFont: "Arial", labelText: "Return to Title", fontSize: 30)
        var titleButtonY = howToImage.position.y - howToImage.size.height / 2 - 30
        //titleButton.position = CGPoint(x: size.width/2, y: size.height/2 - 350)
        titleButton.position = CGPoint(x: size.width / 2, y: titleButtonY)
        titleButton.zPosition = 10
        addChild(titleButton)
        
        
    }
    
    required init(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        if counter == 1 {
            imageTexture = SKTexture(imageNamed: "How to Play 2")
            howToImage.texture = imageTexture
            
            textTexture = SKTexture(imageNamed: "How to Text 2")
            howToText.texture = textTexture
            
            counter += 1
        }
        else if counter == 2 {
            imageTexture = SKTexture(imageNamed: "How to Play 3")
            howToImage.texture = imageTexture
            
            textTexture = SKTexture(imageNamed: "How to Text 3")
            howToText.texture = textTexture
            
            counter += 1
        }
        else if counter == 3 {
            imageTexture = SKTexture(imageNamed: "How to Play 4")
            howToImage.texture = imageTexture
            
            textTexture = SKTexture(imageNamed: "How to Text 4")
            howToText.texture = textTexture
            howToText.position = CGPoint(x: size.width/2, y: size.height/2 + 250)
            
            counter += 1
        }
        else if counter == 4 {
            imageTexture = SKTexture(imageNamed: "How to Play 5")
            howToImage.texture = imageTexture
            
            textTexture = SKTexture(imageNamed: "How to Text 5")
            howToText.texture = textTexture
            howToText.position = CGPoint(x: size.width/2, y: size.height/2 + 200)
            
            counter += 1
        }
        else if counter == 5 {
            imageTexture = SKTexture(imageNamed: "How to Play 6")
            howToImage.texture = imageTexture
            
            textTexture = SKTexture(imageNamed: "How to Text 6")
            howToText.texture = textTexture
            
            counter += 1
        }
        else if counter == 6 {
            imageTexture = SKTexture(imageNamed: "How to Play 7")
            howToImage.texture = imageTexture
            
            textTexture = SKTexture(imageNamed: "How to Text 7")
            howToText.texture = textTexture
            howToText.position = CGPoint(x: size.width/2, y: size.height/2 + 250)
            
            counter += 1
        }
        else if counter == 7 {
            imageTexture = SKTexture(imageNamed: "How to Play 8")
            howToImage.texture = imageTexture
            
            textTexture = SKTexture(imageNamed: "How to Text 8")
            howToText.texture = textTexture
            howToText.position = CGPoint(x: size.width/2, y: size.height/2 + 200)
            
            counter += 1
        }
        else if counter == 8 {
            imageTexture = SKTexture(imageNamed: "How to Play 9")
            howToImage.texture = imageTexture
            
            howToText.removeFromParent()
            var finalText = SKLabelNode(fontNamed: "Arial")
            finalText.text = "Happy tiling >:)"
            finalText.fontSize = 50
            finalText.position = CGPoint(x: size.width/2, y: size.height/2 + 150)
            finalText.zPosition = 10
            addChild(finalText)
            
            counter += 1
        }
        else {
            var transition = SKTransition.doorsOpenHorizontal(withDuration: 1)
            var scene = GameStart(size: self.scene!.size)
            scene.scaleMode = SKSceneScaleMode.aspectFill
            
            self.scene?.view?.presentScene(scene, transition: transition)
        }
        
    }
    
    
}
