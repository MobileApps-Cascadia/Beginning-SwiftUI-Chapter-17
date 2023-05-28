import SwiftUI

// From ChatGPT and Apple Docs:
// Tutorial:
// https://www.fivestars.blog/articles/how-to-define-environment-values/
// https://useyourloaf.com/blog/swiftui-custom-environment-values/

// 1. Create the key with a default value
struct CustomValueKey: EnvironmentKey {
    static var defaultValue: String = "Default value"
}

// 2. Extend the environment with our property
extension EnvironmentValues {
    var customValue: String {
        get { self[CustomValueKey.self] }
        set { self[CustomValueKey.self] = newValue }
    }
}


// 3. Optional convenience view modifier
struct CustomValueKeyWithModifier: EnvironmentKey {
    static var defaultValue: String = "Default value"
}
extension EnvironmentValues {
    var customValueWithConvenienceViewModifier: String {
        get { self[CustomValueKeyWithModifier.self] }
        set { self[CustomValueKeyWithModifier.self] = newValue }
    }
}
// Now all views have a .customStringModifier modifier we can use
extension View {
  func customStringModifier(_ val: String) -> some View {
    environment(\.customValueWithConvenienceViewModifier, val)
  }
}

struct ParentView: View {
    var body: some View {
        CustomEnvKeyDemo()
        // 4. Use the .environment() modifier to set the env key:
            .environment(\.customValue, "Hello, SwiftUI!")
        // 4B. (Alternately, use the convenience modifier (if we set it up)
            .customStringModifier("Defined at the parent, used in the children")
    }
}


struct CustomEnvKeyDemo: View {
    // 5. Use @Environment to retrieve the current setting
    @Environment(\.customValue) var customValue
    @Environment(\.customValueWithConvenienceViewModifier) var customValueWithHandyDandyModifier
    
    var body: some View {
        TabView {
            VStack {
                Text(customValue)
                    .font(.largeTitle)
                    .padding()
                Text(customValueWithHandyDandyModifier)
                    .font(.largeTitle)
                    .padding()
            }
            .tabItem {
                Image(systemName: "1.circle")
                Text("Custom Env Key")
            }
            EnvKeyFileView()
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("EnvKeyFile")
                }
        }
        .padding()
    }
}

struct EnvKeyFileView: View {
    @Environment(\.customValue) var customValue

    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                //TextField("Type here:", text: $customValue)
                Text(customValue)
                Spacer()
            }
            Spacer()
        }.background(Color.yellow)
    }
}
struct EnvironmentKeyLookupView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView()
    }
}
