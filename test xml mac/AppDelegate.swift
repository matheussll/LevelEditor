//
//  AppDelegate.swift
//  test xml mac
//
//  Created by Matheus Stefanello Luz on 8/7/15.
//  Copyright (c) 2015 msl. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var secondWindow: GameViewController!


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let storyBoard = NSStoryboard(name: "Main", bundle: nil)
        self.secondWindow = storyBoard?.instantiateControllerWithIdentifier("GameController") as? GameViewController
        
        self.secondWindow.showWindow(secondWindow)
       //  self.secondWindow.window!.setContentSize(NSSize(width: 1334, height: 750))
        self.secondWindow.resignFirstResponder()
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

