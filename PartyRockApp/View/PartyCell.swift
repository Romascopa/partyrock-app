//
//  PartyCell.swift
//  PartyRockApp
//
//  Created by Lance Robbins on 11/29/17.
//  Copyright © 2017 Appcation. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    
    @IBOutlet weak var videoPreviewImage: UIImageView!
    
    @IBOutlet weak var videoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func updateUI(partyRock: PartyRock) {
        videoTitle.text = partyRock.videoTitle
        
        // grab url
        
        let url = URL(string: partyRock.imageURL)!
        
        // use async thread to download images
        DispatchQueue.global().async{
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
            } catch {
                //
            }
        }
    }

}
