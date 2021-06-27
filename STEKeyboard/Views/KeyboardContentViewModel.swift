//
//  KeyboardContentViewModel.swift
//  STEKeyboard
//
//  Created by Sengthai Te on 26/6/21.
//

import Foundation

struct STEButtonDataListModel: Codable {
    let button_list: [STEButtonColumnModel]
}

struct STEButtonColumnModel: Codable {
    let first_col: [STEButtonModel]
    let middle_col: [STEButtonModel]
    let last_col: [STEButtonModel]
}

struct STEButtonModel: Codable {
    let title: String
    let subtitle: String?
    let type: String?
}

class KeyboardContentViewModel {
    
    public func getKeyboardData()->STEButtonDataListModel? {
        guard let jsonData = STEKeybaordData.mainScreenButtonData.data(using: .utf8) else { return nil }
        do {
            let decodedData = try JSONDecoder().decode(STEButtonDataListModel.self, from: jsonData)
            return decodedData
        } catch (let error) {
            print("Error decode data.", error)
        }
        return nil
    }
    
}
