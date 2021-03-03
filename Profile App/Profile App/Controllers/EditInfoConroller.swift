//
//  EditInfoConroller.swift
//  Profile App
//
//  Created by Настя Сойко on 2.03.21.
//

import UIKit

class EditInfoConroller: UIViewController {

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

    }

    @objc func saveBarButtonTapped() {
        self.navigationController?.popViewController(animated: true)

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
