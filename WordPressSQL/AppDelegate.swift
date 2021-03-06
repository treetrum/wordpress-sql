//
//  AppDelegate.swift
//  WordPressSQL
//
//  Created by Sam Davis on 16/05/2016.
//  Copyright © 2016 SJDco. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
    
    @IBAction func openSJDCo(sender: AnyObject) {
        NSWorkspace.shared.open(NSURL(string: "http://sjd.co")! as URL)
    }
    
}

