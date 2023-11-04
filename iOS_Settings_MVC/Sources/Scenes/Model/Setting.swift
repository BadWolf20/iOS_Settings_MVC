//
//  SettingsModel.swift
//  iOS_Settings_MVC
//
//  Created by Roman on 04.11.2023.
//

import UIKit

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

/// `SettingStyle` описывает стиль отображения элемента настройки.
enum SettingStyle {
    case check
    case move
}

/// `SettingBlock` представляет секции настроек.
enum SettingBlock: Int, CaseIterable {
    case fast
    case notifications
    case main
}

/// `Setting` представляет одиночный элемент настройки.
///
/// Он содержит информацию, необходимую для отображения и управления
/// элементом настройки в пользовательском интерфейсе.
///
/// Свойства:
///   - `name`: Название настройки, которое будет отображаться пользователю.
///   - `style`: Стиль настройки, определяющий её поведение и внешний вид.
///   Может быть `.check` для настроек с чекбоксом или `.move`
///   для настроек, предполагающих переход к следующему экрану.
///   - `block`: Раздел настроек, к которому принадлежит данный элемент.
///   Это значение используется для группировки настроек в разделы.
///   - `imageName`: Необязательное имя изображения, используемое для иконки настройки.
///   Если изображение отсутствует, `imageName` будет `nil`.
///
/// Вычисляемое свойство:
///   - `imageMain`: Возвращает объект `UIImage`, соответствующий `imageName`,
///
struct Setting {
    /// Название настройки, которое будет отображаться пользователю.
    let name: String
    /// Название настройки, которое будет отображаться пользователю.
    let style: SettingStyle
    /// Раздел настроек, к которому принадлежит  элемент.
    let block: SettingBlock
    /// Имя изображения, используемое для иконки настройки.
    let imageName: String?

    /// Возвращает изображение настройки, если оно доступно.
//    var imageMain: UIImage? {
//        return UIImage(named: imageName ?? "")
//    }

    var imageMain: UIImage? {
        guard let name = imageName, !name.isEmpty else {
            return nil
        }
        return UIImage(named: name)
    }
}
