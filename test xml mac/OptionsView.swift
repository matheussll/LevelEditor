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

    @IBOutlet weak var levelName: NSTextField!
    @IBOutlet weak var itemSelector: NSComboBox!
    @IBOutlet weak var sliderAmount: NSTextField!
    @IBOutlet weak var sliderSize: NSTextField!
    var rotation: Float = 0
    var json = JSON(NSNull())
    var cena: GameScene {
    var appDelegate = NSApplication.sharedApplication().delegate as! AppDelegate
    let secondWindow = appDelegate.secondWindow.contentViewController as! GameView
    let wind = secondWindow.view as! SKView
    return wind.scene as! GameScene
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var items = ["Amarelo","Azul","Bigode","Laranja","Marrom","Roxo","Verde","Vermelho"]
        itemSelector.removeAllItems()
        itemSelector.addItemsWithObjectValues(items)
               // Do view setup here.
    }
    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    @IBAction func createWall(sender: NSButton) {
        let index = itemSelector.indexOfSelectedItem
        
        switch (index) {
            case 0: cena.createWall("amarelo.png")
                break
            case 1: cena.createWall("azul.png")
                break
            case 2: cena.createWall("bigodudo.png")
                break
            case 3: cena.createWall("laranja.png")
                break
            case 4: cena.createWall("marrom.png")
                break
            case 5: cena.createWall("roxo.png")
                break
            case 6: cena.createWall("verde.png")
                break
            case 7: cena.createWall("vermelho.png")
                break
            default: break


        }
        
    }

    @IBAction func createRobot(sender: NSButton) {
        
        cena.createRobot()
    }
//    @IBAction func createStaticVertical(sender: NSButton) {
//        cena.createStaticVertical()
//    }
//    
//    @IBAction func createStaticHorizontal(sender: NSButton) {
//        cena.createStaticHorizontal()
//
//    }
//    @IBAction func createVertical(sender: NSButton) {
//        cena.createVertical()
//    }
//    
//    @IBAction func createHorizontal(sender: NSButton) {
//        cena.createHorizontal()
//    }
    @IBAction func readJson(sender: NSButton) {
        if levelName.stringValue != "" {
            cena.readJson(levelName.stringValue)
        }
    }
    @IBAction func deleteObj(sender: NSButton) {
        cena.deleteObject()
    }
    @IBAction func createStar(sender: NSButton) {
        cena.createStar()
    }
//    @IBAction func sliderChanged(sender: NSSlider) {
//        var amount = sender.stringValue as NSString
//        self.rotation = amount.floatValue
//        if self.rotation == 1.0 {
//            sliderAmount.stringValue = "pi/2"
//        }
//        else if self.rotation == 2.0 {
//            sliderAmount.stringValue = "pi"
//        }
//        else if self.rotation == 3.0 {
//            sliderAmount.stringValue = "3pi/2"
//        }
//        else {
//            sliderAmount.stringValue = "2pi or 0"
//        }
//
//        cena.rotateRobot(CGFloat(rotation))
//    }
    
    @IBAction func changeSize(sender: NSSlider) {
        var amount = sender.stringValue as NSString
        let size = amount.floatValue
        cena.resize(CGFloat(size))
        sliderSize.stringValue = amount.intValue.description as String + " %"
    }
    
    
    
}
