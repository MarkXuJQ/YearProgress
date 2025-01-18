import Foundation

func calculateYearProgress() -> Double {
    let currentDate = Date()
    let calendar = Calendar.current
    
    let year = calendar.component(.year, from: currentDate)
    let startOfYear = calendar.date(from: DateComponents(year: year))!
    let endOfYear = calendar.date(from: DateComponents(year: year + 1))!
    
    let totalDuration = endOfYear.timeIntervalSince(startOfYear)
    let elapsedTime = currentDate.timeIntervalSince(startOfYear)
    
    return min(max(elapsedTime / totalDuration, 0), 1)
}
