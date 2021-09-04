//
//  ConfirmViewController.swift
//  correctECCedit
//
//  Created by Xcode on 8/1/21.
//

import UIKit

class ConfirmViewController: UIViewController {
    
    @IBOutlet weak var thankYouLabel: UILabel!
    @IBOutlet weak var confirmTextField: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        confirmTextField.text = "Thank you for uploading a resource or volunteer opportunity! Please wait while we review this information."

    }

}
