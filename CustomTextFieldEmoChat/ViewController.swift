//
//  ViewController.swift
//  CustomTextFieldEmoChat
//
//  Created by Nikolay Dementiev on 08.06.17.
//  Copyright © 2017 mc373. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var text1: CustomTextField!
    @IBOutlet weak var tex2: CustomTextField2!
    @IBAction func button2Pressed(_ sender: UIButton) {
        tex2?.imageQuestionShowed = false
    }
    @IBAction func button3Showed(_ sender: UIButton) {
        tex2?.imageQuestionShowed = true
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

