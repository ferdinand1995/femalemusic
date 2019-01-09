//
//  FindTableViewCell.swift
//  FemaleMusic
//
//  Created by Ferdinand on 10/01/19.
//  Copyright © 2019 Tedjakusuma. All rights reserved.
//

import UIKit

class FindTableViewCell: UITableViewCell {

    @IBOutlet weak var trackSong: UILabel!
    @IBOutlet weak var wishlistButton: UIButton!
    @IBOutlet weak var idSong: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var track: Track?{
        didSet{
            trackSong.text = track?.trackName
            guard let trackID = track?.trackID else { return }
            idSong.text = String(trackID)
        }
    }
    
}
