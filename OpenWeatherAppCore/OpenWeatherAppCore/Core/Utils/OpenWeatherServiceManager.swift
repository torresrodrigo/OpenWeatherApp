//
//  OpenWeatherServiceManager.swift
//  OpenWeatherAppCore
//
//  Created by Rodrigo Torres on 02/07/2023.
//

import Foundation

public protocol OpenWeatherServiceManagerType {
    func getValue(key: String) -> String
}

public class OpenWeatherServiceManager: OpenWeatherServiceManagerType {
    public static let shared = OpenWeatherServiceManager()
    
    public init() {
        
    }
    
    func getFileName() -> String {
        return "OpenWeatherConfiguration"
    }
    
    private func getDictionary() -> [String: String] {
        let bundle = Bundle(for: type(of: self))
        let filenameConfigutraiton: String = getFileName()
        
        guard let subPath = bundle.path(forResource: filenameConfigutraiton, ofType: "plist"),
              let dictionary = NSDictionary(contentsOfFile: subPath) as? [String: String] else {
            return [:]
        }
        return dictionary
    }
    
    public func getValue(key: String) -> String {
        let dictionary: [String: String] = getDictionary()
        return dictionary[key] ?? ""
    }
}
