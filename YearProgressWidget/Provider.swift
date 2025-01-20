import WidgetKit
import SwiftUI
import YearProgressCore

struct YearProgressEntry: TimelineEntry {
    let date: Date
    let progress: Double
}

struct YearProgressProvider: TimelineProvider {
    typealias Entry = YearProgressEntry
    
    func placeholder(in context: Context) -> YearProgressEntry {
        YearProgressEntry(date: Date(), progress: 0.5)
    }

    func getSnapshot(in context: Context, completion: @escaping (YearProgressEntry) -> ()) {
        autoreleasepool {
            let entry = YearProgressEntry(date: Date(), progress: YearProgressCalculator.calculate())
            completion(entry)
        }
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        autoreleasepool {
            let currentDate = Date()
            let entry = YearProgressEntry(date: currentDate, progress: YearProgressCalculator.calculate())
            
            // Update every hour
            let nextUpdateDate = Calendar.current.date(byAdding: .hour, value: 1, to: currentDate) ?? currentDate.addingTimeInterval(3600)
            
            // Create timeline with a single entry to minimize memory usage
            let timeline = Timeline(entries: [entry], policy: .after(nextUpdateDate))
            completion(timeline)
        }
    }
} 