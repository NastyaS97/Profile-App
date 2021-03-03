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
    @IBOutlet weak var ageEdit: UITextField!
    //позиция
    //опыт

    @IBOutlet weak var infoEdit: UITextView!
    @IBOutlet weak var contactButton: RoundedButtonView!

    //MARK: - life cycle

    override func viewDidLoad() {
        super.viewDidLoad()


        
    }

    //MARK: - actions

    @IBAction func shareButtonTapped(_ sender: UIBarButtonItem) {
        let text = "You tapped on share button in ProfileApp"
        guard let url = URL(string: "music.yandex.by/home") else { return }
        let activityController = UIActivityViewController(activityItems: [text, url], applicationActivities: nil)

        self.present(activityController, animated: true)
    }
}

