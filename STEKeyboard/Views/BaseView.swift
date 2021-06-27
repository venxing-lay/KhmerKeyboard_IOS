//
//  BaseView.swift
//  STEKeyboard
//
//  Created by Sengthai Te on 1/6/21.
//

import UIKit

class BaseView: UIView {
    
    public var xibName: String? {
        return nil
    }
    
    public var contentView: UIView?
    
    public func commonInit() {}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        guard let name = xibName,
              let xibView = Bundle.main.loadNibNamed(name, owner: self, options: nil)?.first as? UIView else {
            return
        }
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView?.frame = frame
        contentView = xibView
        addSubview(xibView)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        guard let name = xibName,
              let xibView = Bundle.main.loadNibNamed(name, owner: self, options: nil)?.first as? UIView else {
            return
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: xibView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: xibView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: xibView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: xibView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        contentView = xibView
        addSubview(xibView)
        commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView?.frame = self.bounds
    }
    
}
