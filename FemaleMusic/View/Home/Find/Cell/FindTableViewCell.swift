//
//  FindTableViewCell.swift
//  FemaleMusic
//
//  Created by Ferdinand on 10/01/19.
//  Copyright © 2019 Tedjakusuma. All rights reserved.
//

import UIKit

class FindTableViewCell: UITableViewCell {
    
     var productNameLabel : UILabel = {
            let lbl = UILabel()
            lbl.textColor = .black
            lbl.font = UIFont.boldSystemFont(ofSize: 16)
            lbl.textAlignment = .left
            return lbl
        }()
        
        
        private let productDescriptionLabel : UILabel = {
            let lbl = UILabel()
            lbl.textColor = .black
            lbl.font = UIFont.systemFont(ofSize: 16)
            lbl.textAlignment = .left
            lbl.numberOfLines = 0
            return lbl
        }()
    
        var productQuantity : UILabel =  {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.textAlignment = .left
            label.text = "1"
            label.textColor = .black
            return label
            
        }()
        
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)

        }
    override func awakeFromNib() {
        super.awakeFromNib()

        addSubview(productNameLabel)
        addSubview(productDescriptionLabel)
        
        addSubview(productQuantity)
        productNameLabel.anchor(top: topAnchor, left: rightAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
    }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    
    var trackItem: TrackListModel?{
        didSet{
            productNameLabel.text = trackItem?.track.trackName
            guard let trackID = trackItem?.track.trackID else { return }
            productQuantity.text = String(trackID)
        }
    }
    
}
