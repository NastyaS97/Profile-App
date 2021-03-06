//
//  LastController.swift
//  Profile App
//
//  Created by Настя Сойко on 6.03.21.
//

import UIKit

protocol LastControllerDelegate: class {
    func phoneDidChanged(phone: String)
    func emailDidCganged(email: String)
    func skypeDidCganged(skype: String)
}

class LastController: UIViewController, UITextFieldDelegate {

    var contactsCard: PAContacts? // модель для передачи данных

    weak var delegate: LastControllerDelegate?

    @IBOutlet weak var phoneView: UITextField!
    @IBOutlet weak var emailView: UITextField!
    @IBOutlet weak var skypeView: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.phoneView.becomeFirstResponder()

        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewDidTapped)))

        self.emailView.textContentType = .emailAddress
        self.emailView.keyboardType = .emailAddress
        self.phoneView.textContentType = .telephoneNumber
        self.phoneView.keyboardType = .numberPad

        self.phoneView.delegate = self
        self.emailView.delegate = self
        self.skypeView.delegate = self
    }

    // MARK: - func

    func textFieldDidBeginEditing(_ textField: UITextField) {
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.emailView {
            self.delegate?.emailDidCganged(email: textField.text ?? "")
        } else if textField == self.phoneView {
            self.delegate?.phoneDidChanged(phone: textField.text ?? "")
        } else {
            if textField == self.skypeView {
                self.delegate?.skypeDidCganged(skype: textField.text ?? "")
            }
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    // MARK: - actions

    @objc private func viewDidTapped() {
        self.view.endEditing(true)
    }

}
