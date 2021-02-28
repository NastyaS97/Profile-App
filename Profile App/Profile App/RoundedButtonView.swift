//
//  RoundedButtonView.swift
//  Profile App
//
//  Created by Настя Сойко on 1.03.21.
//

import UIKit

class RoundedButtonView: UIView {

    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }

}
