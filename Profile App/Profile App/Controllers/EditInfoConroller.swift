//
//  EditInfoConroller.swift
//  Profile App
//
//  Created by Настя Сойко on 2.03.21.
//

import UIKit

protocol EditInfoConrollerDelegate: class {
    func ageDidChanged(picker: UIDatePicker, birthDate: Date)
    func nameDidCganged(name: String)
}

class EditInfoConroller: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    var userCardInfo: PACardInfo?

    weak var delegate: EditInfoConrollerDelegate?
    
    @IBOutlet weak var nameView: UITextField!
    @IBOutlet weak var lastNameView: UITextField!
    @IBOutlet weak var patronymicView: UITextField!
    @IBOutlet weak var ageView: UITextField! {
        didSet {
            self.ageView.inputView = self.dataPicker
        }
    }
    @IBOutlet weak var positionView: UITextField!
    @IBOutlet weak var experienceView: UITextField! {
        didSet {
            self.experienceView.inputView = self.dataPicker
        }
    }
    @IBOutlet weak var infoView: UITextView!
    @IBOutlet weak var saveView: UIBarButtonItem!


    private lazy var dataPicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .automatic
        picker.maximumDate = Date()
        picker.addTarget(self,
                         action: #selector(agePickerValueChanged),
                         for: .valueChanged)

        return picker
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                              action: #selector(viewDidTapped)))

        //       let recognizer = UITapGestureRecognizer(target: self,
        //                                               action: #selector(saveBarButtonTapped))
        //
        //        saveView.addGestureRecognizer(recognizer)

        self.nameView.becomeFirstResponder()

        self.nameView.textContentType = .name
        self.nameView.keyboardType = .namePhonePad
        self.lastNameView.textContentType = .name
        self.lastNameView.keyboardType = .namePhonePad
        self.patronymicView.textContentType = .name
        self.patronymicView.keyboardType = .namePhonePad
        self.positionView.textContentType = .jobTitle

        self.nameView.delegate = self
        self.lastNameView.delegate = self
        self.patronymicView.delegate = self
        self.ageView.delegate = self
        self.positionView.delegate = self
        self.experienceView.delegate = self
        self.infoView.delegate = self

        self.setViewData()
    }

    // MARK: - setting view data

    @objc private func agePickerValueChanged(_datePicker: UIDatePicker) {
        self.ageView.text = dataPicker.date.toInt
        self.experienceView.text = dataPicker.date.toInt

        self.delegate?.ageDidChanged(picker: dataPicker, birthDate: _datePicker.date)
    }

    @objc private func viewDidTapped() {
        self.view.endEditing(true)
    }

    private func setViewData() {

        self.nameView.text = self.userCardInfo?.name
        self.lastNameView.text = self.userCardInfo?.surname
        self.patronymicView.text = self.userCardInfo?.patronymic
        self.ageView.text = self.userCardInfo?.age
        //        self.positionView.PAPosi = self.userCardInfo?.position
        self.experienceView.text = self.userCardInfo?.expirience
        self.infoView.text = self.userCardInfo?.info
    }

    private func setModelData() {
        
        guard let userModel = self.userCardInfo else { return }

        self.nameView.text = self.userCardInfo?.name ?? ""
        self.lastNameView.text = self.userCardInfo?.surname ?? ""
        self.patronymicView.text = self.userCardInfo?.patronymic ?? ""
        self.ageView.text = self.userCardInfo?.age ?? ""
        //        self.positionView.PAPosi = self.userCardInfo?.position
        self.experienceView.text = self.userCardInfo?.expirience ?? ""
        self.infoView.text = self.userCardInfo?.info ?? ""
    }

    // MARK: - delegate func

    func textFieldDidBeginEditing(_ textField: UITextField) {
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == self.ageView{
            self.delegate?.nameDidCganged(name: textField.text ?? "")
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {

        if textField.textContentType == .some(.emailAddress) {
            return true
        } else if textField.textContentType == .some(.telephoneNumber) {
            let currentTextField = textField.text ?? ""
            let resultText = (currentTextField as NSString).replacingCharacters(in: range,
                                                                                with: string)
            if resultText.count >= 30 {
                return false
            } else {
                return true
            }
        } else {
            return false
        }
    }

    // MARK: - actions

    @objc func saveBarButtonTapped() {
        self.navigationController?.popViewController(animated: true)
        self.setModelData()
    }

//    @IBAction func GoToMainePage(_ sender: UIBarButtonItem) {
//         self.performSegue(withIdentifier: "goToLogin", sender: self)
//    }


}
