//
//  CustomTextField2.swift
//  CustomTextFieldEmoChat
//
//  Created by Nikolay Dementiev on 08.06.17.
//  Copyright © 2017 mc373. All rights reserved.
//
//https://stackoverflow.com/a/42082398/6643923

import UIKit

//@IBDesignable
class CustomTextFieldWithPopOverInfoBox: UITextField {

    private lazy var dataContainer = {
        return HelperForCustomTextFieldWithPopOverInfoBox()
    }()

    var image: UIImage?
    var btnQuestion:UIButton?
    var textInfoForQuestionLabel: String?

    //    @IBInspectable
    var imageQuestionShowed: Bool = false {
        didSet {
            hideOrShowImageQuestion()
        }
    }

    var imgLeftInset: CGFloat = 0
    var imgTopInset: CGFloat = 0
    var imgBottomInset: CGFloat = 0

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    //MARK: question mark button
    private func commonInit() {
        clipsToBounds = true

        imgLeftInset = dataContainer.imgLeftInset
        imgTopInset = dataContainer.imgTopInset
        imgBottomInset = dataContainer.imgBottomInset

        image = dataContainer.questionImage//UIImage(named: "question")

        let weight = self.bounds.height - (imgTopInset + imgBottomInset)

        btnQuestion = UIButton(type: .custom)
        if let notNullQuestionBtn = btnQuestion{
            notNullQuestionBtn.addTarget(self,
                                         action: #selector(self.openPopOverVC),
                                         for: .touchUpInside)
            notNullQuestionBtn.frame = CGRect(x: imgLeftInset,
                                              y: imgTopInset,
                                              width: weight,
                                              height: weight)
            notNullQuestionBtn.setBackgroundImage(image, for: .normal)
        }

        leftView = btnQuestion

        hideOrShowImageQuestion()
    }

    func hideOrShowImageQuestion() {
        if imageQuestionShowed {
            //hide it
            hideQuestionImage()
        } else {
            //show it
            showQuestionImage()
        }
    }

    func showQuestionImage() {

        leftViewMode = .always
    }

    func hideQuestionImage() {

        self.leftViewMode = .never
    }

    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {

        var textRect:CGRect  = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += imgLeftInset

        return textRect;
    }

    //MARK: popOverVindow

    func openPopOverVC() {
        if  let vcPopOver = UIStoryboard(name: "PopOverView", bundle: nil).instantiateViewController(withIdentifier: "popoverViewController") as? PopUpViewController {

            if let notNullVCOwner:UIViewController = firstAvailableUIViewController(),
                notNullVCOwner is MyViewController {

                // Present the view controller using the popover style.
                vcPopOver.modalPresentationStyle = .popover
                vcPopOver.preferredContentSize = self.bounds.size
                //CGSize(width: 50, height: 50)


                vcPopOver.infoLabelText = textInfoForQuestionLabel

                vcPopOver.view.backgroundColor = dataContainer.popOverVCBackgroundColor

//                notNullVCOwner.present(vcPopOver, animated: true, completion: nil)

                if let notNullBtnQuestion = btnQuestion,
                    let popoverPresentationController = vcPopOver.popoverPresentController {

                    popoverPresentationController.sourceView = notNullBtnQuestion
                    popoverPresentationController.sourceRect = notNullBtnQuestion.bounds
                    popoverPresentationController.permittedArrowDirections = .down//.any
                    popoverPresentationController.delegate = notNullVCOwner as? UIPopoverPresentationControllerDelegate
                    popoverPresentationController.backgroundColor = dataContainer.popOverCOntrollerBackgroundColor

                }

                notNullVCOwner.present(vcPopOver, animated: true, completion: nil)
            }
        }
    }

}

fileprivate struct HelperForCustomTextFieldWithPopOverInfoBox {
    //http://colorhunt.co/c/71302
    let popOverVCBackgroundColor:UIColor = UIColor(red: 255,green: 211,blue: 182)
    let popOverCOntrollerBackgroundColor:UIColor = UIColor(red: 255,green: 170,blue: 165)
    let textColorPopOver:UIColor = UIColor.black

    let imgLeftInset: CGFloat = 5.0
    let imgTopInset: CGFloat = 3.0
    let imgBottomInset: CGFloat = 3.0

    let questionImage = UIImage(named: "question")

}


