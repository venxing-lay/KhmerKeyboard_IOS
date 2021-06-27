//
//  KeyboardContent.swift
//  STEKeyboard
//
//  Created by Sengthai Te on 8/6/21.
//

import Foundation
import UIKit

class KeyboardContent: BaseView {
    
    override var xibName: String? {
        return "KeyboardContent"
    }
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    private var keyboardType: KeybaordType?
    private var docProxy: UITextDocumentProxy?
    
    private var tableNumRows: Int = 0,
                tableCellHeight: CGFloat = 0
    
    private var buttonTitleData: STEButtonDataListModel?
    
    private var viewModel = KeyboardContentViewModel()
    
    
    init(type: KeybaordType, proxy: UITextDocumentProxy) {
        keyboardType = type
        docProxy = proxy
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func commonInit() {
        buttonTitleData = viewModel.getKeyboardData()
        setupKeyboardView()
    }
}

extension KeyboardContent {
    
    public func reloadData() {
        if let data = buttonTitleData {
            tableNumRows = keyboardType?.getCellNumRows(data.button_list) ?? 0
            tableCellHeight = keyboardType?.getCellHeight(data.button_list, totalHeight: tableView.frame.height) ?? 0
        }
        tableView.reloadData()
    }
    
    private func setupKeyboardView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "KeyboardContentViewCell", bundle: nil), forCellReuseIdentifier: "KeyboardContentViewCell")
        reloadData()
    }
    
}

extension KeyboardContent: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableNumRows
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableCellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "KeyboardContentViewCell", for: indexPath) as! KeyboardContentViewCell
        if let data = buttonTitleData, let proxy = docProxy {
            let cellData = data.button_list[indexPath.row]
            cell.bindData(cellData, docProxy: proxy)
        }
        return cell
    }
    
}
