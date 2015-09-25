//
//  GameScene.swift
//  test xml mac
//
//  Created by Matheus Stefanello Luz on 8/7/15.
//  Copyright (c) 2015 msl. All rights reserved.
//

import Cocoa
import SpriteKit

class GameScene: SKScene {
    var selectedNode = SKNode()

    override func didMoveToView(view: SKView) {
        self.backgroundColor = SKColor.whiteColor()
        let bgImage = CustomSprite(imageNamed: "fundo.png")
        bgImage.name = "bg"
        bgImage.size = self.scene!.size
        bgImage.position = CGPointMake(self.size.width/2, self.size.height/2)
        self.addChild(bgImage)
    }
    
    func createRobot() {
        let sprite = CustomSprite(imageNamed:"heroi.png")
        Util.positionateSprite(sprite, toFitPosition: .DownCenter, withMaxSize: self.view!.bounds.size, YAxisOffset: 0, XAxisOffset: 0)
        sprite.setScale(1)
        sprite.name = "robot"
        sprite.rot = 0.0
        sprite.scal = 0.5
        sprite.setScale(0.5)
        sprite.stat = false
        self.addChild(sprite)
    }

    func createRobotFromTxt(x: NSString, y: NSString) {
        let sprite = CustomSprite(imageNamed:"heroi.png")
        sprite.position.x = CGFloat(x.floatValue)
        sprite.position.y = CGFloat(y.floatValue)
        sprite.name = "robot"
        sprite.rot = 0.0
        sprite.scal = 0.5
        sprite.setScale(0.5)
        sprite.stat = false
        self.addChild(sprite)
    }
    
    func createStarFromTxt(x: NSString, y: NSString) {
        let sprite = CustomSprite(imageNamed:"geladeira.png")
        sprite.position.x = CGFloat(x.floatValue)
        sprite.position.y = CGFloat(y.floatValue)
        sprite.name = "star"
        sprite.rot = 0.0
        sprite.scal = 0.5
        sprite.setScale(0.5)
        sprite.stat = false
        self.addChild(sprite)
    }

    func createWall(image: String) {
        let sprite = CustomSprite(imageNamed:image)
        Util.positionateSprite(sprite, toFitPosition: .UpCenter, withMaxSize: self.view!.bounds.size, YAxisOffset: 0, XAxisOffset: 0)
        sprite.setScale(1)
        sprite.name = "wall"
        sprite.image = image
        sprite.rot = 0.0
        sprite.setScale(0.5)
        sprite.stat = true
        sprite.scal = 0.5
        self.addChild(sprite)
    }
    


    func createWallFromTxt(image: String, x:NSString,y: NSString) {
        let sprite = CustomSprite(imageNamed:image)
        sprite.setScale(1)
        sprite.position.x = CGFloat(x.floatValue)
        sprite.position.y = CGFloat(y.floatValue)
        sprite.name = "wall"
        sprite.image = image
        sprite.rot = 0.0
        sprite.setScale(0.5)
        sprite.stat = true
        sprite.scal = 0.5
        self.addChild(sprite)
    }
    
    func createStar() {
        let sprite = CustomSprite(imageNamed:"geladeira.png")
        Util.positionateSprite(sprite, toFitPosition: .UpCenter, withMaxSize: self.view!.bounds.size, YAxisOffset: 0, XAxisOffset: 0)
        sprite.name = "star"
        sprite.rot = 0.0
        sprite.stat = false
        sprite.scal = 0.5
        sprite.setScale(0.5)


        self.addChild(sprite)
        
    }

    override func mouseDragged(theEvent: NSEvent) {
        let node = self.nodeAtPoint(theEvent.locationInNode(self))
        if node != self {
            let c = self.nodeAtPoint(theEvent.locationInNode(self)) as! CustomSprite
            if c.name != "bg" {
                node.position = theEvent.locationInNode(self)
            }
        }
    }
    
    override func mouseDown(theEvent: NSEvent) {
        selectedNode = self.nodeAtPoint(theEvent.locationInNode(self))
        for (_, obj) in self.children.enumerate(){
            let node = obj 
            node.alpha = 1.0
        }
        if self.nodeAtPoint(theEvent.locationInNode(self)) != self {
            let c = self.nodeAtPoint(theEvent.locationInNode(self)) as! CustomSprite
            if c.name != "bg" {
                self.nodeAtPoint(theEvent.locationInNode(self)).alpha = 0.5
            }
        }
    }
    
