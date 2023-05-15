import SwiftUI
struct SelectingTabView: View {
    @State var selectedView = 1
    var body: some View {
        VStack {
            HStack {
                Button ("1") {
                    selectedView = 1
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.red)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                
                Button ("2") {
                    selectedView = 2
                }
                .padding()
                .foregroundColor(.black)
                .background(Color.orange)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                
                Button ("3") {
                    selectedView = 3
                }
                .padding()
                .foregroundColor(.black)
                .background(Color.yellow)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                
                Button ("4") {
                    selectedView = 4
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.green)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            }
            TabView (selection: $selectedView){
                Text("One")
                    .tabItem {
                        Image(systemName: "heart.fill")
                        Text("One")
                    }.tag(1)
                Text("Two")
                    .tabItem {
                        Image(systemName: "hare.fill")
                        Text("Two")
                    }.tag(2)
                Text("Three")
                    .tabItem {
                        Image(systemName: "tortoise.fill")
                        Text("Three")
                    }.tag(3)
                Text("Four")
                    .tabItem {
                        Image(systemName: "folder.fill")
                        Text("Four")
                    }.tag(4)
            }
        }
    }
}
struct SelectingTabView_Previews: PreviewProvider {
    static var previews: some View {
        SelectingTabView()
    }
}
