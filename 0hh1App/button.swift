//
//  button.swift
//  0hh1App
//
//  Created by Kaoru Murai on 1/20/20.
//  Copyright © 2020 Kaoru Murai. All rights reserved.
//

import SpriteKit
import UIKit

class Button: SKSpriteNode {

    
    //facts that a button must know
    var buttonColor: String //its' own color
    var userAccess: Bool //user accessibility
    //var touched: Bool //whether it has been pressed we don't really need this
    var count: Int
    //also the delegate
    var delegate : touched?

    
    init(userAccess: Bool){
        let texture = SKTexture(imageNamed: "tile")
        //let brightRed = UIColor(displayP3Red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
        let white = UIColor.white
        
        self.userAccess = userAccess
        self.buttonColor = "white"
        //self.touched = false
        self.count = 0

        
        super.init(texture: texture, color: white, size: texture.size())
        
        
        self.isUserInteractionEnabled = true
        
        self.color = UIColor.red
        //self.position = CGPoint(x: 100, y: 100)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //things that a button must be able to do
    //change color when touched
    //know when it is pressed --- Nodes already can do this it is built in
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.colorBlendFactor = 1.0
        if userAccess == true { //button color only changes when button is user accessible
            if (count == 0){
                self.color = .blue //make the button blue
                count += 1 //increment the number of times the button has been tapped
                self.buttonColor = "blue"
            }
            else if (count == 1){
                self.color = .red //make the button red
                count += 1
                self.buttonColor = "red"
            }
            else if (count == 2){
                self.color = .white //make the button white
                count = 0 //reset the counter
                self.buttonColor = "white"
            }
        }
        
        // locked button effect
        
        else {
           // TODO
            //let play = SKAction.playSoundFileNamed("lockSound.mp3", waitForCompletion: false)
            //let volume = SKAction.changeVolume(to: 0.1, duration: 0)
            //let group = SKAction.group([play, volume])
            //run(group)
            self.run(SKAction.playSoundFileNamed("lockSound.mp3", waitForCompletion: false))
            run(SKAction.sequence([SKAction.run(appearLock), SKAction.wait(forDuration: 0.5), SKAction.run(disappearLock)]))
        }
        

        delegate!.touchesBegan()

    
    }
    
    
    
    func appearLock() {
        self.texture = SKTexture(imageNamed: "whiteLock")
        self.color = .white
    }
    
    func disappearLock(){
        //lock.removeFromParent()
        self.texture = SKTexture(imageNamed: "tile")
        if (buttonColor == "red"){
            self.color = .red
        }
        else {
            self.color = .blue
        }
    }
    
    
    func returnButtonColor(/*button : Button*/) -> String {
        return self.buttonColor
    }
    
    
    func changeButtonColor(/*button : Button, */desiredColor : String) {
        //make sure the desired color is a valid color
        assert(desiredColor == "red" || desiredColor == "blue" || desiredColor == "white", "error: enter a valid color")
        
        self.colorBlendFactor = 1.0
        
        //rename the button's color
        self.buttonColor = desiredColor
        
        //change the outward appearance of the button
        if (desiredColor == "white"){
            self.color = .white
        }
        else if (desiredColor == "blue"){
            self.color = .blue
        }
        else {
            self.color = .red
        }
    }
    
    
    func changeUserAccess(/*button : Button, */permission : Bool){
        if (permission == true){
            self.userAccess = true
        }
        else {
            self.userAccess = false
        }
    }
}