    func rotateRobot(angle: CGFloat) {
        var a = Float()
        for child in self.children {
            if child is CustomSprite {
                if child.name != "bg" {
                    if child == selectedNode {
                        let c = child as! CustomSprite
                        if angle == 1.0 {
                            a = Float(M_PI)/2
                            c.rot = a
                        }
                        else if angle == 2.0 {
                            a = Float(M_PI)
                            c.rot = a
                        }
                        else if angle == 3.0 {
                            a = 3*Float(M_PI)/2
                            c.rot = a
                        }
                        else {
                            c.rot = a
                        }
                        
                        let action = SKAction.rotateToAngle(CGFloat(a), duration: 0.5)
                        child.runAction(action)
                    }
                }
            }
        }
    }

    func resize(size: CGFloat) {
        let value = size/100
        for child in self.children {
            if child is CustomSprite {
                if child.name != "bg" {
                    if child == selectedNode {
                        let c = child as! CustomSprite
                        c.setScale(value)
                        c.scal = Float(value)
                        
                    }
                }
            }
        }
        
    }
    
    func returnAll() {
        let array = [] as NSMutableArray
        for (_, obj) in self.children.enumerate(){
            let node = obj as! CustomSprite
            let a = [node.name!,[node.position.x.description,node.position.y.description,node.rot.description]]
            array.addObject(a)
        }
        let json = JSON(array)
        let str = json.description
        _ = str.dataUsingEncoding(NSUTF8StringEncoding)!
        print(json)
        

    }
    
    func deleteObject() {
        _ = Float()
        for child in self.children {
            if child is CustomSprite {
                if child == selectedNode {
                        child.removeFromParent()
                }
            }
        }

        
    }
    func readJson(levelName: String) {
        var test = self.view!.bounds.size
        var array = [] as NSMutableArray
        for (i, obj) in self.children.enumerate(){
            var node = obj as! CustomSprite
            if node.name != "bg" {
                let a = ["class" : node.name!,"xpos" : node.position.x.description,"ypos" : node.position.y.description,"rotation" : node.rot.description, "scale": node.scal.description, "static":node.stat.description,"width":node.size.width.description,"height":node.size.height.description,"image":node.image]
                array.addObject(a)
            }
        }
        let json = JSON(array)
        
        let receivedObjects = [] as NSMutableArray
        for i in 0..<json.count {
            let objClass = json[i]["class"].string!
            let objX = json[i]["xpos"].string!
            let objY = json[i]["ypos"].string!
            let objRot = json[i]["rotation"].string!
            let objScale = json[i]["scale"].string!
            let objStatic = json[i]["static"].string!
            let image = json[i]["image"].string!
            let aux = ["class" : objClass, "xpos" : objX, "ypos" : objY, "rotation" : objRot, "scale": objScale, "static": objStatic, "image": image]
            receivedObjects.addObject(aux)
        }
        
        print (receivedObjects)
        let lName = levelName + ".txt"
        
        do {
            let encryptedData:NSData = try json.rawData()
            let path = NSHomeDirectory() + "/Documents/" + lName
            if  let text2 = try? String(contentsOfFile: path, encoding: NSUTF8StringEncoding){
                print(text2)
            }
        } catch _ {
        }
        
        
    }
    
    func importLevel (levelName: String) {
        
        for child in self.children {
            if child.name != "bg" {
                child.removeFromParent()
            }
        }

        let path1 = NSHomeDirectory() + "/Documents/" + levelName + ".txt"
        let data = NSData(contentsOfFile:path1)
        let json = JSON(data: data!)
        
        for i in 0..<json.count {
            let objClass = json[i]["class"].string!
            let objX = json[i]["xpos"].string!
            let objY = json[i]["ypos"].string!
            let image = json[i]["image"].string!
            
            switch objClass {
                case "robot": createRobotFromTxt(objX as NSString,y: objY as NSString)
                break
                case "star": createStarFromTxt(objX as NSString,y: objY as NSString)
                break
                default :  createWallFromTxt(image,x: objX as NSString,y: objY as NSString)
                break

            }

            
        }
    }
}
