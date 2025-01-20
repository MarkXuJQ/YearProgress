import WidgetKit
import SwiftUI
import YearProgressCore

struct YearProgressWidget: Widget {
    private let kind = "YearProgressWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: YearProgressProvider()) { entry in
            if #available(iOSApplicationExtension 17.0, *) {
                YearProgressWidgetView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
            } else {
                YearProgressWidgetView(entry: entry)
                    .padding()
                    .background()
            }
        }
        .configurationDisplayName("Year Progress")
        .description("Shows the current year's progress")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

struct YearProgressWidgetView: View {
    let entry: YearProgressEntry
    @Environment(\.widgetFamily) var family
    
    var body: some View {
        Group {
            switch family {
            case .systemSmall:
                YearProgressCircleView(progress: entry.progress)
                    .drawingGroup()
            case .systemMedium:
                YearProgressBarView(progress: entry.progress)
                    .drawingGroup()
            default:
                Text("Unsupported size")
            }
        }
    }
}

#Preview(as: .systemSmall) {
    YearProgressWidget()
} timeline: {
    YearProgressEntry(date: .now, progress: 0.3)
}
