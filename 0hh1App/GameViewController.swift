//
//  GameViewController.swift
//  0hh1App
//
//  Created by Kaoru Murai on 1/20/20.
//  Copyright © 2020 Kaoru Murai. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            //if let scene = SKScene(fileNamed: "GameScene") {
            var sceneSize = CGSize(width: view.frame.width, height: view.frame.height)
            //let scene = GameScene(size: sceneSize, gameView: view)
            let scene = GameStart(size: sceneSize)
            
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                scene.size = CGSize(width: view.frame.width, height: view.frame.height)
                print(view.frame.width)
                
                // Present the scene
                view.presentScene(scene)
            //}
            
            view.ignoresSiblingOrder = true
            
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
