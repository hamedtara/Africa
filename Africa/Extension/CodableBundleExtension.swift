//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Hamed Tara on 2024-02-11.
//

import Foundation

extension Bundle{
    func decode<T: Codable>(_ file:String)-> T{
        //1.: locate The json file
        guard let url = self.url(forResource: file, withExtension: nil)else {
            fatalError("Failed to locate file in the bundle \(file)")
        }
        //2.: create a property for the data
        
        guard let data = try? Data(contentsOf: url)else {
            fatalError("Failed to load \(file) from bundle")
        }
        //3. : create a decoder
        let decoder = JSONDecoder()
        //4. : return the ready to use data
        guard let loaded = try? decoder.decode(T.self, from: data)else {
            fatalError("Failed to decode \(file) fromn bundle")
        }
        return loaded;
    }
}