//MARK:- Trash code

//func openPopOverVC() {
//    //        let popoverViewController = storyboard.instantiateViewControllerWithIdentifier("popoverViewController")
//    //
//    //            popoverViewController.modalPresentationStyle = UIModalPresentationStyle.popover
//    //            popoverViewController.popoverPresentationController!.delegate = self
//
//    //        find vc where text field setted
//
//
//
//    if
//        let vcPopOver = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popoverViewController") as? PopUpViewController {
//
//        //            let vcPopOver = PopUpViewController() as PopUpViewController
//
//
//
//        //            viewController.newsObj = newsObj
//        //            if let navigator = navigationController {
//        //                navigator.pushViewController(viewController, animated: true)
//        //            }
//
//        //            present(viewController, animated: true, completion: nil)
//
//        //            vcPopOver.modalPresentationStyle = UIModalPresentationStyle.popover
//        //            vcPopOver.popoverPresentationController!.delegate = self
//
//        //            let svc = StartViewController()
//        //            vcPopOver.modalTransitionStyle = .crossDissolve
//        //            presentViewController(vcPopOver, animated: true, completion: nil)
//
//        if let notNullVCOwner:UIViewController = firstAvailableUIViewController() {
//
//            //                vcPopOver.modalPresentationStyle = UIModalPresentationStyle.popover
//            //                vcPopOver.preferredContentSize = CGSize(width: 200, height: 200)
//            //
//            //                vcPopOver.popoverPresentationController!.delegate = notNullVCOwner as? UIPopoverPresentationControllerDelegate
//            //
//            //                notNullVCOwner.present(vcPopOver, animated: true, completion: nil)
//
//
//            // Present the view controller using the popover style.
//            vcPopOver.modalPresentationStyle = .popover
//            vcPopOver.preferredContentSize = CGSize(width: 400, height: 400)
//
//            //notNullVCOwner.present(vcPopOver, animated: true, completion: nil)
//
//            if let notNullBtnQuestion = btnQuestion,
//                let popoverPresentationController = vcPopOver.popoverPresentController {
//
//                popoverPresentationController.sourceView = notNullBtnQuestion
//                popoverPresentationController.sourceRect = //CGRect(x: 0, y: 0, width:  nutNullBtnQuestion.frame.size.width, height: nutNullBtn Question.frame.size.height)
//                    notNullBtnQuestion.bounds
//                popoverPresentationController.permittedArrowDirections = .any
//                //                    popoverPresentationController?.delegate = self
//            }
//
//            notNullVCOwner.present(vcPopOver, animated: true, completion: nil)
//
//
//
//            //                // Get the popover presentation controller and configure it.
//            //                UIPopoverPresentationController *presentationController =
//            //                    [myPopoverViewController popoverPresentationController];
//            //                presentationController.permittedArrowDirections =
//            //                    UIPopoverArrowDirectionLeft | UIPopoverArrowDirectionRight;
//            //                presentationController.sourceView = myView;
//            //                presentationController.sourceRect = sourceRect;
//
//
//
//
//            //                let popoverVC = vcPopOver.popoverPresentationController
//            //                popoverVC!.permittedArrowDirections = .any
//            //                popoverVC!.delegate = self
//            //                popoverVC!.sourceView = self.btnQuestion
//            //                notNullVCOwner.popoverPresentationController = vcPopOver
//
//
//            /*
//             let popoverMenuViewController = addFriendsPopoverViewController.popoverPresentationController
//             popoverMenuViewController!.permittedArrowDirections = .Any
//             popoverMenuViewController!.delegate = self
//             popoverMenuViewController!.sourceView = self.view
//             popoverMenuViewController!.sourceRect = CGRect(
//             x: 50,
//             y: 50,
//             width: 1,
//             height: 1)
//             presentViewController(
//             addFriendsPopoverViewController,
//             animated: true,
//             completion: nil)
//             */
//        }
//        
//    }
//    
//}
