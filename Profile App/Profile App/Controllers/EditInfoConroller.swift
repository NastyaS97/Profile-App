//
//  EditInfoConroller.swift
//  Profile App
//
//  Created by Настя Сойко on 2.03.21.
//

import UIKit

class EditInfoConroller: UIViewController, UITextFieldDelegate {

    var userCard: PACardInfo? // модель для передачи данных

    @IBOutlet weak var nameView: UITextField!
    @IBOutlet weak var lastNameView: UITextField!
    @IBOutlet weak var patronymicView: UITextField!
    @IBOutlet weak var ageView: UITextField! {
        didSet {
            self.ageView.inputView = self.dataPickerForAge
        }
    }
    @IBOutlet weak var positionView: UITextField!
    @IBOutlet weak var experienceView: UITextField! {
        didSet {
            self.experienceView.inputView = self.dataPickerForExperience
        }
    }
    @IBOutlet weak var infoView: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var saveView: UIBarButtonItem!

    private lazy var dataPickerForAge: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .wheels
        picker.maximumDate = Date()
        picker.addTarget(self,
                         action: #selector(agePickerValueChanged),
                         for: .valueChanged)

        return picker
    }()

    private lazy var dataPickerForExperience: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .wheels
        picker.maximumDate = Date()
        picker.addTarget(self,
                         action: #selector(agePickerValueChanged),
                         for: .valueChanged)

        return picker
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.nameView.becomeFirstResponder()

        // MARK: - added save button

        self.saveButton.addTarget(self, action: #selector(self.saveButtonTapped), for: .touchUpInside)

        self.setViewData()

        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                              action: #selector(self.viewDidTapped)))

        // MARK: - added picker and firstResponder

    self.nameView.becomeFirstResponder() // при переходе на контроллер первым появляется...
        
    }

    // MARK: - setting view data

    private func setViewData() {

        self.nameView.text = self.userCard?.name
        self.lastNameView.text = self.userCard?.surname
        self.patronymicView.text = self.userCard?.patronymic
        self.ageView.text = self.userCard?.age
//        self.positionView. = self.userCardInfo?.position
        self.experienceView.text = self.userCard?.expirience
        self.infoView.text = self.userCard?.info
    }

    private func setModelData() {
        guard let userModel = self.userCard else { return }
        self.nameView.text = self.userCard?.name ?? ""
        self.lastNameView.text = self.userCard?.surname ?? ""
        self.patronymicView.text = self.userCard?.patronymic ?? ""
        self.ageView.text = self.userCard?.age ?? ""
        self.positionView.text = self.userCard?.position.rawValue ?? ""
        self.experienceView.text = self.userCard?.expirience ?? ""
        self.infoView.text = self.userCard?.info ?? ""
    }

    // MARK: - func

    func textFieldDidBeginEditing(_ textField: UITextField) {
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    // MARK: - actions

    @objc private func saveButtonTapped() {
        self.setModelData()
        self.navigationController?.popViewController(animated: true)
    }

    @objc private func agePickerValueChanged(_datePicker: UIDatePicker) {
        self.ageView.text = dataPickerForAge.date.toInt
        self.experienceView.text = dataPickerForExperience.date.toInt

//        self.delegate?.ageDidChanged(picker: dataPicker, birthDate: _datePicker.date)
//        self.delegate?.experienceDidChanged(picker: dataPicker, birthDate: _datePicker.date)
    }

    @objc private func viewDidTapped() {
        self.view.endEditing(true)
    }
}
