//
//  RoundedViewOfButtonContacts.swift
//  Profile App
//
//  Created by Настя Сойко on 1.03.21.
//

import UIKit

class RoundedViewOfButtonContacts: UIView {
    @IBInspectable
    var cornerRadious: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadious
        }
    }
}
