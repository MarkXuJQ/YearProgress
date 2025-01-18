import XCTest
@testable import YearProgressCore

final class YearProgressCoreTests: XCTestCase {
    func testCalculateYearProgress() {
        let progress = YearProgressCalculator.calculate()
        XCTAssertGreaterThanOrEqual(progress, 0)
        XCTAssertLessThanOrEqual(progress, 1)
    }
} 