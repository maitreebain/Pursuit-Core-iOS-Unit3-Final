//
//  ElementsTest.swift
//  ElementsTest
//
//  Created by Maitree Bain on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import XCTest
@testable import ElementsTest

class ElementsTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testElementCount() {
        
        let data = 
        
        let expectedCount = 100
        
        do {
            let elements = try JSONDecoder().decode([ElementsDataLoad].self, from: data)
        }
        
    }

}
