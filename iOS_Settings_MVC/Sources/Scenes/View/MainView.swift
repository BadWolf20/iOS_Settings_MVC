//
//  MainView.swift
//  iOS_Settings_MVC
//
//  Created by Roman on 04.11.2023.
//

import UIKit
import SnapKit

class MainView: UIView {

    // MARK: - Components
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)

        tableView.frame = CGRect.init(origin: .zero, size: frame.size)
        tableView.rowHeight = 50

        return tableView
    }()

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup
    private func setupUI() {
        setupHierarchy()
        setupConstraints()
        setupComponents()
        setupText()
    }

    private func setupHierarchy() {
        addSubview(tableView)
    }

    private func setupComponents() {
        backgroundColor = .systemBackground
    }

    private func setupText() {
    }

    private func setupConstraints() {
        tableView.snp.remakeConstraints { make in
            make.bottom.top.left.right.equalTo(safeAreaLayoutGuide)
        }
    }
}

