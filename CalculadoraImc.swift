//
//  CalculadoraImc.swift
//  aula01
//
//  Created by Turma02-3 on 11/07/24.
//

import SwiftUI

struct CalculadoraImc: View {
    @State var weight: Double = 0.0
    @State var height: Double = 0.0
    @State private var color: Color = .lemonopaque
    @State private var classification: String = "Normal"
    
    func calculateImc() -> Double {
        return Double(weight) / (height * height)
    }
    
    func getRating(imc: Double) {
        if imc < 18.5 { 
            classification = "Baixo Peso"
            color = .lemonopaque
        } else if imc < 25 {
            classification = "Normal"
            color = .lemon
        } else if imc < 30 {
            classification = "Sobrepeso"
            color = .mostardopaque
        }
        else if imc >= 30 {
            classification = "Obesidade"
            color = .mostard
        }
    }
    
    var body: some View {
        ZStack {
            color.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Calculadora de IMC")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                TextField("Enter your weight", value: $weight, format: .number)
                    .keyboardType(.decimalPad)
                    .background(Color.white)
                    .frame(width: 250)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                
                TextField("Enter your height", value: $height, format: .number)
                    .keyboardType(.decimalPad)
                    .background(Color.white)
                    .frame(width: 250)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    
                
                Button("Calcular") {
                    let imc = calculateImc()
                    getRating(imc: imc)
                }
                .foregroundColor(.white)
                .padding(12)
                .background(.blue)
                .cornerRadius(10.0)
                .padding()
                
                Spacer()
                
                Text("\(classification)")
                    .font(.system(size: 30))
                    .foregroundStyle(.white)
                
                Spacer()
                
                Image("tabela-IMC")
                    .resizable()
                    .frame(height: 200)
            }
            
        }
    }
}

#Preview {
    CalculadoraImc()
}
