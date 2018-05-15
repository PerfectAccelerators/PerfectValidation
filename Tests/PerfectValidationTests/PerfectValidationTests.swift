import XCTest
@testable import PerfectValidation

final class PerfectValidationTests: XCTestCase {
    
    func testAccountValidation() {
        let acc = Account(name: "", pass: "", email: "email@email.com")
        let result = acc.validate()
        XCTAssertNil(result)
    }

    static var allTests = [
        ("testAccountValidation", testAccountValidation),
    ]
}
