//
//  ContactsEditControllerViewController.swift
//  Profile App
//
//  Created by Настя Сойко on 2.03.21.
//

import UIKit

class ContactsEditController: UIViewController, UITextFieldDelegate, LastControllerDelegate {

    //MARK: - variables

    let contactsCard = PAContacts()

    @IBOutlet weak var phoneContact: UITextField!
    @IBOutlet weak var emailContact: UITextField!
    @IBOutlet weak var skypeContact: UITextField!

    override func viewDidLoad() {

        // MARK: - added picker and firstResponder

        self.phoneContact.becomeFirstResponder()

        super.viewDidLoad()

        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewDidTapped)))
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
        return true
    }

    //MARK: - set data

    func setViewData() {

        self.phoneContact.text = self.contactsCard.phone
        self.skypeContact.text = self.contactsCard.skype
        self.emailContact.text = self.contactsCard.email
    }

    func phoneDidChanged(phone: String) {
        self.contactsCard.phone = phone
        self.setViewData()
    }

    func emailDidCganged(email: String) {
        self.contactsCard.email = email
        self.setViewData()
    }

    func skypeDidCganged(skype: String) {
        self.contactsCard.skype = skype
        self.setViewData()
    }

    //MARK: - prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showContact":
            if let controller = segue.destination as? LastController {
                controller.delegate = self
            }
        default:
            break
        }
    }

    //MARK: - actions

    @objc private func viewDidTapped() {
        self.view.endEditing(true)
    }
}
