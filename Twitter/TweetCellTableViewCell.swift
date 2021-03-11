//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Luis Renteria on 3/3/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit
import AlamofireImage

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var tweetContent: UILabel!
    
    
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBOutlet weak var favButton: UIButton!
    
    var favorited:Bool = false
    var tweetId:Int = -1
    
    
    @IBAction func favoriteTweet(_ sender: Any) {
        
        let toBeFavorited = !favorited
        
        if (toBeFavorited) {
            TwitterAPICaller.client?.favoriteTweet(tweetID: tweetId, success: {
                self.setFavorite(true)
            }, failure: { (Error) in
                print("Favorite did not suceed: \(Error)")
            })
        }
        else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetID: tweetId, success: {
                self.setFavorite(false)
            }, failure: { (Error) in
                print("Unfavorite did not succeed: \(Error)")
            })
        }
    }
    
    
    @IBAction func retweet(_ sender: Any) {
        
    }
    

    
    
    func setFavorite(_ isFavorited:Bool) {
        favorited = isFavorited
        if (favorited) {
            favButton.setImage(UIImage(named: "favor-icon-red"), for:
                                UIControl.State.normal)
        }
        else {
            favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
