import SwiftUI
import YearProgressCore

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Year Progress")
                .font(.title)
            
            YearProgressBarView(progress: YearProgressCalculator.calculate())
                .frame(height: 100)
            
            YearProgressCircleView(progress: YearProgressCalculator.calculate())
                .frame(width: 200, height: 200)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
