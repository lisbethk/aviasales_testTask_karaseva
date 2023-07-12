//
//  DataParser.swift
//  aviasales_testTask_karaseva
//
//  Created by Lisbeth Karasev on 12.07.2023.
//

import Foundation

protocol DataParserProtocol {
    func parse<T: Decodable>(data: Data) throws -> T
}

extension JSONDecoder: DataParserProtocol {
    func parse<T: Decodable>(data: Data) throws -> T {
        try decode(T.self, from: data)
    }
}
