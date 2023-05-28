import SwiftUI
class ShareString: ObservableObject {
    @Published var message = ""
}
struct EnvironmentSharingView: View {
    @StateObject var showMe = ShareString()
    var body: some View {
        TabView {
            TextField("Type here", text: $showMe.message)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            EnvFileView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("First")
                }
        }
        .environmentObject(showMe)
        .padding()
    }
}
struct EnvFileView: View {
    @EnvironmentObject var choice: ShareString
    var body: some View {
        VStack {
            Text("Here's what you typed")
            TextField("Type here:", text: $choice.message)
            Text("Please try changing it!")
        }.background(Color.yellow)
    }
}
struct EnvironmentSharingView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentSharingView()
    }
}
