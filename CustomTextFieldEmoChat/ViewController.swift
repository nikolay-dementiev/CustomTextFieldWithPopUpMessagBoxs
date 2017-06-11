//
//  ViewController.swift
//  CustomTextFieldEmoChat
//
//  Created by Nikolay Dementiev on 08.06.17.
//  Copyright © 2017 mc373. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tex2: CustomTextFieldWithPopOverInfoBox!

    @IBAction func button2Pressed(_ sender: UIButton) {
        tex2?.imageQuestionShowed = false
    }
    @IBAction func button3Showed(_ sender: UIButton) {
        tex2?.imageQuestionShowed = true
    }

    @IBAction func showpopUpQuestionBox(_ sender: UIButton) {
        tex2?.openPopOverVC()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}

