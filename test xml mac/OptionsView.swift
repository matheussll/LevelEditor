//
//  OptionsView.swift
//  test xml mac
//
//  Created by Matheus Stefanello Luz on 8/7/15.
//  Copyright (c) 2015 msl. All rights reserved.
//

import Cocoa
import SpriteKit

class OptionsView: NSViewController {

    @IBOutlet weak var orientationSelector: NSComboBox!
    @IBOutlet weak var staticCheck: NSButton!
    @IBOutlet weak var importName: NSTextField!
    @IBOutlet weak var levelName: NSTextField!
    @IBOutlet weak var itemSelector: NSComboBox!
    @IBOutlet weak var sliderAmount: NSTextField!
    @IBOutlet weak var sliderSize: NSTextField!
    var rotation: Float = 0
    var json = JSON(NSNull())
    var cena: GameScene {
    let appDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
    let secondWindow = appDelegate.secondWindow.contentViewController as! GameView
    let wind = secondWindow.view as! SKView
    return wind.scene as! GameScene
    }
    var cont: GameView {
        let appDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
        return appDelegate.secondWindow.contentViewController as! GameView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let items = ["Amarelo","Azul","Bigode","Laranja","Marrom","Roxo","Verde","Vermelho"]
        let sides = ["Baixo", "Direita", "Cima", "Esquerda"]
        itemSelector.removeAllItems()
        itemSelector.addItemsWithObjectValues(items)
        orientationSelector.removeAllItems()
        orientationSelector.addItemsWithObjectValues(sides)
    }
    
    override var representedObject: AnyObject? {
        didSet {
        }
    }
    @IBAction func createWall(sender: NSButton) {
        let index = itemSelector.indexOfSelectedItem
        
        switch (index) {
            case 0: cena.createWall("amarelo.png",stat: staticCheck.state)
                break
            case 1: cena.createWall("azul.png",stat: staticCheck.state)
                break
            case 2: cena.createWall("bigodudo.png",stat: staticCheck.state)
                break
            case 3: cena.createWall("laranja.png",stat: staticCheck.state)
                break
            case 4: cena.createWall("marrom.png",stat: staticCheck.state)
                break
            case 5: cena.createWall("roxo.png",stat: staticCheck.state)
                break
            case 6: cena.createWall("verde.png",stat: staticCheck.state)
                break
            case 7: cena.createWall("vermelho.png",stat: staticCheck.state)
                break
            default: break


        }
        
    }

    @IBAction func proximitySensor(sender: NSButton) {
        cont.toggleProximitySensor()
    }
    @IBAction func createRobot(sender: NSButton) {
        let index = orientationSelector.indexOfSelectedItem
        switch (index) {
            case 0: cena.createRobot(0.0)
                    break
            case 1: cena.createRobot(M_PI/2)
                break
            case 2: cena.createRobot(M_PI)
                break
            case 3: cena.createRobot(3*M_PI/2)
                break
            default: cena.createRobot(0.0)
                break
            
        }
    }

    @IBAction func exportLevel(sender: NSButton) {
        print("test")
        if levelName.stringValue != "" {
            cena.exportLevel(levelName.stringValue)
        }
    }
    @IBAction func deleteObj(sender: NSButton) {
        cena.deleteObject()
    }
    @IBAction func createStar(sender: NSButton) {
        cena.createStar()
    }
    @IBAction func importLevel(sender: NSButton) {
        if importName.stringValue != "" {
            cena.importLevel(importName.stringValue)
        }
    }
    
    @IBAction func changeSize(sender: NSSlider) {
        let amount = sender.stringValue as NSString
        let size = amount.floatValue
        cena.resize(CGFloat(size))
        sliderSize.stringValue = amount.intValue.description as String + " %"
    }
    
    
    
}
