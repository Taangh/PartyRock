//
//  PartyCell.swift
//  PartyRock
//
//  Created by Damian on 13.09.2017.
//  Copyright © 2017 Damian. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoPreviewImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func updateUI(PartyRock: PartyRock) {
        videoTitle.text = PartyRock.videoTitle

        let url = URL(string: PartyRock.imageUrl)!
        
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
            } catch {
                //handle the error
            }
        }
    }


}
