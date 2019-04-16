//
//  SearchResultCell.swift
//  PodcastApp
//
//  Created by Ben Scheirman on 3/7/19.
//  Copyright © 2019 NSScreencast. All rights reserved.
//

import UIKit
import Kingfisher

class SearchResultCell : UITableViewCell {
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var podcastTitleLabel: UILabel!
    @IBOutlet weak var podcastAuthorLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        artworkImageView.backgroundColor = Theme.Colors.gray3
        artworkImageView.layer.cornerRadius = 10
        artworkImageView.layer.masksToBounds = true

        backgroundColor = Theme.Colors.gray4
        backgroundView = UIView()
        backgroundView?.backgroundColor = Theme.Colors.gray4

        selectedBackgroundView = UIView()
        selectedBackgroundView?.backgroundColor = Theme.Colors.gray3

        podcastTitleLabel.textColor = Theme.Colors.gray0
        podcastAuthorLabel.textColor = Theme.Colors.gray1
    }

    func configure(with result: SearchResult) {
        
        podcastTitleLabel.text = result.title
        podcastAuthorLabel.text = result.author

        print(ImageCache.default.cachePath(forKey: "foo"))

        if let url = result.artworkUrl {
            let options: KingfisherOptionsInfo = [
                .transition(.fade(0.5))
            ]
            artworkImageView.kf.setImage(with: url, options: options)
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        podcastTitleLabel.text = nil
        podcastAuthorLabel.text = nil

        artworkImageView.kf.cancelDownloadTask()
        artworkImageView.image = nil
    }
}
