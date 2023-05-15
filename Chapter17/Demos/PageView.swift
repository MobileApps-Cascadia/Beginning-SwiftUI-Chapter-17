import SwiftUI
struct PageView: View {
    var body: some View {
        TabView {
            Text("One")
                .tabItem {
                    Image(systemName: "heart.fill")
                }
            Text("Two")
                .tabItem {
                    Image(systemName: "hare.fill")
                }
            Text("Three")
                .tabItem {
                    Image(systemName: "tortoise.fill")
                }
            Text("Four")
                .tabItem {
                    Image(systemName: "folder.fill")
                }
            Text("Five")
                .tabItem {
                    Image(systemName: "tray.fill")
                }
            Text("Six")
                .tabItem {
                    Image(systemName: "keyboard.fill")
                }
        }
        .tabViewStyle(.page)
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}
struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView()
    }
}
