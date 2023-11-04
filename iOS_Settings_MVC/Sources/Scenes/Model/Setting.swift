//
//  SettingsModel.swift
//  iOS_Settings_MVC
//
//  Created by Roman on 04.11.2023.
//

import UIKit

class SettingsManager {
    static let shared = SettingsManager()

    func getSectionsCount() -> Int {
        let blocks = Set(settingsList.map { $0.block })
        return blocks.count
    }

    func getSettingsList(for block: SettingBlock) -> [Setting] {
        return settingsList.filter { $0.block == block }
    }

    func getSettingsSectionLength(for block: SettingBlock) -> Int {
        return getSettingsList(for: block).count
    }

    private var settingsList = [Setting(name: "Airplane Mode",
                                style: .check,      block: .fast,    imageName: "Airplane Mode"),
                        Setting(name: "Wi-Fi",
                                style: .move,       block: .fast,    imageName: "Wi-Fi"),
                        Setting(name: "Bluetooth",
                                style: .move,       block: .fast,    imageName: nil),
                        Setting(name: "Cellular",
                                style: .move,       block: .fast,    imageName: "Cellular"),
                        Setting(name: "Personal Hotspot",
                                style: .move,       block: .fast,    imageName: "Personal Hotspot"),
                        Setting(name: "Notifications",
                                style: .move,       block: .notifications,    imageName: "Notifications"),
                        Setting(name: "Sounds & Haptics",
                                style: .move,       block: .notifications,    imageName: "Sounds & Haptics"),
                        Setting(name: "Focus",
                                style: .move,       block: .notifications,    imageName: "Focus"),
                        Setting(name: "Screen Time",
                                style: .move,       block: .notifications,    imageName: "Screen Time"),
                        Setting(name: "General",
                                style: .move,       block: .main,    imageName: "General"),
                        Setting(name: "Control Center",
                                style: .check,       block: .main,    imageName: nil),
                        Setting(name: "Display & Brightness",
                                style: .move,       block: .main,    imageName: "Display & Brightness"),
                        Setting(name: "Wallpaper",
                                style: .move,       block: .main,    imageName: nil)
    ]
}

enum SettingStyle {
    case check
    case move
}

enum SettingBlock: Int, CaseIterable {
    case fast = 1
    case notifications
    case main

    static let allValues = [SettingBlock.fast, SettingBlock.notifications, SettingBlock.main]
}


struct Setting {
    let name: String
    let style: SettingStyle
    let block: SettingBlock
    let imageName: String?

    var imageMain: UIImage? {
        return UIImage(named: imageName ?? "")
    }
}
