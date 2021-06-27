//
//  KeyboardViewController.swift
//  STEKeyboard
//
//  Created by Sengthai Te on 30/5/21.
//

import UIKit

enum KeybaordType {
    case main
    case special
    case emoj
    
    var getInputViewHeight: CGFloat {
        return self == .emoj ? 300 : 250
    }
    
    func getCellHeight(_ data: [Any], totalHeight: CGFloat)-> CGFloat {
        switch self {
        case .main, .special:
            return CGFloat(floor(Double(totalHeight / CGFloat(data.count))))
        default: return 44
        }
    }
    
    func getCellNumRows(_ data: [Any])-> Int {
        return data.count
    }
    
}

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    private var keyboardContent: UIView!
    private var heightConstraint: NSLayoutConstraint?
    
    private var keyboardType: KeybaordType = .main {
        didSet {
            if let keyboardContent = keyboardContent as? KeyboardContent {
                keyboardContent.reloadData()
            }
        }
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        if let constraint = heightConstraint {
            view.removeConstraint(constraint)
        }
        heightConstraint = NSLayoutConstraint(item: inputView!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: keyboardType.getInputViewHeight)
        heightConstraint?.priority = UILayoutPriority(999.0)
        view.addConstraint(heightConstraint!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNextKeyboardButton()
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        styleTextDidChange()
    }

}

extension KeyboardViewController {
    
    private func setupUI() {
        let nibView = KeyboardContent(type: keyboardType, proxy: textDocumentProxy)
        keyboardContent = nibView
        view.addSubview(keyboardContent)
    }
    
    /* Style text base on keyboard appearance */
    private func styleTextDidChange() {
        var textColor: UIColor
        let proxy = textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        nextKeyboardButton.setTitleColor(textColor, for: [])
    }
    
    /* Setup nextKeyboard button */
    private func setupNextKeyboardButton() {
        nextKeyboardButton = UIButton(type: .system)
        nextKeyboardButton.sizeToFit()
        nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        view.addSubview(nextKeyboardButton)
        
        nextKeyboardButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        nextKeyboardButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}
