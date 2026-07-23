//
//  ActivityFinishView.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI

struct ActivityFinishView: View {

    @Environment(\.dismiss)
    private var dismiss

    @State private var showLocation =
        false

    var body: some View {
      
        ZStack {
            
            LinearGradient(
                colors: [
                    Color(red: 0.00, green: 0.75, blue: 0.70),
                    Color(red: 0.00, green: 0.72, blue: 0.68),
                    Color(red: 0.00, green: 0.55, blue: 0.85)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
           
            
            // Conteúdo da tela
            
            VStack(spacing: 25) {
                
                Spacer()
                
                
                Image(
                    systemName:
                        "checkmark.circle.fill"
                )
                .font(.system(size: 80))
                .foregroundStyle(.green)
                
                Text("Atividade concluída!")
                    .font(.largeTitle.bold())
                
                Text(
                    "Parabéns! Você concluiu sua atividade."
                )
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
                
                Spacer()
                
                PrimaryButton(
                    title: "Continuar",
                    style: .tertiary
                ) {
                    showLocation = true
                }
                .padding(.bottom, 20)
            }
            .padding(.horizontal, 20)
              .alert(
                  "Permitir localização?",
                  isPresented:
                      $showLocation
              ) {

                  Button("Permitir") {

                      dismiss()
                  }

                  Button(
                      "Agora não",
                      role: .cancel
                  ) {

                      dismiss()
                  }

              } message: {

                  Text(
                      "A localização é utilizada para registrar sua atividade de corrida ou caminhada."
                  )
              }

                // Conteúdo da tela
            }.ignoresSafeArea()
      //
    }
}
#Preview{
    ActivityFinishView()
}
