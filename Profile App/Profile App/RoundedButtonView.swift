//
//  RoundedButtonView.swift
//  Profile App
//
//  Created by Настя Сойко on 1.03.21.
//

import UIKit

@IBDesignable
class RoundedButtonView: UIButton {

    // MARK: - IBInspectable
    @IBInspectable var
        borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
