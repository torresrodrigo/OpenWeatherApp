//
//  APIError.swift
//  OpenWeatherNetwork
//
//  Created by Rodrigo Torres on 28/06/2023.
//

struct APIError: Error {
    
    let errorCode: String
    var message: String
    
    init(errorCode: String, message: String) {
        self.errorCode = errorCode
        self.message = message
    }
    
    var errorCodeNumber: String {
        let numberString = errorCode.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        return numberString
    }
    
    private enum CodingKeys: String, CodingKey {
        case errorCode
        case message
    }
}


extension APIError: Decodable {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        errorCode = try container.decode(String.self, forKey: .errorCode)
        message = try container.decode(String.self, forKey: .message)
    }
}
