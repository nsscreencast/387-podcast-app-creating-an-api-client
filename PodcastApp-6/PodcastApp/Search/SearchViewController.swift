//
//  SearchViewController.swift
//  PodcastApp
//
//  Created by Ben Scheirman on 3/7/19.
//  Copyright © 2019 NSScreencast. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController, UISearchResultsUpdating {

    var recommendedPodcasts: [SearchResult] = [
        SearchResult(artworkUrl: URL(string: "https://is3-ssl.mzstatic.com/image/thumb/Music114/v4/95/42/da/9542da30-eaaf-ead9-ac1e-0be9da1931ab/source/200x200bb.png"), title: "The Dropout", author: "ABC News"),
        SearchResult(artworkUrl: URL(string: "https://is2-ssl.mzstatic.com/image/thumb/Music125/v4/ce/3d/b4/ce3db4c8-86ba-29ca-8cb0-4cd68388efeb/source/200x200bb.png"), title: "Dirty John", author: "L.A. Times | Wondery")
    ]

    var results: [SearchResult] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.separatorInset = .zero
        tableView.backgroundColor = Theme.Colors.gray4
        tableView.separatorColor = Theme.Colors.gray3

        results = recommendedPodcasts

        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        self.navigationItem.searchController = search
    }

    // MARK: - UISearchResultsUpdating

    func updateSearchResults(for searchController: UISearchController) {

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchResultCell = tableView.dequeueReusableCell(for: indexPath)
        let searchResult = results[indexPath.row]
        cell.configure(with: searchResult)
        return cell
    }
}
