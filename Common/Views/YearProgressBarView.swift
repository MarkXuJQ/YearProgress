import SwiftUI

struct YearProgressBarView: View {
    var progress: Double

    var body: some View {
        VStack {
            Text("Year Progress")
                .font(.headline)

            ProgressBar(value: progress)
                .frame(height: 20)
                .padding()
        }
    }
}

struct ProgressBar: View {
    var value: Double

    var body: some View {
        ZStack(alignment: .leading) {
            Capsule()
                .fill(Color.gray.opacity(0.2))
                .frame(height: 20)

            Capsule()
                .fill(Color.blue)
                .frame(width: CGFloat(value) * 200, height: 20)
        }
        .cornerRadius(10)
    }
}
