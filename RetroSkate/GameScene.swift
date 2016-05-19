//
//  GameScene.swift
//  RetroSkate
//
//  Created by Kayla Brooks on 5/13/16.
//  Copyright (c) 2016 Robert Brooks. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let ASP_PIECES = 15
    let GROUND_SPEED: CGFloat = -8.5
    let GROUND_X_RESET: CGFloat = -150
    var asphaltPieces = [SKSpriteNode]()
    var moveGroundAction: SKAction!
    var moveGroundActionForever: SKAction!
    
    override func didMoveToView(view: SKView) {
       setupBackground()
        setupGround()
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        groundMovement()
    }
    
    func setupBackground() {
        let bg = SKSpriteNode(imageNamed: "bg1")
        bg.position = CGPointMake(517, 400)
        bg.zPosition = 3
        self.addChild(bg)
        
        let bg2 = SKSpriteNode(imageNamed: "bg2")
        bg2.position = CGPointMake(517, 450)
        bg2.zPosition = 2
        self.addChild(bg2)
        
        let bg3 = SKSpriteNode(imageNamed: "bg3")
        bg3.position = CGPointMake(517, 500)
        bg3.zPosition = 1
        self.addChild(bg3)
    }
    
    func setupGround() {
        
        moveGroundAction = SKAction.moveByX(GROUND_SPEED, y: 0, duration: 0.02)
        moveGroundActionForever = SKAction.repeatActionForever(moveGroundAction)
        
        for var x = 0; x < ASP_PIECES; x++ {
            let asp = SKSpriteNode(imageNamed: "asphalt")
            asphaltPieces.append(asp)
            
            if x == 0 {
                let start = CGPointMake(0, 144)
                asp.position = start
            }
            else {
                asp.position = CGPointMake(asp.size.width + asphaltPieces[x - 1].position.x, asphaltPieces[x - 1].position.y)
            }
            
            asp.runAction(moveGroundActionForever)
            self.addChild(asp)
        }
        
    }
    
    func groundMovement() {
        
        for var x = 0; x < asphaltPieces.count; x++ {
            
            if asphaltPieces[x].position.x <= GROUND_X_RESET {
                var index: Int!
                
                if x == 0 {
                    index = asphaltPieces.count - 1
                }
                else {
                    index = x - 1
                }
                
                let newPos = CGPointMake(asphaltPieces[index].position.x + asphaltPieces[x].size.width, asphaltPieces[x].position.y)
                
                asphaltPieces[x].position = newPos
            }
        }
    }
}








