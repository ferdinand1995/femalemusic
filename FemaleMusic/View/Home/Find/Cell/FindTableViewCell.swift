//
//  FindTableViewCell.swift
//  FemaleMusic
//
//  Created by Ferdinand on 11/01/19.
//  Copyright © 2019 Tedjakusuma. All rights reserved.
//

import UIKit

class FindTableViewCell: UITableViewCell {

    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var trackList: TrackListModel? {
        didSet{
            songTitle.text = trackList?.track.trackName
            guard let artist = trackList?.track.artistName else { return }
            artistName.text = String(artist)
        }
    }
    
}
