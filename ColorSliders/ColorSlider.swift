import SwiftUI

struct ColorSlider: View {
    @State private var alertPresented = false
    @State private var isPressed = false
    @FocusState private var valueIsFocused: Bool
    @Binding var value: Double //передали начальное значение бегунка
    let color: Color //передали цвет заливки фона
    let widthSize: CGFloat = 45
    
    var body: some View {
        HStack {
            Text("\(Int(value))")
                .foregroundColor(color)
                .frame(width: widthSize)
            Slider(value: $value,  // задаем начальное положение бегунка
                   in: 0...255,  //задаем диапазон слайдера
                   step: 1) // задаем шаг бегунка
                .accentColor(color)
                .gesture(
                    DragGesture()
                        .onChanged { _ in hideKeyboard()}
                )
            TextField("", value: $value, formatter: NumberFormatter())
                .onChange(of: value) { _ in
                    print("Name changed to \(value)!")
                    showAlert(value)
                }
                .foregroundColor(color)
                .frame(width: widthSize)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .alert(isPresented: $alertPresented) {
                    Alert(
                        title: Text("Wrong Format!"),
                        message: Text("Enter your name"),
                        dismissButton: .default(Text("OK"), action: {
                            value = 0
                            hideKeyboard()
                        }))
                }
                .keyboardType(.decimalPad)
        }
        .padding(.horizontal)
    }
    
    private func showAlert(_ value: Double) {
        if value >= 0 && value <= 255 {
            alertPresented = false
        } else {
            alertPresented = true
        }
    }
}

struct ColorSlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorSlider(value: .constant(100), color: .red)
    }
}
