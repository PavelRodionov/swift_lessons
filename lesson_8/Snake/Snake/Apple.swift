//
//  Apple.swift
//  Snake
//
//  Created by Pavel Rodionov on 13.02.2020.
//  Copyright © 2020 Pavel Rodionov. All rights reserved.
//

import UIKit
import SpriteKit

class Apple: SKShapeNode {
    let diameter = 10
    let line = 5
    let center = 5
    
    convenience init(position: CGPoint) {
        self.init()
        
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: diameter, height: diameter)).cgPath
        
        fillColor = UIColor.red
        
        strokeColor = UIColor.red
        
        lineWidth = CGFloat(line)
        
        self.position = position
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: CGFloat(diameter), center:CGPoint(x: center, y: center))
        self.physicsBody?.categoryBitMask = CollisionCategories.Apple
    }
}
