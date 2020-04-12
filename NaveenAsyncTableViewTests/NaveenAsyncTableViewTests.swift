//
//  NaveenAsyncTableViewTests.swift
//  NaveenAsyncTableViewTests
//
//  Created by Naveen Chandra on 09/04/20.
//  Copyright © 2020 Naveen Chandra. All rights reserved.
//

import XCTest
@testable import NaveenAsyncTableView

class NaveenAsyncTableViewTests: XCTestCase {
    
    var dataList: DemoModel?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        //get a sample from api and feed in file
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "DemoJSON", withExtension: "json"),
            let data = try? Data(contentsOf: url) else {
                return
        }
        
        let decoder = JSONDecoder()
        dataList = try? decoder.decode(DemoModel.self, from: data)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testProductionServiceRunning() {
        // Put the code you want to measure the time of here.
        setUp()
        let expectation = self.expectation(description: "Get Facts abouts Canada's service is failed and we don't receive correct response")
        NetworkManager.fetchData { result in
            switch result {
            case .success(let data):
                XCTAssertNotNil(data)
                expectation.fulfill()
            default:
                XCTFail("Expected get facts service response with error json")
            }
        }
        self.waitForExpectations(timeout: 6.0)
    }
    
    
    func testFactsTitle() {
        XCTAssertEqual(dataList?.title!, "About Canada")
    }
    
    
    func testImageIsDownloaded() {
        let expectation = self.expectation(description: "Image should be download")



        guard let imageUrl = dataList!.rows?.first?.imageHref else
        {
            XCTFail("failed to get url")
            return
        }


        NetworkManager.downloadImage(url: URL(fileURLWithPath: imageUrl)) { data in
            XCTAssertNotNil(data)
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 6.0)
    }
    
}
