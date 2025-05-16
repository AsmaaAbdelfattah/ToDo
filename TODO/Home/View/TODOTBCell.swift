//
//  TODOTBCell.swift
//  TODO
//
//  Created by asma abdelfattah on 16/05/2025.
//

import UIKit

class TODOTBCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var doneHandler: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func injectCell(item: TaskEntity){
        titleLbl.text = item.title
        doneHandler.isOn = item.isDone
    }
}
