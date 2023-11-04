//
//  DetailedView.swift
//  iOS_Settings_MVC
//
//  Created by Roman on 04.11.2023.
//

import UIKit
import SnapKit

class DetailedView: UIView {


    // MARK: - Components


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
    }

    private func setupComponents() {
        backgroundColor = .systemBackground
    }

    private func setupText() {
    }

    private func setupConstraints() {
  
    }

}
