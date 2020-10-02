//
//  CoreSound.swift
//  Radio Automne
//
//  Created by Aydar Nasibullin on 02.10.2020.
//  Copyright © 2020 Fetch Development. All rights reserved.
//

import Foundation
import AudioToolbox

class AutomneCore {
    private static let url = Bundle.main.url(forResource: "GetVolume", withExtension: "scpt")
    private static var error: NSDictionary?
    public static func getSystemVolume() -> Int{
        if let scriptObject = NSAppleScript(contentsOf: url!, error: &error) {
            if let outputString = scriptObject.executeAndReturnError(&error).stringValue {
                return Int(outputString) ?? -1
            } else if (error != nil) {
                print("ERROR8: ", error!)
                return -1
            }
        }
        return -1
    }
}
