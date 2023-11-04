//
//  SettingsViewCell.swift
//  iOS_Settings_MVC
//
//  Created by Roman on 04.11.2023.
//

import UIKit

class SettingsViewCell: UITableViewCell {

    // MARK: - Properties
    var switchAction: ((Bool) -> Void)?

    // MARK: - Components
    private lazy var iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()

    private lazy var rightMoveIcon: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(systemName: "chevron.right")?.withTintColor(.systemGray2, renderingMode: .alwaysOriginal)
        imageView.image = image
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    private lazy var rightSwitch: UISwitch = {
        let toggle = UISwitch()
        toggle.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
        return toggle
    }()

    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: - Configuration
    func configure(with data: Setting) {
        mainLabel.text = data.name
        iconImage.image = data.imageMain

        switch data.style {
        case .check:
            rightSwitch.isHidden = false
        case .move:
            rightMoveIcon.isHidden = false
        }
    }


    // MARK: - Setup
    private func setupUI() {
        setupHierarchy()
        setupConstraints()
        setupComponents()
    }

    private func setupHierarchy() {
        contentView.addSubview(iconImage)
        contentView.addSubview(mainLabel)
        contentView.addSubview(rightSwitch)
        contentView.addSubview(rightMoveIcon)
    }

    private func setupComponents() {
        rightSwitch.isHidden = true
        rightMoveIcon.isHidden = true
    }

    private func setupConstraints() {
        iconImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(20)
            make.height.equalTo(30)
            make.width.equalTo(iconImage.snp.height)
        }

        mainLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.equalTo(30)
            make.left.equalTo(iconImage.snp.right).offset(16)
        }

        rightSwitch.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(20)
        }

        rightMoveIcon.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(20)
            make.width.equalTo(10)
        }
    }

    // MARK: - Actions
    @objc private func switchChanged() {
        switchAction?(rightSwitch.isOn)
    }

}
