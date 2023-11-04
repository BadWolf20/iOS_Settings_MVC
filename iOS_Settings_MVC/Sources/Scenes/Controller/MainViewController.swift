//
//  MainViewController.swift
//  iOS_Settings_MVC
//
//  Created by Roman on 04.11.2023.
//

import UIKit
import NotificationManager

class MainViewController: UIViewController {
    // MARK: - Properties
    private var settingsView = MainView()


    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view = settingsView
        setup()
    }


    // MARK: - Setup
    private func setup() {
        setupComponents()
        setupText()
    }

    private func setupComponents() {
        navigationController?.navigationBar.prefersLargeTitles = true

        settingsView.tableView.register(cellType: SettingsViewCell.self)
        settingsView.tableView.dataSource = self
        settingsView.tableView.delegate = self
    }

    private func setupText() {
        title = "Settings"
    }
}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return SettingsManager.shared.getSectionsCount()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = SettingBlock.allCases[section]
        switch sectionType {
        case .fast:
            return SettingsManager.shared.getSettingsSectionLength(for: .fast)
        case .notifications:
            return SettingsManager.shared.getSettingsSectionLength(for: .notifications)
        case .main:
            return SettingsManager.shared.getSettingsSectionLength(for: .main)
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var set = [Setting]()
        let sectionType = SettingBlock.allCases[indexPath.section]

        switch sectionType {
        case .fast:
            set = SettingsManager.shared.getSettingsList(for: .fast)
        case .notifications:
            set = SettingsManager.shared.getSettingsList(for: .notifications)
        case .main:
            set = SettingsManager.shared.getSettingsList(for: .main)
        }

        let setChose = set[indexPath.row]

        let cell: SettingsViewCell = settingsView.tableView.dequeueReusableCell(for: indexPath, cellType: SettingsViewCell.self)
        cell.configure(with: setChose)
        cell.switchAction = { isOn in
            NotificationManager.shared.sendNotification(withTitle: "You changed state to \(isOn ? "on" : "off")")
        }

        return cell
    }
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.row == 0 && indexPath.section == 0 {
            return nil
        }
        return indexPath
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let block = SettingBlock.allCases[indexPath.section]
        let settings = SettingsManager.shared.getSettingsList(for: block)
        let setting = settings[indexPath.row]


        // Обработка выбора настройки
        NotificationManager.shared.sendNotification(withTitle: "You push '\(setting.name)' button")

        // Переход к экрану настроек
        // TODO: Реализовать переход к экрану настроек, если требуется
//        moveToSetttingView(setting.name)

    }
}
