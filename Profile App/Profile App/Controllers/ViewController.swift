//
//  ViewController.swift
//  Profile App
//
//  Created by Настя Сойко on 1.03.21.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - variables

    let userCard = PACardInfo()

    //MARK: - gui variables

    @IBOutlet weak var surnameEdit: UILabel!
    @IBOutlet weak var nameEdit: UILabel!
    @IBOutlet weak var patronymicEdit: UILabel!
    @IBOutlet weak var ageEdit: UILabel!
    @IBOutlet weak var positionEdit: TitleDescriptionView!
    @IBOutlet weak var experienceEdit: TitleDescriptionView!
    @IBOutlet weak var infoEdit: UITextView!
    @IBOutlet weak var contactButton: UIButton!

    //MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setViewData()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        self.setViewData()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }

    //MARK: - actions

    func setViewData() {
        self.nameEdit.text = self.userCard.name
        self.surnameEdit.text = self.userCard.surname
        self.patronymicEdit.text = self.userCard.patronymic
        self.ageEdit.text = self.userCard.age
        self.positionEdit.developerText = self.userCard.position.rawValue
        self.experienceEdit.developerText = self.userCard.expirience
        self.infoEdit.text = self.userCard.info
    }

    

    //MARK: - actions

    @IBAction func shareButtonTapped(_ sender: UIBarButtonItem) {
        let text = "You tapped on share button in ProfileApp"
        guard let url = URL(string: "music.yandex.by/home") else { return }
        let activityController = UIActivityViewController(activityItems: [text, url], applicationActivities: nil)

        self.present(activityController, animated: true)
    }

    //MARK: - prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "editProfile":
            if let controller = segue.destination as? EditInfoConroller {
                controller.userCard = self.userCard // передача информация между контроллерами
            }
        case "saveAndEditSegue":
            if let controller = segue.destination as? EditInfoConroller {
                controller.userCard = self.userCard // передача информация между контроллерами
            }
        default:
            break
        }
    }

    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        print(unwindSegue.destination)
    }
}
