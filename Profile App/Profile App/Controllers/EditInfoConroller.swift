//
//  EditInfoConroller.swift
//  Profile App
//
//  Created by Настя Сойко on 2.03.21.
//

import UIKit

class EditInfoConroller: UIViewController {

    var userCardInfo: PACardInfo?
    
    @IBOutlet weak var nameView: UITextField!
    @IBOutlet weak var lastNameView: UITextField!
    @IBOutlet weak var patronymicView: UITextField!
    @IBOutlet weak var ageView: UITextField!
    @IBOutlet weak var positionView: UITextField!
    @IBOutlet weak var experienceView: UITextField!
    @IBOutlet weak var infoView: UITextView!
    @IBOutlet weak var saveView: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        //       let recognizer = UITapGestureRecognizer(target: self,
        //                                               action: #selector(saveBarButtonTapped))
        //
        //        saveView.addGestureRecognizer(recognizer)

        self.setViewData()
    }

    // MARK: - setting view data

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

    // MARK: - actions

    @objc func saveBarButtonTapped() {
        self.navigationController?.popViewController(animated: true)
        self.setModelData()
    }

//    @IBAction func GoToMainePage(_ sender: UIBarButtonItem) {
//         self.performSegue(withIdentifier: "goToLogin", sender: self)
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
