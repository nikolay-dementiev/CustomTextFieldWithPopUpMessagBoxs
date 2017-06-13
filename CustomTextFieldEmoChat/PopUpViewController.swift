//
//  PopUpVievController.swift
//  CustomTextFieldEmoChat
//
//  Created by Nikolay Dementiev on 09.06.17.
//  Copyright © 2017 mc373. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!

    var infoLabelText:String?

    var popoverPresentController: UIPopoverPresentationController? {
        return popoverPresentationController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupInitData()
    }

    func setupInitData() {
        if let notNullInfoLabelText = infoLabelText {
            infoLabel.text = notNullInfoLabelText
        }
    }

}
