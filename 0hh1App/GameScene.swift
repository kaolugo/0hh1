//
//  GameScene.swift
//  0hh1App
//
//  Created by Kaoru Murai on 1/20/20.
//  Copyright © 2020 Kaoru Murai. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    

    override func didMove(to view: SKView) {
        //super.sceneDidLoad()
        let sampleBoard = Board(dimensions: 4)
        self.backgroundColor = UIColor.black
        print("hello")
//        let button = Button(userAccess: true)
//        addChild(button)
//      button.size = CGSize(width: 20, height: 20)
//        button.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
      //var index1 : Int
      //var index2 : Int
      //index1 = 0
      //index2 = 0
      
      var d = size.width * 0.05
      var margin = size.width * 0.1
      var sizeX = (size.width - 5 * d) / 4
      var sizeY = (size.height - 4 * sizeX) / 2
      
      var positionX : CGFloat
      var positionY : CGFloat
      
      
      for i in 0...(4-1){
        sampleBoard.board[i][0].size = CGSize(width: sizeX, height: sizeX)
        //sampleBoard.board[0][i].size = CGSize(width: sizeX, height: sizeX)
        
        positionX = 1.5 * margin
        
        var increment = CGFloat(i)
        
        positionY = (size.height - 4 * sizeX) / 2 + increment * (d + sizeX)
        sampleBoard.board[i][0].position = CGPoint(x: positionX, y: positionY)
        //sampleBoard.board[0][i].position = CGPoint(x: positionX, y: positionY)
        
        addChild(sampleBoard.board[i][0])
        //addChild(sampleBoard.board[0][i])
      }
 
      //for i in
      
      
      for i in 1...(4-1){
        sampleBoard.board[0][i].size = CGSize(width: sizeX, height: sizeX)
        
        var increment = CGFloat(i)
        
        positionX = margin + d + increment * (sizeX + d)
        
        positionY = (size.height - 4 * sizeX) / 2
        
        sampleBoard.board[0][i].position = CGPoint(x: positionX, y: positionY)
        
        addChild(sampleBoard.board[0][i])
      }
 
      
      for i in 1...(4-1){
        for j in 1...(4-1){
          
          sampleBoard.board[i][j].size = CGSize(width: sizeX, height: sizeX)
          
          var incrementI = CGFloat(i)
          var incrementJ = CGFloat(j)
          
          positionX = margin + d + incrementI * (sizeX + d)
          
          positionY = (size.height - 4 * sizeX) / 2 + incrementJ * (sizeX + d)
          
          sampleBoard.board[i][j].position = CGPoint(x: positionX, y: positionY)
          addChild(sampleBoard.board[i][j])
        }
      }
        //button.anchorPoint
    }
    
    

}
