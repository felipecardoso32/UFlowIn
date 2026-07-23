//
//  AboutYoutView.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI

struct AboutYouView: View {
    
    var onContinue: () -> Void
    
    @State private var name = ""
    @State private var age = ""
    @State private var weight = ""
    @State private var height = ""
    
    @State private var gender = "Selecione"
    @State private var peso = ""
    @State private var idade = ""
    @State private var altura = ""
    
    let genders = [
        "Masculino",
        "Feminino",
        "Outro",
        "Prefiro não informar"
    ]
    
    var body: some View {
        
        
        ZStack{
            Color(.grayBackground)
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 30) {
                
                Spacer()
                
                Text("Conhecendo você")
                    .font(.title.bold())
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.colorsIndigo)
                
                Text(
                    "Conte um pouco sobre você"
                )
                .font(.default.bold())
                .foregroundStyle(.labelsBlack)
                .multilineTextAlignment(.center)
                
                // Footnote/Regular
                Text("Essas informações nos ajudam a personalizar sua experiência e sugerir metas mais adequadas.")
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
                HStack{
                    VStack{
                        
                        VStack(alignment: .leading, spacing: 0) { // card
                            
                            VStack{
                                // Subheadline/Regular
                                HStack{
                                    Image(systemName: "figure")
                                        .foregroundStyle(.colorsRed)
                                    
                                    Text("Gênero")
                                        .font(Font.custom("SF Pro", size: 15))
                                        .foregroundColor(.labelsBlack)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                }.padding(.top, -65)
                                HStack{
                                    /*Text("Selecione")
                                     .font(
                                     Font.custom("SF Pro", size: 22)
                                     .weight(.heavy)
                                     )
                                     .foregroundColor(.labelsBlack)
                                     .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                     Image(systemName: "chevron.down")
                                     .font(.system(size: 22, weight: .semibold))
                                     .foregroundStyle(.labelsBlack)*/
                                    Menu {
                                        
                                        ForEach(
                                            genders,
                                            id: \.self
                                        ) { item in
                                            
                                            Button(item) {
                                                
                                                gender = item
                                            }
                                        }
                                        
                                    } label: {
                                        
                                        HStack {
                                            
                                            Text(gender)
                                            
                                            Spacer()
                                            
                                            Image(
                                                systemName:
                                                    "chevron.down"
                                            )
                                        }
                                        .padding()
                                        .background(
                                            .labelsVibrant3.opacity(0.08)
                                        )
                                        .clipShape(
                                            RoundedRectangle(
                                                cornerRadius: 20
                                            )
                                        ).frame(height: 40)
                                    }
                                }.padding(.top, -50)
                                
                            }//.padding(.top, -40)
                            
                            
                        }
                        .padding(15)
                        .frame(width: 175, height: 124, alignment: .topLeading)
                        .background(.grayElement.opacity(0.7))
                        .cornerRadius(16)
                        .shadow(color: .black.opacity(0.12), radius: 20, x: 0, y: 8)
                        
                        VStack(alignment: .leading, spacing: 0) { // card
                            
                            
                            VStack{
                                // Subheadline/Regular
                                HStack{
                                    Image(systemName: "scalemass")
                                        .foregroundStyle(.colorsIndigo)
                                    
                                    Text("Peso")
                                        .font(Font.custom("SF Pro", size: 15))
                                        .foregroundColor(.labelsBlack)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                }.padding(.top, -5)
                                
                                HStack(spacing: 0) {
                                    
                                    CustomTextField(
                                        title: "Ex.:70,5",
                                        text: $peso,
                                        keyboardType: .emailAddress,
                                        width: 100
                                    )
                                    ZStack{
                                        UnevenRoundedRectangle(
                                            topLeadingRadius: 0,
                                            bottomLeadingRadius: 0,
                                            bottomTrailingRadius: 16,
                                            topTrailingRadius: 16
                                        )
                                        .fill(.labelsVibrant4)
                                        .frame(
                                            width: 50,
                                            height: 46
                                        )
                                        .offset(x: -20, y: -7)
                                        .padding(.top, 15)
                                        
                                        Text("kg")
                                            .font(Font.custom("SF Pro", size: 17).bold())
                                            .padding(.leading, -30)
                                        
                                    }
                                }
                                .frame(width: 150)
                                .padding(.leading, 7)
                                
                                /* HStack{
                                 CustomTextField(
                                 title: "exemplo@email.com",
                                 text: $peso,
                                 keyboardType: .emailAddress,
                                 width: 100
                                 
                                 
                                 ).padding(.leading, 35)
                                 UnevenRoundedRectangle(
                                 topLeadingRadius: 0,
                                 bottomLeadingRadius: 0,
                                 bottomTrailingRadius: 20,
                                 topTrailingRadius: 20
                                 )
                                 .fill(.labelsVibrant4)
                                 .frame(
                                 width: 50,
                                 height: 44
                                 )
                                 }.padding(.leading, -40)*///offset(x: 20).padding(.top, -40)
                                //.padding(.leading, -40)
                                
                            }
                            
                            
                        }
                        .padding(15)
                        .frame(width: 175, height: 124, alignment: .topLeading)
                        .background(.grayElement.opacity(0.7))
                        .cornerRadius(16)
                        .shadow(color: .black.opacity(0.12), radius: 20, x: 0, y: 8)
                        
                        
                    }
                    
                    
                    VStack{
                        
                        VStack(alignment: .leading, spacing: 0) { // card
                            
                            VStack{
                                // Subheadline/Regular
                                HStack{
                                    Image(systemName: "calendar.and.person")
                                        .foregroundStyle(.accentsBlueApp)
                                    
                                    Text("Idade")
                                        .font(Font.custom("SF Pro", size: 15))
                                        .foregroundColor(.labelsBlack)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                }.padding(.top, -5)
                                
                                HStack(spacing: 0) {
                                    
                                    CustomTextField(
                                        title: "Ex.:25",
                                        text: $peso,
                                        keyboardType: .emailAddress,
                                        width: 100
                                    )
                                    ZStack{
                                        UnevenRoundedRectangle(
                                            topLeadingRadius: 0,
                                            bottomLeadingRadius: 0,
                                            bottomTrailingRadius: 16,
                                            topTrailingRadius: 16
                                        )
                                        .fill(.labelsVibrant4)
                                        .frame(
                                            width: 50,
                                            height: 46
                                        )
                                        .offset(x: -20, y: -7)
                                        .padding(.top, 15)
                                        
                                        Text("anos")
                                            .font(Font.custom("SF Pro", size: 17).bold())
                                            .padding(.leading, -39)
                                        
                                    }
                                }
                                .frame(width: 150)
                                .padding(.leading, 7)
                                
                                /* HStack{
                                 CustomTextField(
                                 title: "exemplo@email.com",
                                 text: $peso,
                                 keyboardType: .emailAddress,
                                 width: 100
                                 
                                 
                                 ).padding(.leading, 35)
                                 UnevenRoundedRectangle(
                                 topLeadingRadius: 0,
                                 bottomLeadingRadius: 0,
                                 bottomTrailingRadius: 20,
                                 topTrailingRadius: 20
                                 )
                                 .fill(.labelsVibrant4)
                                 .frame(
                                 width: 50,
                                 height: 44
                                 )
                                 }.padding(.leading, -40)*///offset(x: 20).padding(.top, -40)
                                //.padding(.leading, -40)
                                
                            }
                            
                            
                        }
                        .padding(15)
                        .frame(width: 175, height: 124, alignment: .topLeading)
                        .background(.grayElement.opacity(0.7))
                        .cornerRadius(16)
                        .shadow(color: .black.opacity(0.12), radius: 20, x: 0, y: 8)
                        
                        VStack(alignment: .leading, spacing: 0) { // card
                            
                            VStack{
                                // Subheadline/Regular
                                HStack{
                                    Image(systemName: "ruler")
                                        .foregroundStyle(.labelsBlack)
                                    
                                    Text("Altura")
                                        .font(Font.custom("SF Pro", size: 15))
                                        .foregroundColor(.labelsBlack)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                                }.padding(.top, -5)
                                
                                HStack(spacing: 0) {
                                    
                                    CustomTextField(
                                        title: "Ex.:1,75",
                                        text: $peso,
                                        keyboardType: .emailAddress,
                                        width: 100
                                    )
                                    ZStack{
                                        UnevenRoundedRectangle(
                                            topLeadingRadius: 0,
                                            bottomLeadingRadius: 0,
                                            bottomTrailingRadius: 16,
                                            topTrailingRadius: 16
                                        )
                                        .fill(.labelsVibrant4)
                                        .frame(
                                            width: 50,
                                            height: 46
                                        )
                                        .offset(x: -20, y: -7)
                                        .padding(.top, 15)
                                        
                                        Text("m")
                                            .font(Font.custom("SF Pro", size: 17).bold())
                                            .padding(.leading, -30)
                                        
                                    }
                                }
                                .frame(width: 150)
                                .padding(.leading, 7)
                                
                                /* HStack{
                                 CustomTextField(
                                 title: "exemplo@email.com",
                                 text: $peso,
                                 keyboardType: .emailAddress,
                                 width: 100
                                 
                                 
                                 ).padding(.leading, 35)
                                 UnevenRoundedRectangle(
                                 topLeadingRadius: 0,
                                 bottomLeadingRadius: 0,
                                 bottomTrailingRadius: 20,
                                 topTrailingRadius: 20
                                 )
                                 .fill(.labelsVibrant4)
                                 .frame(
                                 width: 50,
                                 height: 44
                                 )
                                 }.padding(.leading, -40)*///offset(x: 20).padding(.top, -40)
                                //.padding(.leading, -40)
                                
                            }
                            
                            
                        }
                        .padding(15)
                        .frame(width: 175, height: 124, alignment: .topLeading)
                        .background(.grayElement.opacity(0.7))
                        .cornerRadius(16)
                        .shadow(color: .black.opacity(0.12), radius: 20, x: 0, y: 8)
                        
                        
                    }
                }//.padding(.top, 50)
                
                
                
                
                
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
        
        
        
        /*
         ScrollView {
         
         VStack(
         alignment: .leading,
         spacing: 20
         ) {
         
         Text("Conhecendo você")
         .font(.largeTitle.bold())
         
         Text(
         "Queremos conhecer um pouco mais sobre você."
         )
         .foregroundStyle(.secondary)
         
         CustomTextField(
         title: "Nome",
         text: $name
         )
         
         CustomTextField(
         title: "Idade",
         text: $age,
         keyboardType: .numberPad
         )
         
         CustomTextField(
         title: "Peso (kg)",
         text: $weight,
         keyboardType: .decimalPad
         )
         
         CustomTextField(
         title: "Altura (cm)",
         text: $height,
         keyboardType: .numberPad
         )
         
         VStack(
         alignment: .leading
         ) {
         
         Text("Gênero")
         .foregroundStyle(.secondary)
         
         Menu {
         
         ForEach(
         genders,
         id: \.self
         ) { item in
         
         Button(item) {
         
         gender = item
         }
         }
         
         } label: {
         
         HStack {
         
         Text(gender)
         
         Spacer()
         
         Image(
         systemName:
         "chevron.down"
         )
         }
         .padding()
         .background(
         Color.gray.opacity(0.08)
         )
         .clipShape(
         RoundedRectangle(
         cornerRadius: 12
         )
         )
         }
         }
         
         PrimaryButton(
         title: "Continuar",
         style: .tertiary
         ) {
         
         onContinue()
         }
         }
         .padding(24)
         }
         }*/
    }}
#Preview{
    AboutYouView(
        onContinue: {
                   print("Continuar pressionado")
               }
    )
}
