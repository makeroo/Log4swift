//
//  FileObserverTests.swift
//  Log4swift
//
//  Created by Jérôme Duquennoy on 01/01/2016.
//  Copyright © 2016 jerome. All rights reserved.
//

import XCTest
@testable import Log4swift

private class FakeObserverDelegate: FileObserverDelegate {
  var changes = Array<String>()
  let expectation: XCTestExpectation?
  
  init(expectation: XCTestExpectation? = nil) {
    self.expectation = expectation
  }
  
  func fileChanged(atPath filePath: String) {
    changes.append(filePath)
    expectation?.fulfill()
  }
}

class FileObserverTests: XCTestCase {

  override func setUp() {
    super.setUp()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  func testDelegateIsNotNotifiedIfFileIsNotModified() {
    let filePath = try! self.createTemporaryFilePath(fileExtension: "txt")
		try! "original test file content".write(toFile: filePath, atomically: false, encoding: String.Encoding.utf8)
    //    let expectation = expectationWithDescription("File modification notified")
    let delegate = FakeObserverDelegate()
    let observer = FileObserver(filePath: filePath, poolInterval: 0.1)
    observer.delegate = delegate
    
    // Execute
    // man nothing to execute : the test is to validate behavior when nothing happens.
    
		RunLoop.current.run(until: Date(timeIntervalSinceNow: 1.0))
    
    // Validate
    XCTAssertEqual(delegate.changes.count, 0, "Delegate should have received no modification notification")
  }
  
  func testDelegateIsNotifiedWhenFileChanges() {
    let filePath = try! self.createTemporaryFilePath(fileExtension: "txt")
		try! "original test file content".write(toFile: filePath, atomically: false, encoding: String.Encoding.utf8)
		let expectation = self.expectation(description: "File modification notified")
    let delegate = FakeObserverDelegate(expectation: expectation)
    let observer = FileObserver(filePath: filePath, poolInterval: 0.1)
    observer.delegate = delegate
    
    sleep(1); // the modification date resolution for file is 1 second, we should not be faster.
    
    // Execute
		try! "modified test file content".write(toFile: filePath, atomically: false, encoding: String.Encoding.utf8)
    
		waitForExpectations(timeout: Double(observer.poolInterval * 2.0), handler: nil)
    
    // Validate
    XCTAssertEqual(delegate.changes.count, 1, "Delegate should have received one modification notification")
  }
  
  func testDelegateIsNotifiedWhenNonExistingFileIsCreated() {
    let filePath = try! self.createTemporaryFilePath(fileExtension: "txt")
		let expectation = self.expectation(description: "File modification notified")
    let delegate = FakeObserverDelegate(expectation: expectation)
    let observer = FileObserver(filePath: filePath, poolInterval: 0.1)
    observer.delegate = delegate

    // Execute
		try! "modified test file content".write(toFile: filePath, atomically: false, encoding: String.Encoding.utf8)
    
		waitForExpectations(timeout: Double(observer.poolInterval * 2.0), handler: nil)
    
    // Validate
    XCTAssertEqual(delegate.changes.count, 1, "Delegate should have received one modification notification")
  }
}
