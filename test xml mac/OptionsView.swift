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
        var items = ["Amarelo","Azul","Bigode","Brabo","Lua","Nerd","Operario","Patricinha", "Triangulo", "Vampiro", "Verde"]
        sliderAmount.stringValue = "2pi or 0"
        sliderSize.stringValue = "100 %"
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
            case 0: cena.createWall("amarelo")
                break
            case 1: cena.createWall("azul")
                break
            case 2: cena.createWall("bigode")
                break
            case 3: cena.createWall("brabo")
                break
            case 4: cena.createWall("lua")
                break
            case 5: cena.createWall("nerd")
                break
            case 6: cena.createWall("operario")
                break
            case 7: cena.createWall("patricinha")
                break
            case 8: cena.createWall("triangulo")
                break
            case 9: cena.createWall("vampiro")
                break
            case 10: cena.createWall("verde")
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
        println("djisadjasdas")
        cena.readJson()
    }
    @IBAction func deleteObj(sender: NSButton) {
        cena.deleteObject()
    }
    @IBAction func createStar(sender: NSButton) {
        cena.createStar()
    }
    @IBAction func sliderChanged(sender: NSSlider) {
        var amount = sender.stringValue as NSString
        self.rotation = amount.floatValue
        if self.rotation == 1.0 {
            sliderAmount.stringValue = "pi/2"
        }
        else if self.rotation == 2.0 {
            sliderAmount.stringValue = "pi"
        }
        else if self.rotation == 3.0 {
            sliderAmount.stringValue = "3pi/2"
        }
        else {
            sliderAmount.stringValue = "2pi or 0"
        }

        cena.rotateRobot(CGFloat(rotation))
    }
    
    @IBAction func changeSize(sender: NSSlider) {
        var amount = sender.stringValue as NSString
        let size = amount.floatValue
        cena.resize(CGFloat(size))
        sliderSize.stringValue = amount.intValue.description as String + " %"
    }
    
    
    
}
