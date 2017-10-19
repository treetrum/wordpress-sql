//
//  ViewController.swift
//  WordPressSQL
//
//  Created by Sam Davis on 16/05/2016.
//  Copyright © 2016 SJDco. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    let defaultPlaceholderString = "Result..."
    let placeholderErrorMessage = "All fields required"
    
    @IBOutlet weak var oldUrlField: NSTextField!
    @IBOutlet weak var newUrlField: NSTextField!
    @IBOutlet weak var prefixField: NSTextField!
    @IBOutlet var outputTextField: NSTextView!
    @IBOutlet weak var resultPlaceholder: NSTextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        resultPlaceholder.placeholderString = defaultPlaceholderString;
    }
    
    @IBAction func generateSQL(sender: AnyObject) {
        
        let mergeVariables = [
            "oldurl": oldUrlField.stringValue,
            "newurl": newUrlField.stringValue,
            "dbprefix": prefixField.stringValue
        ]
        
        if WordPressSQLManager.validateMergeVariableDictionary(variables: mergeVariables) {
            
            // Display the merged template
            resultPlaceholder.placeholderString = "";
            let mergedTemplate = WordPressSQLManager.sharedManager.getMergedTemplate(variables: mergeVariables)
            outputTextField.string = mergedTemplate
            
        } else {
            
            NSBeep()
            resultPlaceholder.placeholderString = placeholderErrorMessage;
            outputTextField.string = "";
            
        }
        
    }


}

