//
//  TitleDescriptionView.swift
//  Profile App
//
//  Created by Настя Сойко on 2.03.21.
//

import UIKit

@IBDesignable
class TitleDescriptionView: UIView {

    // MARK: - IBInspectable

    @IBInspectable
    var positionText: String = "" {
        didSet {
            self.positionName.text = self.positionText
        }
    }

    @IBInspectable
    var developerText: String = "" {
        didSet {
            self.developerName.text = self.developerText
        }
    }

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var positionName: UILabel!
    @IBOutlet weak var developerName: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        self.initView()
    }

    func initView() {
        self.loadFromNib()
    }
}
