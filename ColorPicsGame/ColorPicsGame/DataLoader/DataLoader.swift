//
//  DataLoader.swift
//  ColorPicsGame
//
//  Created by Rost on 11/28/18.
//  Copyright © 2018 Rost Gress. All rights reserved.
//

import Foundation


class DataLoader {
    
    static func loadData(with completion: ((_ response: AnyObject) -> Void)?) {
        if let path = Bundle.main.path(forResource: "array", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let numsArray = jsonResult["array"] as? [[Int]] {
                    completion!(numsArray as AnyObject)
                }
            } catch {
                // handle error
            }
        }
    }
}
