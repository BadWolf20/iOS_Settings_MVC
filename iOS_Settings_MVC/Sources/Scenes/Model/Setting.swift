//
//  Setting.swift
//  iOS_Settings_MVC
//
//  Created by Roman on 04.11.2023.
//

import UIKit

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
///   - `backgroundColor`: Необязательный цвет фона изображения. Если цвет не задан,
///     будет использоваться прозрачный фон.
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
    /// Цвет фона изображения, используемый если изображение есть.
    let backgroundColor: UIColor?

    /// Возвращает изображение настройки, если оно доступно.
    var imageMain: UIImage? {
        guard let name = imageName, !name.isEmpty else {
            return nil
        }
        return UIImage.squareImageFromSFSymbol(named: name, backgroundColor: backgroundColor, sideLength: 100, cornerRadius: 20)
    }
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
