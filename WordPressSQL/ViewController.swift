//
//  ViewController.swift
//  WordPressSQL
//
//  Created by Sam Davis on 16/05/2016.
//  Copyright © 2016 SJDco. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var oldUrlField: NSTextField!
    @IBOutlet weak var newUrlField: NSTextField!
    @IBOutlet weak var prefixField: NSTextField!
    @IBOutlet var outputTextField: NSTextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func generateSQL(sender: AnyObject) {
        
        let mergeVariables = [
            "oldurl": oldUrlField.stringValue,
            "newurl": newUrlField.stringValue,
            "dbprefix": prefixField.stringValue
        ]
        
        let mergedTemplate = WordPressSQLManager.sharedManager.getMergedTemplate(mergeVariables)
        
        outputTextField.string = mergedTemplate
    }


}

