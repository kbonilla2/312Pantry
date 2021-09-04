//
//  VolunteerTVC.swift
//  correctECCedit
//
//  Created by Leona  Meharenna on 7/27/21.
//

import UIKit

class VolunteerTVC: UITableViewCell {

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
            
    @IBOutlet weak var volunteerView: UIView!
    
    @IBOutlet weak var volunteerExample: UILabel!
    @IBOutlet weak var volunteerDescrip: UILabel!
    
}
