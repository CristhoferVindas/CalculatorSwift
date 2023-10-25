//
//  ContentView.swift
//  Calculadora
//
//  Created by Cristhofer on 25/10/23.
//
import SwiftUI

struct ContentView: View {
    @State private var firstNumber = ""
    @State private var secondNumber = ""
    @State private var operation = 0
    @State private var result = 0.0
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            TextField("Ingrese el primer número", text: $firstNumber)
                .padding().textFieldStyle(RoundedBorderTextFieldStyle()).frame(width: 200)
            TextField("Ingrese el segundo número", text: $secondNumber)
                .padding().textFieldStyle(RoundedBorderTextFieldStyle()).frame(width: 200)
            
            HStack {
                Button(action: {
                    self.operation = 1 // Suma
                    self.calculate()
                }) {
                    Text("+")
                        .padding()
                }
                
                Button(action: {
                    self.operation = 2 // Resta
                    self.calculate()
                }) {
                    Text("-")
                        .padding()
                }
                
                Button(action: {
                    self.operation = 3 // Multiplicación
                    self.calculate()
                }) {
                    Text("×")
                        .padding()
                }
                
                Button(action: {
                    self.operation = 4 // División
                    self.calculate()
                }) {
                    Text("÷")
                        .padding()
                }.alert(isPresented: $showAlert){ Alert(title:Text("Diviòn") , message: Text("No se puede dividir entre 0"), dismissButton: .default(Text("Aceptar")))
                }
            }
            
            Text("Resultado: \(result)")
                .padding()
        }
        .padding()
    }
    
    func calculate() {
        if let firstNumber = Double(firstNumber), let secondNumber = Double(secondNumber) {
            switch operation {
            case 1:
                result = firstNumber + secondNumber
            case 2:
                result = firstNumber - secondNumber
            case 3:
                result = firstNumber * secondNumber
            case 4:
                if secondNumber != 0 {
                    result = firstNumber / secondNumber
                } else {
                    showAlert = true
                    result = 0
                }
            default:
                result = 0
            }
        } else {
            result = 0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
