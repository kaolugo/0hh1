//
//  board.swift
//  0hh1App
//
//  Created by Kaoru Murai on 1/23/20.
//  Copyright © 2020 Kaoru Murai. All rights reserved.
//

import SpriteKit
import UIKit
//import button.swift"

class Board : touched{
    //what a board must know:
    var solved: Bool //whether the board has been solved
    let dimension: Int //dimensions of the board
    var board = [[Button]]() //2 dimensional array of buttons. 2 dimensional array, of array, of buttons
    let view: SKView
    let scene: SKScene
    
    init(dimensions: Int, gameView: SKView, gameScene: SKScene){
        self.solved = false
        self.dimension = dimensions
        self.view = gameView
        self.scene = gameScene
        
      //populated 2D array board with buttons
        for _ in 0...(dimensions - 1){
            var row = [Button]()
            for c in 0...(dimensions - 1){
                row.append(Button(userAccess: true))
                row[c].delegate = self
            }
            board.append(row)
        }
    }
  
  //what a board must be able to do
  
  // TODO: decide which buttons are user unavailable and will be colored (pre populate the board)
  
  // TODO: check if board has been solved according to all rules
   
    func touchesBegan() {
        solved = self.boardHasBeenSolved(size: dimension)
        
        if (solved) {
            print("SOLVED")
            let scene = GameClear(size: self.scene.size)
            let transition = SKTransition.crossFade(withDuration: 1.5)
            view.presentScene(scene, transition: transition)
            //return true
        }
        //else {
            //return false
        //}
    }
    
    
  func boardHasBeenSolved (size : Int) -> Bool{
    var solved : Bool
    var index : Int
    
    index = 0
    solved = true
    
    //check if row or col has equal colors
    for _ in 0...(size - 1){
      if (self.rowHasEqualColors(size : size, row : index) == false){
        return false
      }
      if (self.colHasEqualColors(size: size, col: index) == false){
        return false
      }
      
      index += 1
    }
    
    var index1 : Int
    var index2 : Int
    
    index1 = 0
    index2 = 0
    
    //checks if cols and rows are different
    for _ in 0...(size - 1){
      for _ in 0...(size - 1){
        if (colsAreDifferent(size: size, col1: index1, col2: index2) == false){
          return false
        }
        
        if (rowsAreDifferent(size: size, row1: index1, row2: index2) == false){
          return false
        }
        
        index1 += 1
      }
      index1 = 0
      index2 += 1
    }
    
    //checks if col & row does not have three of the same color
    index = 0
    
    for _ in 0...(size - 1){
      if (self.rowHasNoThreesOfColor(size : size, row : index, color : "red") == false){
        return false
      }
      
      if (self.rowHasNoThreesOfColor(size : size, row : index, color : "blue") == false){
        return false
      }
      
      if (self.colHasNoThreesOfColor(size: size, col: index, color: "red") == false){
        return false
      }
      
      if (self.colHasNoThreesOfColor(size: size, col: index, color: "blue") == false){
        return false
      }
      
      index += 1
    }
    
    return true
    
  }
    
  
  func validBoard (size : Int) -> Bool {
    //checks if col & row does not have three of the same color
    var index = 0
    
    for _ in 0...(size - 1){
      if (self.rowHasNoThreesOfColor(size : size, row : index, color : "red") == false){
        return false
      }
      
      if (self.rowHasNoThreesOfColor(size : size, row : index, color : "blue") == false){
        return false
      }
      
      if (self.colHasNoThreesOfColor(size: size, col: index, color: "red") == false){
        return false
      }
      
      if (self.colHasNoThreesOfColor(size: size, col: index, color: "blue") == false){
        return false
      }
      
      index += 1
    }
    
    return true
  }
  
  

  //RULES of the game
  
  //checks if a full row has the same number of red & blue tiles
  
