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

    @IBOutlet weak var surnameEdit: AnotherPartOfView!
    @IBOutlet weak var nameEdit: AnotherPartOfView!
    @IBOutlet weak var patronymicEdit: AnotherPartOfView!
    @IBOutlet weak var ageEdit: AnotherPartOfView!
    @IBOutlet weak var positionEdit: TitleDescriptionView!
    @IBOutlet weak var experienceEdit: TitleDescriptionView!
    @IBOutlet weak var infoEdit: AnotherPartOfView!
    @IBOutlet weak var contactButton: RoundedButtonView!

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
        self.nameEdit.nameText = self.userCard.name
        self.surnameEdit.surnameText = self.userCard.surname
        self.patronymicEdit.patronymicText = self.userCard.patronymic
        self.ageEdit.ageText = self.userCard.age
        self.positionEdit.positionText = self.userCard.position.rawValue
        self.experienceEdit.positionText = self.userCard.expirience
        self.infoEdit.infoText = self.userCard.info
    }

    //MARK: - actions

    @IBAction func shareButtonTapped(_ sender: UIBarButtonItem) {
        let text = "You tapped on share button in ProfileApp"
        guard let url = URL(string: "music.yandex.by/home") else { return }
        let activityController = UIActivityViewController(activityItems: [text, url], applicationActivities: nil)

        self.present(activityController, animated: true)
    }

    //MARK: - prepare for egut
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "editProfile":
            if let controller = segue.destination as? EditInfoConroller {
                controller.userCardInfo = self.userCard
            }
        default:
            break
        }
    }
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        print(unwindSegue.destination)
    }
}
