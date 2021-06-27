//
//  STEKeyboardExtension.swift
//  STEKeyboard
//
//  Created by Sengthai Te on 31/5/21.
//

import UIKit

extension String {
    
    func parse<D>(to type: D.Type) -> D? where D: Decodable {
        
        let data: Data = self.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        
        do {
            let _object = try decoder.decode(type, from: data)
            return _object
            
        } catch {
            return nil
        }
    }
    
}
