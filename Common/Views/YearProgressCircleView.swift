import SwiftUI

struct YearProgressCircleView: View {
    var progress: Double
    
    var body: some View {
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
