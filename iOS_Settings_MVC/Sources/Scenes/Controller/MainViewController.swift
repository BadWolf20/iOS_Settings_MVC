//
//  MainViewController.swift
//  iOS_Settings_MVC
//
//  Created by Roman on 04.11.2023.
//

import UIKit

class MainViewController: UIViewController {

    private var MainView: MainView? {
        guard isViewLoaded else { return nil }
        return view as? MainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = MainView
        // Do any additional setup after loading the view.
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
        <#code#>
    }
    
    

}
