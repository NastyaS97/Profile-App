//
//  AnotherPartOfView.swift
//  Profile App
//
//  Created by Настя Сойко on 3.03.21.
//

import UIKit

@IBDesignable
class AnotherPartOfView: UIView {

    // MARK: - IBInspectable

    @IBInspectable
    var nameText: String = "" {
        didSet {
            self.nameView.text = self.nameText
        }
    }

    @IBInspectable
    var surnameText: String = "" {
        didSet {
            self.surName.text = self.surnameText
        }
    }

    @IBInspectable
    var patronymicText: String = "" {
        didSet {
            self.patronymic.text = self.patronymicText
        }
    }

    @IBInspectable
    var ageText: String = "" {
        didSet {
            self.age.text = self.ageText
        }
    }

    @IBInspectable
    var infoText: String = "" {
        didSet {
            self.information.text = self.infoText
        }
    }

    // MARK: - IBOutlet

    @IBOutlet var surName:UILabel!
    @IBOutlet var nameView:UILabel!
    @IBOutlet var patronymic:UILabel!
    @IBOutlet var age:UILabel!
    @IBOutlet var information:UITextView!
}
