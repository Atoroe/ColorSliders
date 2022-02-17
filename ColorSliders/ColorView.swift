import SwiftUI

struct ColorView: View {
    var red: Double
    var green: Double
    var blue: Double
    
    var body: some View {
        Color(red: red/255, green: green/255, blue: blue/255)
            .frame(height: 200)
            .cornerRadius(40)
            .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.white, lineWidth: 4))
            .padding()
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(red: 132, green: 200, blue: 100)
    }
}
