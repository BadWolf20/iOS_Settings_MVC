//
//  MainViewController.swift
//  iOS_Settings_MVC
//
//  Created by Roman on 04.11.2023.
//

import UIKit
import NotificationManager

class MainViewController: UIViewController {

    private var settingsView = MainView()

//    private var mainView: MainView? {
//        guard isViewLoaded else { return nil }
//        return view as? MainView
//    }


    override func viewDidLoad() {
        super.viewDidLoad()
        view = settingsView
        setupTableView()
    }

    private func setupTableView() {
        settingsView.tableView.register(cellType: SettingsViewCell.self)
        settingsView.tableView.dataSource = self
        settingsView.tableView.delegate = self
     }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return SettingsManager.shared.getSectionsCount()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return SettingsManager.shared.getSettingsSectionLength(for: .fast)
        case 1:
            return SettingsManager.shared.getSettingsSectionLength(for: .notifications)
        case 2:
            return SettingsManager.shared.getSettingsSectionLength(for: .main)
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.row == 0 && indexPath.section == 0 {
            return nil
        }
        return indexPath
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var set = [Setting]()

        switch indexPath.section {
        case 0:
            set = SettingsManager.shared.getSettingsList(for: .fast)
        case 1:
            set = SettingsManager.shared.getSettingsList(for: .notifications)
        case 2:
            set = SettingsManager.shared.getSettingsList(for: .main)
        default:
            set = SettingsManager.shared.getSettingsList(for: .fast)
        }

        let setChose = set[indexPath.row]

        let cell: SettingsViewCell = settingsView.tableView.dequeueReusableCell(for: indexPath, cellType: SettingsViewCell.self)
        cell.configure(with: setChose)
        cell.switchAction = { isOn in
            NotificationManager.shared.sendNotification(withTitle: "You changed state to \(isOn ? "on" : "off")")
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)


        let block = SettingBlock.allCases[indexPath.section]
        let settings = SettingsManager.shared.getSettingsList(for: block)
        let setting = settings[indexPath.row]


        // Отправка уведомления о выборе настройки
        NotificationManager.shared.sendNotification(withTitle: "You push '\(setting.name)' button")

        // Переход к экрану настроек
//        moveToSetttingView(setting.name)



    }

    

}
