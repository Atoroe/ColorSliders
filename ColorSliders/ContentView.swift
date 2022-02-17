import SwiftUI

struct ContentView: View {
    @State private var redValue = Double.random(in: 0...255)
    @State private var greenValue = Double.random(in: 0...255)
    @State private var blueValue = Double.random(in: 0...255)
    
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack{
                ColorView(red: redValue, green: greenValue, blue: blueValue)
                    .padding()
                ColorSlider(value: $redValue, color: .red)
                ColorSlider(value: $greenValue, color: .green)
                ColorSlider(value: $blueValue, color: .blue)
                Spacer()
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
