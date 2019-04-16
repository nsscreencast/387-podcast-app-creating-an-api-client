//
//  SearchResult.swift
//  PodcastApp
//
//  Created by Ben Scheirman on 3/7/19.
//  Copyright © 2019 NSScreencast. All rights reserved.
//

import UIKit

class SearchResult {
    var artworkUrl: URL?
    var title: String
    var author: String

    init(artworkUrl: URL?, title: String, author: String) {
        self.artworkUrl = artworkUrl
        self.title = title
        self.author = author
    }
}
