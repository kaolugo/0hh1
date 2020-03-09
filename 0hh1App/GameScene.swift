//
//  GameScene.swift
//  0hh1App
//
//  Created by Kaoru Murai on 1/20/20.
//  Copyright © 2020 Kaoru Murai. All rights reserved.
//

import SpriteKit
import GameplayKit

protocol touched{
    func touchesBegan()
}

class GameScene: SKScene{
    //var sampleView: SKView
    
    override init (size: CGSize){
        super.init(size: size)
    }
    
    init (size: CGSize, gameView: SKView){
        super.init(size: size)
        //sampleView = gameView
        
        let sampleBoard = Board(dimensions: 4, gameView: gameView, gameScene: self)
        
        self.backgroundColor = UIColor.black
        
        var d = size.width * 0.05
        var margin = size.width * 0.1
        var sizeX = (size.width - 5 * d) / 4
        
        var incrementRow = margin * 2.4 //diff in x divided by margin
        var incrementCol = 3.0
        
        var positionY = (size.height - 4 * sizeX) / 2 + 3 * (d + sizeX)
        var positionX = 1.5 * margin
        
        for row in 0...3{
          //var increment = CGFloat(row)
          //positionX = 1.5 * margin
          //
          
          //loop through columns in 'board' 2D array
          for col in 0...3{
            sampleBoard.board[row][col].size = CGSize(width: sizeX, height: sizeX)
            
            sampleBoard.board[row][col].position = CGPoint(x: positionX, y: positionY)
            
            addChild(sampleBoard.board[row][col])
            
            positionX = positionX + incrementRow
            //positionY = positionY - incrementRow
            
          }
          positionY = positionY - incrementRow
          
          //reset the position variables
          positionX = 1.5 * margin
          //positionY = (size.height - 4 * sizeX) / 2 + 3 * (d + sizeX)
        }
        
        // random integer generator
            let randomInt = Int.random(in: 1..<5)
            let colors: [String] = ["red", "blue"];
           
            
            // if integer generated is 4, generate five buttons
            if (randomInt == 4) {
                for _ in 0...5 {
                    var validBoard = false;
                    
                    while !validBoard {
                        var randomRow = Int.random(in: 0..<4)
                        var randomCol = Int.random(in: 0..<4)
                        
                        var randomColor = Int.random(in:0..<2)
                        
                        sampleBoard.board[randomRow][randomCol].changeButtonColor(desiredColor: colors[randomColor])
                        sampleBoard.board[randomRow][randomCol].changeUserAccess(permission: false)
                        
                        var validRowRed = false
                        var validRowBlue = false
                        var validColRed = false
                        var validColBlue = false
                        
                        validRowRed = sampleBoard.rowHasNoThreesOfColor(size: 4, row: randomRow, color: colors[0])
                        validRowBlue = sampleBoard.rowHasNoThreesOfColor(size: 4, row: randomRow, color: colors[1])
                        validColRed = sampleBoard.colHasNoThreesOfColor(size: 4, col: randomCol, color: colors[0])
                        validColBlue = sampleBoard.colHasNoThreesOfColor(size: 4, col: randomCol, color: colors[1])
                        
                        if (validRowRed && validRowBlue && validColRed && validColBlue){
                            validBoard = true
                        }
                        else {
                            // otherwise, undo everything and try again
                            sampleBoard.board[randomRow][randomCol].changeButtonColor(desiredColor: "white")
                            sampleBoard.board[randomRow][randomCol].changeUserAccess(permission: true)
                            
                        }
                    }
                }
            }
            else {
                // generate four randomly placed blue or red buttons
                for _ in 0...4 {
                    var validBoard = false;
                    
                    while !validBoard {
                        var randomRow = Int.random(in: 0..<4)
                        var randomCol = Int.random(in: 0..<4)
                        
                        var randomColor = Int.random(in:0..<2)
                        
                        sampleBoard.board[randomRow][randomCol].changeButtonColor(desiredColor: colors[randomColor])
                        sampleBoard.board[randomRow][randomCol].changeUserAccess(permission: false)
                        
                        var validRowRed = false
                        var validRowBlue = false
                        var validColRed = false
                        var validColBlue = false
                        
                        validRowRed = sampleBoard.rowHasNoThreesOfColor(size: 4, row: randomRow, color: colors[0])
                        validRowBlue = sampleBoard.rowHasNoThreesOfColor(size: 4, row: randomRow, color: colors[1])
                        validColRed = sampleBoard.colHasNoThreesOfColor(size: 4, col: randomCol, color: colors[0])
                        validColBlue = sampleBoard.colHasNoThreesOfColor(size: 4, col: randomCol, color: colors[1])
                        
                        if (validRowRed && validRowBlue && validColRed && validColBlue){
                            validBoard = true
                        }
                        else {
                            // otherwise, undo everything and try again
                            sampleBoard.board[randomRow][randomCol].changeButtonColor(desiredColor: "white")
                            sampleBoard.board[randomRow][randomCol].changeUserAccess(permission: true)
                            
                        }
                    }
                }
            }
        
        let new = newBoardButton(labelFont: "AlNile")
        
        new.position = CGPoint(x: size.width/2, y: size.height/4 - 100)
        //replay.size = CGSize(width: size.width/2, height: size.height/12)
        //replay.zPosition = 10
        addChild(new)
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMove(to view: SKView) {
        //super.sceneDidLoad()
        let sampleBoard = Board(dimensions: 4, gameView: view, gameScene: self)
        self.backgroundColor = UIColor.black
      
      var d = size.width * 0.05
      var margin = size.width * 0.1
      var sizeX = (size.width - 5 * d) / 4
      var incrementRow = margin * 2.4 //diff in x divided by margin
      var incrementCol = 3.0
      
      var positionY = (size.height - 4 * sizeX) / 2 + 3 * (d + sizeX)
      var positionX = 1.5 * margin
      
      //loop through rows in 'board' 2D array
      for row in 0...3{
        for col in 0...3{
          sampleBoard.board[row][col].size = CGSize(width: sizeX, height: sizeX)
          
          sampleBoard.board[row][col].position = CGPoint(x: positionX, y: positionY)
          
          addChild(sampleBoard.board[row][col])
          
          positionX = positionX + incrementRow
          
        }
        positionY = positionY - incrementRow
        
        //reset the position variables
        positionX = 1.5 * margin
        //positionY = (size.height - 4 * sizeX) / 2 + 3 * (d + sizeX)
      }
        
        
        // populate the board with colored tiles
        
        // random integer generator
        let randomInt = Int.random(in: 1..<5)
        let colors: [String] = ["red", "blue"];
       
        
        // if integer generated is 4, generate five buttons
        if (randomInt == 4) {
            for _ in 0...5 {
                var validBoard = false;
                
                while !validBoard {
                    var randomRow = Int.random(in: 0..<4)
                    var randomCol = Int.random(in: 0..<4)
                    
                    var randomColor = Int.random(in:0..<2)
                    
                    sampleBoard.board[randomRow][randomCol].changeButtonColor(desiredColor: colors[randomColor])
                    sampleBoard.board[randomRow][randomCol].changeUserAccess(permission: false)
                    
                    var validRowRed = false
                    var validRowBlue = false
                    var validColRed = false
                    var validColBlue = false
                    
                    validRowRed = sampleBoard.rowHasNoThreesOfColor(size: 4, row: randomRow, color: colors[0])
                    validRowBlue = sampleBoard.rowHasNoThreesOfColor(size: 4, row: randomRow, color: colors[1])
                    validColRed = sampleBoard.colHasNoThreesOfColor(size: 4, col: randomCol, color: colors[0])
                    validColBlue = sampleBoard.colHasNoThreesOfColor(size: 4, col: randomCol, color: colors[1])
                    
                    if (validRowRed && validRowBlue && validColRed && validColBlue){
                        validBoard = true
                    }
                    else {
                        // otherwise, undo everything and try again
                        sampleBoard.board[randomRow][randomCol].changeButtonColor(desiredColor: "white")
                        sampleBoard.board[randomRow][randomCol].changeUserAccess(permission: true)
                        
                    }
                }
            }
        }
        else {
            // generate four randomly placed blue or red buttons
            for _ in 0...4 {
                var validBoard = false;
                
                while !validBoard {
                    var randomRow = Int.random(in: 0..<4)
                    var randomCol = Int.random(in: 0..<4)
                    
                    var randomColor = Int.random(in:0..<2)
                    
                    sampleBoard.board[randomRow][randomCol].changeButtonColor(desiredColor: colors[randomColor])
                    sampleBoard.board[randomRow][randomCol].changeUserAccess(permission: false)
                    
                    var validRowRed = false
                    var validRowBlue = false
                    var validColRed = false
                    var validColBlue = false
                    
                    validRowRed = sampleBoard.rowHasNoThreesOfColor(size: 4, row: randomRow, color: colors[0])
                    validRowBlue = sampleBoard.rowHasNoThreesOfColor(size: 4, row: randomRow, color: colors[1])
                    validColRed = sampleBoard.colHasNoThreesOfColor(size: 4, col: randomCol, color: colors[0])
                    validColBlue = sampleBoard.colHasNoThreesOfColor(size: 4, col: randomCol, color: colors[1])
                    
                    if (validRowRed && validRowBlue && validColRed && validColBlue){
                        validBoard = true
                    }
                    else {
                        // otherwise, undo everything and try again
                        sampleBoard.board[randomRow][randomCol].changeButtonColor(desiredColor: "white")
                        sampleBoard.board[randomRow][randomCol].changeUserAccess(permission: true)
                        
                    }
                }
            }
        }
    }
  
    
    

}
