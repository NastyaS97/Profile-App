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

        self.phoneContact.textContentType = .telephoneNumber
        self.phoneContact.keyboardType = .phonePad
        self.emailContact.textContentType = .emailAddress
        self.emailContact.keyboardType = .emailAddress
        self.skypeContact.textContentType = .nickname

        self.emailContact.delegate = self
        self.phoneContact.delegate = self
        self.skypeContact.delegate = self
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
