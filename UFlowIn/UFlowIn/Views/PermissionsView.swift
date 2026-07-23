//
//  PermissionsView.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI

struct PermissionsView: View {

    var onContinue: () -> Void

    var body: some View {
        
        ZStack{
            Color(.grayBackground)
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 30) {
                
                Spacer()
                
                Text("Conecte seu Apple Health")
                    .font(.title.bold())
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.colorsIndigo)
                
                Text(
                    "Vamos conectar seu dispositivo?"
                )
                .font(.default.bold())
                .foregroundStyle(.labelsBlack)
                .multilineTextAlignment(.center)
                
                // Footnote/Regular
                Text("Permita o acesso aos recursos do seu dispositivo para acompanhar suas atividades e personalizar sua experiência.")
                    .font(Font.custom("SF Pro", size: 15))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.labelsVibrant1)
                //.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                /* Text(
                 "Permita o acesso aos recursos do seu dispositivo para acompanhar suas atividades e personalizar sua experiência."
                 )
                 .font(.default.bold())
                 .foregroundStyle(.labelsVibrant2)
                 .multilineTextAlignment(.center)
                 */
                
                
                
                VStack(alignment: .leading, spacing: 0) {
                    HStack{
                        Image(systemName: "heart.fill")
                            .font(.system(size: 60))
                            .foregroundStyle(.red)
                            .multilineTextAlignment(.center)
                            .padding(.top, -25)
                        
                        
                        VStack{
                            Text("Apple Health")
                                .font(.default.bold())
                                .font(
                                    Font.custom("SF Pro", size: 16)
                                    
                                )
                                .foregroundColor(.labelsBlack)
                                .frame(width: 230, alignment: .leading)
                            //  .padding(10)
                            // .padding(.top, 2)
                            
                            Text("Sincronize passos, calorias, atividades e sono automaticamente.")
                                .font(.custom("SF Pro", size: 15))
                                .foregroundColor(.labelsVibrant2)
                                .frame(width: 250,height: 100, alignment: .leading)
                                .padding(10)
                                .padding(.top, -45)
                            
                            
                        }
                        
                    }
                    
                }
                .padding(15)
                .frame(width: 370, height: 100, alignment: .topLeading)
                .background(.grayElement.opacity(0.7))
                .cornerRadius(16)
                .shadow(color: .black.opacity(0.12), radius: 20, x: 0, y: 8)
                
                Text("Você poderá alterar essas permissões sempre que desejar nas configurações do seu app")
                    .font(Font.custom("SF Pro", size: 13))
                    .foregroundColor(.labelsVibrant2)
                    .frame(width: 300,height: 410, alignment: .leading)
                    .padding(.top, -200)
                
                Spacer()
                
                PrimaryButton(
                    title: "Próximo",
                    style: .tertiary
                ) {
                    onContinue()
                }
                .padding(.bottom, 20)
            }
        }// fim do z stack
        
    }
}
#Preview{
    PermissionsView(
        onContinue: {
                   print("Continuar pressionado")
               }
    )
}
