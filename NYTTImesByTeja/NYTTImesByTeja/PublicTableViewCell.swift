//
//  PublicTableViewCell.swift
//  NYTTImesByTeja
//
//  Created by TejaDanasvi on 5/10/21.
//

import UIKit

class PublicTableViewCell: UITableViewCell {
    var modelData: PublicEntries?
    @IBOutlet weak var apiLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var catogeryLbl: UILabel!

    static let identifier = "cell"
    static func nib() -> UINib {
        return UINib(nibName: "PublicTableViewCell", bundle: nil)
    }
    
}
