//
//  StaffDetailTests.swift
//  StaffAppAssignmentTests
//
//  Created by Sekamuri Siva on 23/07/19.
//  Copyright © 2019 Bala Balaji Gowd Yelagana. All rights reserved.
//

import XCTest

class StaffDetailTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTitleAssociate() {
        let staff = Staff(id: 1, name: "Bala", title: TitleType.associate.rawValue, age: 26, hobby: nil, avatar: "ttps://twistedsifter.files.wordpress.com/2012/09/trippy-profile-pic-portrait-head-on-and-from-side-angle.jpg?")
        let staffDetailVM = StaffDetailViewModel(staff: staff)
        let rank = staffDetailVM.rank()
        XCTAssertTrue(rank == Rank.slave.rawValue)
    }
    
    func testTitleSeniorAssociate() {
        let staff = Staff(id: 1, name: "Bala", title: TitleType.seniorAssociate.rawValue, age: 26, hobby: nil, avatar: "ttps://twistedsifter.files.wordpress.com/2012/09/trippy-profile-pic-portrait-head-on-and-from-side-angle.jpg?")
        let staffDetailVM = StaffDetailViewModel(staff: staff)
        let rank = staffDetailVM.rank()
        XCTAssertTrue(rank == Rank.slave.rawValue)
    }
    
    func testTitleSeniorAvp() {
        let staff = Staff(id: 1, name: "Bala", title: "AVP", age: 26, hobby: nil, avatar: "ttps://twistedsifter.files.wordpress.com/2012/09/trippy-profile-pic-portrait-head-on-and-from-side-angle.jpg?")
        let staffDetailVM = StaffDetailViewModel(staff: staff)
        let rank = staffDetailVM.rank()
        XCTAssertTrue(rank == Rank.boss.rawValue)
    }
    
    func testTitleSeniorVp() {
        let staff = Staff(id: 1, name: "Bala", title: "VP", age: 26, hobby: nil, avatar: "ttps://twistedsifter.files.wordpress.com/2012/09/trippy-profile-pic-portrait-head-on-and-from-side-angle.jpg?")
        let staffDetailVM = StaffDetailViewModel(staff: staff)
        let rank = staffDetailVM.rank()
        XCTAssertTrue(rank == Rank.boss.rawValue)
    }
    
    func testTitleSeniorDevFalseCase() {
        let staff = Staff(id: 1, name: "Bala", title: "Dev", age: 26, hobby: nil, avatar: "ttps://twistedsifter.files.wordpress.com/2012/09/trippy-profile-pic-portrait-head-on-and-from-side-angle.jpg?")
        let staffDetailVM = StaffDetailViewModel(staff: staff)
        let rank = staffDetailVM.rank()
        XCTAssertFalse(rank == Rank.boss.rawValue || rank == Rank.slave.rawValue)
    }
    
    func testTitleSeniorDevTrueCase() {
        let staff = Staff(id: 1, name: "Bala", title: "Dev", age: 26, hobby: nil, avatar: "ttps://twistedsifter.files.wordpress.com/2012/09/trippy-profile-pic-portrait-head-on-and-from-side-angle.jpg?")
        let staffDetailVM = StaffDetailViewModel(staff: staff)
        let rank = staffDetailVM.rank()
        XCTAssertTrue(rank == "N/A")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
