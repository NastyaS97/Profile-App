//
//  ContactsEditControllerViewController.swift
//  Profile App
//
//  Created by Настя Сойко on 2.03.21.
//

import UIKit

class ContactsEditController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var phoneContact: UITextField!
    @IBOutlet weak var emailContact: UITextField!
    @IBOutlet weak var skypeContact: UITextField!

    override func viewDidLoad() {

        super.viewDidLoad()

        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewDidTapped)))
    }

    @objc private func viewDidTapped() {
        self.view.endEditing(true)
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
