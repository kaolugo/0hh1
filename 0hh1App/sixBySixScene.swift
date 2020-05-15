//
//  sixBySixScene.swift
//  0hh1App
//
//  Created by Kaoru Murai on 5/14/20.
//  Copyright © 2020 Kaoru Murai. All rights reserved.
//

import SpriteKit
import GameplayKit



class sixBySixScene: SKScene{
    
    override init (size: CGSize){
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
    }
    
    init (size: CGSize, gameView: SKView){
        super.init(size: size)
        
        let board = Board(dimensions: 6, gameView: gameView, gameScene: self)
        
        self.backgroundColor = UIColor.black
        
        formatBoard(board: board)
        
        
        populateBoard(board: board)
        
        
        let newBoard = sixBysix(labelFont: "AlNile", labelText: "New Board ↻", transDirection: 0, viewHeight: 800)
        
        newBoard.position = CGPoint(x: size.width/2, y: size.height/4 - 80)

        addChild(newBoard)
        
        let titleButton = replayButton(labelFont: "Arial", labelText: "Return to Title", fontSize: 20)
               titleButton.position = CGPoint(x: size.width / 2, y : newBoard.position.y - 60)
               addChild(titleButton)
    }
    
    
    
    
    override func didMove(to view: SKView){
        let board = Board(dimensions: 6, gameView: view, gameScene: self)
        
        self.backgroundColor = UIColor.black
        
        formatBoard(board: board)
        
        populateBoard(board: board)
    }
    
    
    func formatBoard(board: Board){
        var d = size.width * 0.05
        var margin = size.width * 0.1
        var sizeX = (size.width - 5 * d) / 6
        
        var incrementRow = margin * 1.6
        
        var positionY = (size.height - 4 * sizeX) / 2 + 3.5 * (d + sizeX)
        var positionX = margin
        
        for row in 0...5{
            
            for col in 0...5{
                board.board[row][col].size = CGSize(width: sizeX, height: sizeX)
                
                board.board[row][col].position = CGPoint(x: positionX, y: positionY)
                
                addChild(board.board[row][col])
                
                positionX = positionX + incrementRow
            }
            
            positionY = positionY - incrementRow
            
            positionX = margin
        }
    }
    
    
    func populateBoard(board: Board){
        // random integer generator
        let randomInt = Int.random(in: 1..<6)
        let colors: [String] = ["red", "blue"]
        
        // if integer generated is 4 or 5, generate 10 buttons
        if (randomInt == 4 || randomInt == 5){
            for _ in 0...10 {
                var validBoard = false
                
                while !validBoard {
                    var randomRow = Int.random(in: 0..<6)
                    var randomCol = Int.random(in: 0..<6)
                    
                    var randomColor = Int.random(in: 0..<2)
                    
                    board.board[randomRow][randomCol].changeButtonColor(desiredColor: colors[randomColor])
                    
                    board.board[randomRow][randomCol].changeUserAccess(permission: false)
                    
                    validBoard = board.validBoard(size: 6)
                      
                    
                      // if the given option was invalid, undo everything
                      if (validBoard == false){
                      board.board[randomRow][randomCol].changeButtonColor(desiredColor: "white")
                      board.board[randomRow][randomCol].changeUserAccess(permission: true)
                      }
                }
            }
        }
        
        else {
            for _ in 0...9 {
                var validBoard = false
                
                while !validBoard {
                    var randomRow = Int.random(in: 0..<6)
                    var randomCol = Int.random(in: 0..<6)
                    
                    var randomColor = Int.random(in: 0..<2)
                    
                    board.board[randomRow][randomCol].changeButtonColor(desiredColor: colors[randomColor])
                    
                    board.board[randomRow][randomCol].changeUserAccess(permission: false)
                    
                   validBoard = board.validBoard(size: 6)
                     
                   
                     // if the given option was invalid, undo everything
                     if (validBoard == false){
                     board.board[randomRow][randomCol].changeButtonColor(desiredColor: "white")
                     board.board[randomRow][randomCol].changeUserAccess(permission: true)
                     }
                }
            }
        }
    }
}
