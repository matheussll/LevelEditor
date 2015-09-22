//
//  Util.swift
//  
//
//  Created by Nicolas Nascimento on 24/07/15.
//
//

import SpriteKit

enum PositionInScene{
    case LeftCenter
    case RightCenter
    case UpCenter
    case DownCenter
    case UpperLeft
    case UpperRight
    case DownLeft
    case DownRight
    case Middle
}

class Util: NSObject {
    
    class func resizeSprite(sprite: SKSpriteNode, toFitHeight height: CGFloat) {
        let aspectRatio = sprite.size.width/sprite.size.height
        sprite.size.height = height
        sprite.size.width = height * aspectRatio
    }
    class func resizeSprite(sprite: SKSpriteNode, toFitWidth width: CGFloat) {
        let aspectRatio = sprite.size.height/sprite.size.width
        sprite.size.width = width
        sprite.size.height = width * aspectRatio
    }
    class func positionateSprite(sprite: SKSpriteNode, toFitPosition position: PositionInScene, withMaxSize size: CGSize, YAxisOffset: CGFloat = 0, XAxisOffset: CGFloat = 0) {
        // X Axis
        let minX = sprite.size.width/2 + XAxisOffset
        let midX = (size.width)/2
        let maxX = size.width - (sprite.size.width/2  + XAxisOffset)
        // Y Axis
        let minY = sprite.size.height/2 + YAxisOffset
        let midY = (size.height)/2
        let maxY = size.height - (sprite.size.height/2  + YAxisOffset)
        
        switch(position){
        case .LeftCenter:
            sprite.position = CGPoint(x: minX, y: midY)
        case .RightCenter:
            sprite.position = CGPoint(x: maxX, y: midY)
        case .UpCenter:
            sprite.position = CGPoint(x: midX, y: maxY)
        case .DownCenter:
            sprite.position = CGPoint(x: midX, y: minY)
        case .UpperLeft:
            sprite.position = CGPoint(x: minX, y: maxY)
        case .UpperRight:
            sprite.position = CGPoint(x: maxX, y: maxY)
        case .DownLeft:
            sprite.position = CGPoint(x: minX, y: minY)
        case .DownRight:
            sprite.position = CGPoint(x: maxX, y: maxY)
        case .Middle:
            sprite.position = CGPoint(x: midX, y: midY)
        }
    }
    class func resizeLabel(label: SKLabelNode, ToFitHeight height: CGFloat, andWidth width: CGFloat) -> SKLabelNode {
        while( label.frame.size.height > height || label.frame.size.width > width ) {
            label.fontSize *= 0.9
        }
        return label
    }
}
// Useful extensions
extension SKShapeNode{
    func createPhysicsBodyForSelfWithCategory(category: UInt32, contactCategory: UInt32, collisionCategory: UInt32, dynamic: Bool = false, affectedByGravity: Bool = true) {
        if let pB = self.physicsBody{
            var newBody =  SKPhysicsBody(polygonFromPath: self.path!)
            newBody.dynamic = dynamic
            newBody.categoryBitMask = category
            newBody.collisionBitMask = collisionCategory
            newBody.contactTestBitMask = contactCategory
            newBody.velocity = pB.velocity
            newBody.affectedByGravity = affectedByGravity
            self.physicsBody = newBody
        }else{
            self.physicsBody = SKPhysicsBody(polygonFromPath: self.path!)
            if let pB = self.physicsBody {
                pB.dynamic = dynamic
                pB.categoryBitMask = category
                pB.collisionBitMask = collisionCategory
                pB.contactTestBitMask = contactCategory
                pB.affectedByGravity = affectedByGravity
            }
        }
    }
}
extension SKSpriteNode {
    func createPhysicsBodyForSelfWithCategory(category: UInt32, contactCategory: UInt32, collisionCategory: UInt32) {
        if let body = self.physicsBody {
            body.categoryBitMask = category
            body.contactTestBitMask = contactCategory
            body.collisionBitMask = collisionCategory
        } else {
            let body = SKPhysicsBody(texture: self.texture!, size: self.size)
            body.categoryBitMask = category
            body.contactTestBitMask = contactCategory
            body.collisionBitMask = collisionCategory
            body.dynamic = true
            body.mass = 1
            body.affectedByGravity = false
            self.physicsBody = body
        }
    }
}