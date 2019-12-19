//
//  ElementsTests.swift
//  ElementsTests
//
//  Created by Maitree Bain on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import XCTest
@testable import Elements

class ElementsTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testingData() {
        
        let endpointURL = "https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/elements"
        
        guard let url = URL(string: endpointURL) else {
            print("no url found")
            return
        }
        
        let request = URLRequest(url: url)
        
        let expectation = XCTestExpectation(description: "elements found")
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            
            switch result{
            case .failure:
                print("no elements found")
            case .success(let data):
                expectation.fulfill()
                XCTAssertGreaterThan(data.count, 70000, "data should be greater than \(data.count)")
            }
        }
        wait(for: [expectation], timeout: 5.0)
    }

}
