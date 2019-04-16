//
//  PodcastAppTests.swift
//  PodcastAppTests
//
//  Created by Ben Scheirman on 4/10/19.
//  Copyright © 2019 NSScreencast. All rights reserved.
//

import XCTest
@testable import PodcastApp

class TopPodcastsAPITests: XCTestCase {

    var client: TopPodcastsAPI!

    override func setUp() {
        client = TopPodcastsAPI()
    }

    func testFetchesData() {
        let exp = expectation(description: "API Result received")
        client.fetchTopPodcasts { result in
            exp.fulfill()
            switch result {
            case .success(let data):

                XCTAssert(data.count > 0)
                let body = String(data: data, encoding: .utf8)!
                print(body)


            case .failure(let error):
                XCTFail(error.localizedDescription)
            }

        }

        wait(for: [exp], timeout: 3.0)
    }
}
