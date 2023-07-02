//
//  MockAPIClient.swift
//  OpenWeatherNetwork
//
//  Created by Rodrigo Torres on 28/06/2023.
//

public protocol Mockable: AnyObject {
    var bundle: Bundle { get }
}

extension Mockable {
    
    public var bundle: Bundle {
        return Bundle(for: type(of: self))
    }
    
    func loadJSON<T: Decodable>(filename: String, type: T.Type) -> T {
        guard let path = bundle.url(forResource: filename, withExtension: "json") else {
            fatalError("Failed to load JSON")
        }
        
        do {
            let data = try Data(contentsOf: path)
            let decodedObject = try JSONDecoder().decode(type, from: data)
            return decodedObject
        } catch {
            fatalError("Failed to decode loaded JSON")
        }
    }
    
}
