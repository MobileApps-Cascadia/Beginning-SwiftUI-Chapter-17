import SwiftUI
struct ShareDataOneWayView: View {
    @State var message = ""
    var body: some View {
        TabView {
            TextField("Type here", text: $message)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            FileView(choice: message, backgroundColor: Color.yellow)
                .tabItem {
                    Image(systemName: "heart.square")
                    Text("First")
                }
            FileView(choice: message, backgroundColor: Color.green)
                .tabItem {
                    Image(systemName: "heart.circle")
                    Text("Second")
                }
        }.padding()
    }
}

struct FileView: View {
    var choice: String
    var backgroundColor: Color
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                Text("You typed = \(choice)")
                Spacer()
            }
            Spacer()
        }.background(backgroundColor)
    }
}

struct ShareDataOneWayView_Previews: PreviewProvider {
    static var previews: some View {
        ShareDataOneWayView()
    }
}
