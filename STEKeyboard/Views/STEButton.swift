//
//  STEButton.swift
//  STEKeyboard
//
//  Created by Sengthai Te on 6/6/21.
//

import Foundation
import UIKit

/*
    Mark:- Purpose
        + Title in the middle
        + Subtitle on top
 */

enum STEKeybaordType: String {
    case kt_delete
    case kt_number
    case kt_switchKeyboard
    case kt_setting
    case kt_emoj
    case kt_space
    case kt_return
}

protocol STEButtonDelegate: AnyObject {
    func charButtonTapped(_ char: String)
    func emojButtonTapped()
    func deleteButtonTapped()
    func settingButtonTapped()
    func spaceButtonTapped()
    func returnButtonTapped()
    func switchToNumberButtonTapped()
    func switchKeyboardTypeButtonTapped()
}

class STEButton: UIButton {
    
    public weak var delegate: STEButtonDelegate?
    
    private var buttonText: STEButtonModel
    
    private let subTitle: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 11)
        lbl.textColor = .black
        lbl.textAlignment = .right
        return lbl
    }()

    
    init(buttonData: STEButtonModel) {
        buttonText = buttonData
        super.init(frame: .zero)
        
        let title = buttonData.title
        let subtitle = buttonData.subtitle
        
        backgroundColor = .white
        clipsToBounds = true
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray2.cgColor
        setTitleColor(.black, for: .normal)
        setTitle(title, for: .normal)
        subTitle.text = subtitle
        addSubview(subTitle)
        addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        subTitle.frame = CGRect(x: 0, y: 3, width: self.bounds.width - 3, height: 11)
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("touch began")
//    }
//
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("touch ended")
//        self.delegate?.charTapped(buttonText.title)
//    }
    
}

extension STEButton {
    
    @objc private func touchUpInside() {
        handleKeyButtonType(buttonText.type ?? "")
    }
    
}

extension STEButton {
    
    @objc private func handleKeyButtonType(_ string: String) {
        let keyboardType = STEKeybaordType.init(rawValue: string)
        switch keyboardType {
        case .kt_delete: delegate?.deleteButtonTapped()
        case .kt_emoj: delegate?.emojButtonTapped()
        case .kt_space: delegate?.spaceButtonTapped()
        case .kt_setting: delegate?.settingButtonTapped()
        case .kt_switchKeyboard: delegate?.switchKeyboardTypeButtonTapped()
        case .kt_number: delegate?.switchToNumberButtonTapped()
        case .kt_return: delegate?.returnButtonTapped()
        default: delegate?.charButtonTapped(buttonText.title)
        }
    }
    
}
