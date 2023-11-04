//
//  UIImage.swift
//  iOS_Settings_MVC
//
//  Created by Roman on 04.11.2023.
//

import UIKit

extension UIImage {

    /// Создает квадратное изображение с закругленным фоном и символом SF Symbols.
    /// Символ будет меньше по размеру на 10% относительно стороны квадрата и будет сохранять свои пропорции.
    ///
    /// - Parameters:
    ///   - symbolName: Имя символа SF Symbols для использования в изображении.
    ///   - backgroundColor: Цвет фона для квадратного изображения (по умолчанию прозрачный).
    ///   - sideLength: Длина стороны квадрата, в который будет вписан символ.
    ///   - cornerRadius: Радиус закругления углов квадрата (по умолчанию 0).
    /// - Returns: Квадратное UIImage с символом SF Symbols и фоном или nil, если символ не найден.
    static func squareImageFromSFSymbol(named symbolName: String, backgroundColor: UIColor? = nil, sideLength: CGFloat, cornerRadius: CGFloat? = nil) -> UIImage? {
        // Конфигурация для SF Symbols с учетом размера точки и веса символа.
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: sideLength, weight: .regular)
        // Получаем изображение символа, окрашенное в белый цвет.
        guard let symbolImage = UIImage(systemName: symbolName, withConfiguration: symbolConfig)?.withTintColor(.white, renderingMode: .alwaysOriginal) else {
            return nil
        }

        // Сохраняем соотношение сторон изображения символа.
        let aspectRatio = symbolImage.size.width / symbolImage.size.height
        let symbolSideLength: CGFloat = aspectRatio > 1 ? (sideLength * 0.8) / aspectRatio : sideLength * 0.8

        // Подготавливаем значения цвета фона и радиуса закругления.
        let actualBackgroundColor = backgroundColor ?? .clear
        let actualCornerRadius = cornerRadius ?? 0

        // Начинаем новый графический контекст с размерами квадрата.
        UIGraphicsBeginImageContextWithOptions(CGSize(width: sideLength, height: sideLength), false, 0)

        // Рисуем закругленный прямоугольник для фона.
        let rect = CGRect(x: 0, y: 0, width: sideLength, height: sideLength)
        let path = UIBezierPath(roundedRect: rect, cornerRadius: actualCornerRadius)
        actualBackgroundColor.setFill()
        path.fill()

        // Рассчитываем размеры и положение для изображения символа.
        let imageSize = CGSize(width: symbolSideLength * aspectRatio, height: symbolSideLength)
        let imageRect = CGRect(x: (sideLength - imageSize.width) / 2,
                               y: (sideLength - imageSize.height) / 2,
                               width: imageSize.width,
                               height: imageSize.height)
        // Рисуем символ в вычисленном прямоугольнике.
        symbolImage.draw(in: imageRect)

        // Получаем изображение из контекста и заканчиваем графический контекст.
        let imageWithBackground = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return imageWithBackground
    }
}
