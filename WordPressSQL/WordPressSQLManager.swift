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
    
    static let sharedManager = WordPressSQLManager();
    
    init() {
        do {
            sqlTemplateText = try String(contentsOfFile: fileLocation)
        } catch {
            sqlTemplateText = nil
        }
    }
    
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
}