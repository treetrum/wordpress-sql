//
//  WordPressSQLManager.swift
//  WordPressSQL
//
//  Created by Sam Davis on 16/05/2016.
//  Copyright © 2016 SJDco. All rights reserved.
//

import Foundation

class WordPressSQLManager {
    
    let fileLocation = NSBundle.mainBundle().pathForResource("sqlTemplate", ofType: "txt")!
    let sqlTemplateText: String?
    
    // This is a singleton, here's the shared resource
    static let sharedManager = WordPressSQLManager();
    
    // Private init method
    private init() {
        do {
            sqlTemplateText = try String(contentsOfFile: fileLocation)
        } catch {
            sqlTemplateText = nil
        }
    }
    
    // MARK: Instance Methods
    func getMergedTemplate(variables: [String: String]) -> String? {
        if var newTemplate = self.sqlTemplateText {
            
            // Insert our variables here...
            for (index, value) in variables {
                newTemplate = newTemplate.stringByReplacingOccurrencesOfString("{{\(index)}}", withString: value)
            }
            
            return newTemplate
            
        } else {
            return nil
        }
    }
    
    // MARK: Type Methods
    class func validateMergeVariableDictionary(variables: [String: String]) -> Bool {
        
        for (_, value) in variables {
            if value == "" {
                return false
            }
        }
        
        return true
        
    }
}