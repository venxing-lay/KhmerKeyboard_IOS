//
//  KeyboardContentViewCell.swift
//  STEKeyboard
//
//  Created by Sengthai Te on 6/6/21.
//

import Foundation
import UIKit

class KeyboardContentViewCell: UITableViewCell {
    
    private var docProxy: UITextDocumentProxy!
    
    @IBOutlet weak var leadingStackView: UIStackView!
    @IBOutlet weak var centerStackView: UIStackView!
    @IBOutlet weak var trailingStackView: UIStackView!
    
    func bindData(_ data: STEButtonColumnModel, docProxy: UITextDocumentProxy) {
        self.docProxy = docProxy
        let firstCol = data.first_col
        let middleCol = data.middle_col
        let lastCol = data.last_col
        
        firstCol.forEach { buttonData in
            let button = STEButton(buttonData: buttonData)
            button.delegate = self
            leadingStackView.addArrangedSubview(button)
        }
        
        middleCol.forEach { buttonData in
            let button = STEButton(buttonData: buttonData)
            button.delegate = self
            centerStackView.addArrangedSubview(button)
        }
        
        lastCol.forEach { buttonData in
            let button = STEButton(buttonData: buttonData)
            button.delegate = self
            trailingStackView.addArrangedSubview(button)
        }
    }
    
}

extension KeyboardContentViewCell: STEButtonDelegate {
    func charButtonTapped(_ char: String) {
        docProxy.insertText(char)
    }
    
    func emojButtonTapped() {
        print("emoj tapped")
    }
    
    func deleteButtonTapped() {
        docProxy.deleteBackward()
    }
    
    func settingButtonTapped() {
        print("setting tapped")
    }
    
    func spaceButtonTapped() {
        docProxy.insertText(" ")
    }
    
    func returnButtonTapped() {
        docProxy.insertText("\n")
    }
    
    func switchToNumberButtonTapped() {
        print("number button tapped")
    }
    
    func switchKeyboardTypeButtonTapped() {
        print("switch keyboard type")
    }
    
}
