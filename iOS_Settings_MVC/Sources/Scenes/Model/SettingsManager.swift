//
//  SettingsManager.swift
//  iOS_Settings_MVC
//
//  Created by Roman on 04.11.2023.
//

/// `SettingsManager` обрабатывает бизнес-логику настроек приложения,
/// предоставляя интерфейс для получения и управления данными настроек.
class SettingsManager {
    static let shared = SettingsManager()

    /// Возвращает количество разделов настроек.
    func getSectionsCount() -> Int {
        let blocks = Set(settingsList.map { $0.block })
        return blocks.count
    }

    /// Получает список настроек для определенного раздела.
    /// - Parameter block: Раздел настроек, для которого необходим список.
    /// - Returns: Массив настроек соответствующего раздела.
    func getSettingsList(for block: SettingBlock) -> [Setting] {
        return settingsList.filter { $0.block == block }
    }

    /// Возвращает количество настроек в заданном разделе.
    /// - Parameter block: Раздел настроек, для которого необходимо узнать количество элементов.
    /// - Returns: Количество настроек в разделе.
    func getSettingsSectionLength(for block: SettingBlock) -> Int {
        return getSettingsList(for: block).count
    }

    private var settingsList = [Setting(name: "Airplane Mode",
                                        style: .check,      block: .fast,    imageName: "airplane", backgroundColor: .systemOrange),
                        Setting(name: "Wi-Fi",
                                style: .move,       block: .fast,    imageName: "wifi", backgroundColor: .systemBlue),
                        Setting(name: "VPN",
                                style: .move,       block: .fast,    imageName: "network", backgroundColor: .systemBlue),
                        Setting(name: "Cellular",
                                style: .move,       block: .fast,    imageName: "antenna.radiowaves.left.and.right", backgroundColor: .systemGreen),
                        Setting(name: "Personal Hotspot",
                                style: .move,       block: .fast,    imageName: "personalhotspot", backgroundColor: .systemGreen),
                        Setting(name: "Notifications",
                                style: .move,       block: .notifications,    imageName: "bell.badge.fill", backgroundColor: .systemRed),
                        Setting(name: "Sounds & Haptics",
                                style: .move,       block: .notifications,    imageName: "speaker.wave.3.fill", backgroundColor: .systemPink),
                        Setting(name: "Focus",
                                style: .move,       block: .notifications,    imageName: "moon.fill", backgroundColor: .systemPurple),
                        Setting(name: "Screen Time",
                                style: .move,       block: .notifications,    imageName: "hourglass", backgroundColor: .systemPurple),
                        Setting(name: "General",
                                style: .move,       block: .main,    imageName: "gear", backgroundColor: .systemGray),
                        Setting(name: "Face ID & Passcode",
                                style: .check,       block: .main,    imageName: "faceid", backgroundColor: .systemGreen),
                        Setting(name: "Display & Brightness",
                                style: .move,       block: .main,    imageName: "sun.max.fill", backgroundColor: .systemBlue),
                        Setting(name: "Emergency SOS",
                                style: .move,       block: .main,    imageName: "sos", backgroundColor: .systemRed)
    ]
}
