//
//  RegistrationFinishView.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI

struct RegistrationFinishView: View {

    @EnvironmentObject var appState: AppState

    var body: some View {
        ZStack{
            LinearGradient(
                colors: [
                    Color(red: 0.00, green: 0.75, blue: 0.70),
                    Color(red: 0.00, green: 0.72, blue: 0.68),
                    Color(red: 0.00, green: 0.55, blue: 0.85)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            VStack(spacing: 30) {
                
                Spacer()
                Text("Tudo pronto!")
                    .font(.title.bold())
                    .foregroundStyle(.black)
                
                ZStack{
                    
                    
                    Circle()
                        .frame(width: 216, height: 216)
                        .foregroundColor(.white)
                    
                    Image("pose5")
                        .resizable()
                    //.aspectRatio(contentMode: .init(rawValue: "fill"))
                        .frame(width: 216, height: 216)
                        .padding(.bottom, 30)
                }
                Text("Seu aplicativo está pronto!")
                    .font(.title.bold())
                    .foregroundStyle(.black)
                
                Text(
                    "Agora é só dar o primeiro passo. Vamos acompanhar sua evolução juntos."
                )
                .font(Font.custom("SF Pro", size: 17))
                .multilineTextAlignment(.center)
                .foregroundStyle(.black.opacity(0.6))
                
             
                Spacer()
                
                PrimaryButton(
                    title: "Começar",
                    style: .tertiary
                ) {
                    appState.finishRegistration()
                }
                .padding(.bottom, 80)
            }.padding(.horizontal, 16)
        }.ignoresSafeArea()
    }
}
#Preview {

    RegistrationFinishView()
        .environmentObject(
            AppState()
        )
}
