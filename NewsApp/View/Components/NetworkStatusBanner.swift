import SwiftUI

struct NetworkStatusBanner: View {
    var body: some View {
        HStack {
            Image(systemName: "wifi.slash")
            Text("No Internet Connection")
                .font(.headline)
        }
        .foregroundColor(.white)
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.red)
        .transition(.move(edge: .top))
    }
}

#Preview {
    NetworkStatusBanner()
}