  func rowHasEqualColors(size : Int, row : Int) -> Bool {
    var redCount : Int
    var blueCount : Int
    var index : Int
    
    redCount = 0
    blueCount = 0
    index = 0

    
    for _ in 0...(size - 1){
      if (self.board[row][index].returnButtonColor() == "red"){
        redCount += 1
      }
      else if (self.board[row][index].returnButtonColor() == "blue"){
        blueCount += 1
      }
      else{
        return false
      }
      
      index += 1
    }
    
    if (redCount == blueCount){
      return true
    }
    else {
      return false
    }
  }
  
  
  // checks if a full col has the same number of red & blue tiles
  
  func colHasEqualColors(size : Int, col : Int) -> Bool {
    var redCount : Int
    var blueCount : Int
    var index : Int
    
    redCount = 0
    blueCount = 0
    index = 0

    
    for _ in 0...(size - 1){
      if (self.board[index][col].returnButtonColor() == "red"){
        redCount += 1
      }
      else if (self.board[index][col].returnButtonColor() == "blue"){
        blueCount += 1
      }
      else{
        return false
      }
      
      index += 1
    }
    
    if (redCount == blueCount){
      return true
    }
    else {
      return false
    }
  }
  
  //no two cols can be the same
  
  func colsAreDifferent(size : Int, col1 : Int, col2 : Int) -> Bool{
    var counter : Int
    var index : Int
    
    counter = 0
    index = 0
    
    if (col1 == col2){
      return true
    }
    
    for _ in 0...(size - 1){
      if (board[index][col1].returnButtonColor() == "white"||board[index][col2].returnButtonColor() == "white"){
        return true
      }
      else if (board[index][col1].returnButtonColor() == board[index][col2].returnButtonColor()){
        counter += 1
      }
      
      index += 1
    }
    
    if (counter == size){
      return false
    }
    else {
      return true
    }
  }

  
  // no two rows can be the same
  
  func rowsAreDifferent (size : Int, row1 : Int, row2 : Int) -> Bool{
    var counter : Int
    var index : Int
    
    counter = 0
    index = 0
    
    if (row1 == row2){
      return true
    }
    
    for _ in 0...(size - 1){
      if (board[row1][index].returnButtonColor() == "white" || board[row2][index].returnButtonColor() == "white"){
        return true;
      }
      else if (board[row1][index].returnButtonColor() == board[row2][index].returnButtonColor()){
        counter += 1
      }
      
      index += 1
    }
    
    if (counter == size){
      return false
    }
    else{
      return true
    }
  }
  
  
  // col does not have three of same color
  
  func colHasNoThreesOfColor(size : Int, col : Int, color : String) -> Bool{
    var counter : Int
    var reverseCounterActive : Bool
    var index : Int
    
    counter = 0
    reverseCounterActive = false
    index = 0
    
    for _ in 0...(size - 1){
      if (self.board[index][col].returnButtonColor() == color){
        counter += 1
      }
      else if (self.board[index][col].returnButtonColor() != color){
        reverseCounterActive = true
      }
      
      if (reverseCounterActive == false && counter >= 3){
        return false
      }
      else if (reverseCounterActive == true){
        counter = 0
        reverseCounterActive = false
      }
      
      index += 1
    }
    
    return true
  }
  
  
  // row does not have three of same color
  
  func rowHasNoThreesOfColor(size : Int, row : Int, color : String) -> Bool{
    var counter : Int
    var reverseCounterActive : Bool
    var index : Int
    //let blue : String
    //let red : String
    
    //blue = "blue"
    //red = "red"
    
    counter = 0
    reverseCounterActive = false
    index = 0
    
    for _ in 0...(size - 1){
      if (self.board[row][index].returnButtonColor() == color){
        counter += 1
      }
      else if (self.board[row][index].returnButtonColor() != color){
        reverseCounterActive = true
      }
      
      if (reverseCounterActive == false && counter >= 3){
        return false
      }
      else if (reverseCounterActive == true){
        counter = 0
        reverseCounterActive = false
      }
      index += 1
    }
    
    return true
  }
  

}
