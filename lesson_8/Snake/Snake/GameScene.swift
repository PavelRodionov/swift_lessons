//
//  GameScene.swift
//  Snake
//
//  Created by Pavel Rodionov on 13.02.2020.
//  Copyright © 2020 Pavel Rodionov. All rights reserved.
//

import SpriteKit
import GameplayKit

struct CollisionCategories{
    static let Snake :     UInt32 = 0x1 << 0
    static let SnakeHead : UInt32 = 0x1 << 1
    static let Apple:       UInt32 = 0x1 << 2
    static let EdgeBody:   UInt32 = 0x1 << 3
}

class GameScene: SKScene {
    
    var snake: Snake?
    var border: SKShapeNode = SKShapeNode()
    
    override func didMove(to view: SKView) {
        
        backgroundColor = SKColor.black
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)

        self.physicsBody?.allowsRotation = false
        
        view.showsPhysics = true

        self.physicsWorld.contactDelegate = self
        
        createCounterClockwiseButton(view)
        
        createClockwiseButton(view)
        
        createBorder(view)
        
        createApple()
        
        snake = Snake(atPoint: CGPoint(x: view.scene!.frame.midX, y: view.scene!.frame.midY))
        self.addChild(snake!)
    }
    
    
    func createClockwiseButton(_ view: SKView) {
        let clockwiseButton = SKShapeNode()
        clockwiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        clockwiseButton.position = CGPoint(x: view.scene!.frame.maxX-80, y: view.scene!.frame.minY+30)
        clockwiseButton.fillColor = UIColor.gray
        clockwiseButton.strokeColor = UIColor.gray
        clockwiseButton.lineWidth = 10
        clockwiseButton.name = "clockwiseButton"
        self.addChild(clockwiseButton)
    }
    
    func createCounterClockwiseButton(_ view: SKView) {
        let counterClockwiseButton = SKShapeNode()
        counterClockwiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        counterClockwiseButton.position = CGPoint(x: view.scene!.frame.minX+30, y: view.scene!.frame.minY+30)

        counterClockwiseButton.fillColor = UIColor.gray

        counterClockwiseButton.strokeColor = UIColor.gray
        counterClockwiseButton.lineWidth = 10
        counterClockwiseButton.name = "counterClockwiseButton"
        self.addChild(counterClockwiseButton)
    }
    
    func createBorder(_ view: SKView) {
        border = SKShapeNode()
        border.path = UIBezierPath(rect: CGRect(x: 0, y: 100, width: CGFloat((view.scene?.frame.width)!), height: CGFloat( (view.scene?.frame.height)! - 100))).cgPath
        border.position = CGPoint(x: 0, y: 0)
        border.strokeColor = UIColor.green
        border.lineWidth = 2
        border.name = "border"
        border.physicsBody = SKPhysicsBody(edgeLoopFrom: border.frame)
        border.physicsBody?.categoryBitMask = CollisionCategories.EdgeBody
        border.physicsBody?.collisionBitMask = CollisionCategories.Snake | CollisionCategories.SnakeHead
        self.addChild(border)
    }
    
    func createApple(){
        
        let randX  = CGFloat(arc4random_uniform(UInt32(border.frame.width - 5)) + 1)
        let randY  = CGFloat(arc4random_uniform(UInt32(border.frame.height - 5)) + 101)
        
        
        let apple = Apple(position: CGPoint(x: randX, y: randY))
        self.addChild(apple)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            
            guard let touchedNode = self.atPoint(touchLocation) as? SKShapeNode,
                touchedNode.name == "counterClockwiseButton" || touchedNode.name == "clockwiseButton" else {
                    return
            }
            
            touchedNode.fillColor = .green
            
            if touchedNode.name == "counterClockwiseButton" {
                snake!.moveCounterClockwise()
            } else if touchedNode.name == "clockwiseButton" {
                snake!.moveClockwise()
            }
        }
    }
    
   
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            
            guard let touchedNode = self.atPoint(touchLocation) as? SKShapeNode,
                touchedNode.name == "counterClockwiseButton" || touchedNode.name == "clockwiseButton" else {
                    return
            }
            touchedNode.fillColor = UIColor.gray
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        snake!.move()
    }
    
}

extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        
        let bodyes = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        let collisionObject = bodyes ^ CollisionCategories.SnakeHead
        let apple = contact.bodyA.node is Apple ? contact.bodyA.node : contact.bodyB.node
        
        switch collisionObject {
            case CollisionCategories.Apple:
                snake?.addBodyPart()
                apple?.removeFromParent()
                createApple()
            case CollisionCategories.Snake, CollisionCategories.EdgeBody:
                snake?.removeFromParent()
                snake = nil
                snake = Snake(atPoint: CGPoint(x: view!.scene!.frame.midX, y: view!.scene!.frame.midY))
                self.addChild(snake!)
            default:
                break
        }
    }
}
