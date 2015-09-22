//
//  GameView.swift
//  test xml mac
//
//  Created by Matheus Stefanello Luz on 8/7/15.
//  Copyright (c) 2015 msl. All rights reserved.
//

import Cocoa
import SpriteKit

class GameView: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        let skview = self.view as! SKView
        skview.showsFPS = true
        skview.showsNodeCount = true
        
        let scene = GameScene(size:skview.bounds.size)
        print(skview.bounds.size)
        scene.scaleMode = .AspectFill
        skview.presentScene(scene)
    }
    
}
