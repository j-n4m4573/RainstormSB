//
//  DayViewModelTests.swift
//  RainstormTests
//
//  Created by Jamar Gibbs on 12/27/20.
//

import XCTest
@testable import Rainstorm

class DayViewModelTests: XCTestCase {
    
    var viewModel: DayViewModel!

    override func setUp() {
        super.setUp()
        
        let data = loadStub(name: "darksky", extension: "json")
        
        let decoder = JSONDecoder()
        
        decoder.dateDecodingStrategy = .secondsSince1970
        
        let darkSkyResponse = try! decoder.decode(DarkSkyResponse.self, from: data)
        
        viewModel = DayViewModel(weatherData: darkSkyResponse.current)
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDate() {
        XCTAssertEqual(viewModel.date, "Sun, December 27 2020")
    }
    
    func testTime() {
        XCTAssertEqual(viewModel.time, "05:10 PM")

    }
    
    func testSummary() {
        XCTAssertEqual(viewModel.summary, "Mostly Cloudy")

    }
    
    func testTemperature() {
        XCTAssertEqual(viewModel.temperature, "52.4 °F")
    }
    
    func testWindSpeed() {
        XCTAssertEqual(viewModel.windSpeed, "5 MPH")

    }
    
    func testImage() {
        let viewModelImage = viewModel.image
        let imageDataViewModel = viewModelImage!.pngData()!
        let imageDataRefrence = UIImage(named: "cloudy")!.pngData()
        
        XCTAssertNotNil(viewModelImage)
        XCTAssertEqual(viewModelImage!.size.width, 45.0)
        XCTAssertEqual(viewModelImage!.size.height, 33.0)
        XCTAssertEqual(imageDataViewModel, imageDataRefrence)
        
    }
    
    
    
    
}










