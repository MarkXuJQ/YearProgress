import SwiftUI

struct IconGenerator: View {
    var body: some View {
        ZStack {
            // Background
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.1, green: 0.1, blue: 0.5),
                    Color(red: 0, green: 0, blue: 0)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
            // Progress Circle
            Circle()
                .trim(from: 0, to: 0.75) // Example progress
                .stroke(Color.white, style: StrokeStyle(lineWidth: 12, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .frame(width: 80, height: 80)
            
            // Percentage Text
            Text("75%")
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .foregroundColor(.white)
        }
        .frame(width: 1024, height: 1024) // App Store size
        .background(Color(red: 1, green: 1, blue: 1))
    }
}

#Preview {
    IconGenerator()
        .frame(width: 200, height: 200) // Preview size
} 
