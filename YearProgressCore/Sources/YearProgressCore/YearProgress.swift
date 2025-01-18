import Foundation
import SwiftUI

public struct YearProgressCalculator {
    public static func calculate() -> Double {
        let currentDate = Date()
        let calendar = Calendar.current
        
        let year = calendar.component(.year, from: currentDate)
        let startOfYear = calendar.date(from: DateComponents(year: year))!
        let endOfYear = calendar.date(from: DateComponents(year: year + 1))!
        
        let totalDuration = endOfYear.timeIntervalSince(startOfYear)
        let elapsedTime = currentDate.timeIntervalSince(startOfYear)
        
        return min(max(elapsedTime / totalDuration, 0), 1)
    }
}

public struct YearProgressBarView: View {
    public let progress: Double
    
    public init(progress: Double) {
        self.progress = progress
    }
    
    public var body: some View {
        VStack {
            Text("\(Int(progress * 100))%")
                .font(.title)
                .bold()
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(Color.gray.opacity(0.2))
                        .frame(height: 20)
                    
                    Capsule()
                        .fill(Color.blue)
                        .frame(width: geometry.size.width * CGFloat(progress), height: 20)
                }
            }
            .frame(height: 20)
            .padding()
            
            Text("of \(Calendar.current.component(.year, from: Date()))")
                .font(.caption)
        }
    }
}

public struct YearProgressCircleView: View {
    public let progress: Double
    
    public init(progress: Double) {
        self.progress = progress
    }
    
    public var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.2), lineWidth: 10)
            
            Circle()
                .trim(from: 0, to: CGFloat(progress))
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .rotationEffect(.degrees(-90))
            
            VStack {
                Text("\(Int(progress * 100))%")
                    .font(.title)
                    .bold()
                Text("of \(Calendar.current.component(.year, from: Date()))")
                    .font(.caption)
            }
        }
        .padding()
    }
} 