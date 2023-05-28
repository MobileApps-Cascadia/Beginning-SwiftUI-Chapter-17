import SwiftUI

// This is an OPTIONAL EXTRA DEMO
// Feel free to look at it, if you want

// How to use environment values with bindings:
// https://stackoverflow.com/a/61847419/250610

// 1. Create the key with a default value
struct ResetDefault: EnvironmentKey {
    static var defaultValue: Binding<Bool> = .constant(false)
}

// 2. Extend the environment with our property
extension EnvironmentValues {
    var resetDefault: Binding<Bool> {
        get { self[ResetDefault.self] }
        set { self[ResetDefault.self] = newValue }
    }
}

// 3. SKIP the optional convenience view modifier


struct ParentView_Object: View {

    @State private var reset = false

    var body: some View {
        VStack {
            EnvironmentKeyLookupView_Object()
        }
        // 4. Use the .environment() modifier to set the env key:
        .environment(\.resetDefault, $reset)
    }
}

struct ResetView: View {
    // 3. Optional convenience view modifier
    @Environment(\.resetDefault) var reset
    var body: some View {
        VStack {
            if reset.wrappedValue {
                Text("Reset is true")
                    .padding()
                    .background(.green)
            } else {
                Text("Reset is false")
                    .padding()
                    .background(.red)
            }
            Button("Toggle Reset") {
                self.reset.wrappedValue.toggle() // << change wrapped !!
                print("Attempted to toggle 1: " + String(self.reset.wrappedValue) + " <<<")
            }
            .padding()
        }
    }
}

struct EnvironmentKeyLookupView_Object: View {
    var body: some View {
        VStack {
            Text("Looking up custom objects in the environment")
                .font(.largeTitle)
                .padding()
            ResetView()
        }
        .padding()
    }
}

struct EnvironmentKeyLookupView_Object_Previews: PreviewProvider {
    static var previews: some View {
        ParentView_Object()
    }
}
