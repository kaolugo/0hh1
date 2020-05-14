//
//  GameStartScene.swift
//  0hh1App
//
//  Created by Kaoru Murai on 3/4/20.
//  Copyright © 2020 Kaoru Murai. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

class GameStart : SKScene {
    private var tileMan = SKSpriteNode()
    private var tileMan2 = SKSpriteNode()
    private var tileManTextures: [SKTexture] = []
    private var tileManTextures2: [SKTexture] = []
    
    let actionMoveDone = SKAction.removeFromParent()
    
    override init (size: CGSize){
    //view = gameView
    
        super.init(size: size)
        
        self.backgroundColor = SKColor.black
        
        // add title
        let titleTexture = SKTexture(imageNamed: "title")
        let title = SKSpriteNode(texture: titleTexture)
        title.position = CGPoint(x: size.width/2, y: size.height/4 * 3 - 100)
        title.setScale(3/4)
        addChild(title)
        
        
        if let particlesUp = SKEmitterNode(fileNamed: "confetti") {
            particlesUp.position = CGPoint(x: size.width/2, y: 3 * (size.height/4))
            addChild(particlesUp)
        }
        
        if let particlesUpRed = SKEmitterNode(fileNamed: "confettiRed") {
                   particlesUpRed.position = CGPoint(x: size.width/2, y: 3 * (size.height/4))
                   addChild(particlesUpRed)
               }
        
        
        // add how to play button
        
        // add 4x4 option
        //let fourButton = fourByfour(labelFont: "AvenirNext", labelText: "4x4", )
        let fourButton = fourByfour(labelFont: "AppleSDGothicNeo-Regular", labelText: "4x4", transDirection: 1, viewHeight: size.height)
        
        // EXPERIMENT - made the UI adaptable to different screen sizes
        var fourButtonY = title.position.y - size.height/7
        fourButton.position = CGPoint(x: size.width/2, y: fourButtonY)
        
        //print(xPosition)
        fourButton.zPosition = 10
        addChild(fourButton)
        
        
        
        // add 6x6 option
        let sixButton = sixBysix(labelFont: "AppleSDGothicNeo-Regular", labelText: "6x6", transDirection: 1, viewHeight: size.height)
        
        //sixButton.position = CGPoint(x: size.width/2, y: fourButton.position.y - 40)
        
        sixButton.position = CGPoint(x: size.width/2, y: fourButton.position.y - size.height / 18)
        
        sixButton.zPosition = 10
        addChild(sixButton)
        
        
        // add 8x8 option
        let eightButton = eightByEight(labelFont: "AppleSDGothicNeo-Regular", labelText: "8x8", transDirection: 1, viewHeight: size.height)
        
        eightButton.position = CGPoint(x: size.width / 2, y : sixButton.position.y - size.height / 18)
        
        eightButton.zPosition = 10
        addChild(eightButton)
        
        
        // how to play button
        let howToPlay = howToPlayButton(labelFont: "AppleSDGothicNeo-Regular", viewHeight: size.height)
        
        // EXPERIMENT - made the UI adaptable to different screen sizes
        //var howToPlayY = fourButton.position.y - size.height / 20 * 2
        howToPlay.position = CGPoint(x: size.width/2, y : eightButton.position.y - size.height / 18)
        
        addChild(howToPlay)
        
        // running tile man animation
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(buildTileMan), SKAction.run(animateTileMan),  SKAction.wait(forDuration: 3.0), SKAction.run(removeTileMan1), SKAction.run(buildTileMan2), SKAction.run(animateTileMan2), SKAction.wait(forDuration: 2.0)])))
       
    }
    
    required init(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // makes first part of the tile man animation
    func buildTileMan() {
        //let tileManAnimatedAtlas = SKTextureAtlas(named: "RunningTileMan")
        var runFrames: [SKTexture] = []
        
        runFrames.append(SKTexture(imageNamed: "Running Tile Man 1"))
        runFrames.append(SKTexture(imageNamed: "Running Tile Man 3"))
        runFrames.append(SKTexture(imageNamed: "Running Tile Man 2"))
        runFrames.append(SKTexture(imageNamed: "Running Tile Man 3"))
        
        
        for i in 0...4 {
            runFrames.append(runFrames[i])
            //runFrames[i].setScale(1/4)
        }
 
        
        runFrames.append(SKTexture(imageNamed: "Running Tile Man 4"))
        runFrames.append(SKTexture(imageNamed: "Running Tile Man 5"))
        runFrames.append(SKTexture(imageNamed: "Running Tile Man 6"))
        runFrames.append(SKTexture(imageNamed: "Running Tile Man 6"))
        runFrames.append(SKTexture(imageNamed: "Running Tile Man 6"))
        runFrames.append(SKTexture(imageNamed: "Running Tile Man 6"))
        runFrames.append(SKTexture(imageNamed: "Running Tile Man 6"))
        runFrames.append(SKTexture(imageNamed: "Running Tile Man 6"))
        runFrames.append(SKTexture(imageNamed: "Running Tile Man 6"))
        runFrames.append(SKTexture(imageNamed: "Running Tile Man 6"))
        runFrames.append(SKTexture(imageNamed: "Running Tile Man 6"))
        
        runFrames.append(SKTexture(imageNamed: "Running Tile Man 3"))
        runFrames.append(SKTexture(imageNamed: "Running Tile Man 3"))
        runFrames.append(SKTexture(imageNamed: "Running Tile Man 3"))
        runFrames.append(SKTexture(imageNamed: "Running Tile Man 3"))
        
        
        tileManTextures = runFrames
        
        let firstFrameTexture = tileManTextures[0]
        tileMan = SKSpriteNode(texture: firstFrameTexture)
        tileMan.position = CGPoint(x: size.width, y: size.height / 6)
        //tileMan.setScale(1/5)
        tileMan.setScale(1/3)
        addChild(tileMan)
        
        
        let actualDuration = CGFloat(1.0)
        
        let actionMove1 = SKAction.move(to: CGPoint(x: 3 * size.width/5, y: size.height/6), duration: TimeInterval(actualDuration))
        
        tileMan.run(actionMove1)
    }
    
    
    // this func needeed because actionMoveDone is not built in to buildTileMan1
    func removeTileMan1() {
        tileMan.run(actionMoveDone)
    }
    
    
    func buildTileMan2() {
        // make second part of animation
        var runFrames2: [SKTexture] = []
        
        runFrames2.append(SKTexture(imageNamed: "Running Tile Man 1"))
        runFrames2.append(SKTexture(imageNamed: "Running Tile Man 3"))
        runFrames2.append(SKTexture(imageNamed: "Running Tile Man 2"))
        runFrames2.append(SKTexture(imageNamed: "Running Tile Man 3"))
        
        tileManTextures2 = runFrames2
        
        let firstFrameTexture2 = tileManTextures2[0]
        tileMan2 = SKSpriteNode(texture: firstFrameTexture2)
        tileMan2.position = CGPoint(x: 3 * size.width / 5, y: size.height / 6)
        tileMan2.setScale(1/3)
        //tileMan2.setScale(1/size.width)
        addChild(tileMan2)
        
        let actionMove2 = SKAction.move(to: CGPoint(x: 0, y: size.height / 6), duration: TimeInterval(CGFloat(1.0)))
        
        tileMan2.run(SKAction.sequence([actionMove2, actionMoveDone]))
    }
    
    
    
    func animateTileMan() {
        tileMan.run(SKAction.animate(with: tileManTextures, timePerFrame: 0.1, resize: false, restore: false), withKey: "runningTileMan")
    }
    
    func animateTileMan2 () {
        tileMan2.run(SKAction.repeatForever(SKAction.animate(with: tileManTextures2, timePerFrame: 0.1, resize: false, restore: false)), withKey: "runningTileMan2")
    }
    
}
