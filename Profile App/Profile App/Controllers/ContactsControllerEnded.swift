//
//  ContactsControllerEnded.swift
//  Profile App
//
//  Created by Настя Сойко on 4.03.21.
//

import UIKit

class ContactsControllerEnded: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var phonaTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var skypeTextField: UITextField!

    override func viewDidLoad() {

        self.phonaTextField.becomeFirstResponder()

        super.viewDidLoad()

        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewDidTapped)))

        self.phonaTextField.textContentType = .telephoneNumber
        self.phonaTextField.keyboardType = .phonePad
        self.emailTextField.textContentType = .emailAddress
        self.emailTextField.keyboardType = .emailAddress
        self.skypeTextField.textContentType = .nickname

        self.phonaTextField.delegate = self
        self.emailTextField.delegate = self
        self.skypeTextField.delegate = self
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

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        if textField.textContentType == .some(.emailAddress) {
            return true
        } else if textField.textContentType == .some(.telephoneNumber) {
            let currentTextField = textField.text ?? ""
            let resultText = (currentTextField as NSString).replacingCharacters(in: range, with: string)
            if resultText.count >= 30 {
                return false
            } else {
                return true
            }
        } else {
            return false
        }
    }
}
