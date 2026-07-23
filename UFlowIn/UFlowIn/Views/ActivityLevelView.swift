//
//  ActivityLevelView.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI

struct ActivityLevelView: View {

    var onContinue: () -> Void


    enum ActVisual {

        case icon(String)

        case image(String)
    }


    struct ActivityLevel: Identifiable {

        let id = UUID()

        let title: String

        let subtitle: String

        let visual: ActVisual
    }


    @State private var selected: String?


    let levels: [ActivityLevel] = [

        ActivityLevel(
            title: "Sedentário",
            subtitle: "Pouca ou nenhuma atividade física",
            visual: .image("pose4")
        ),

        ActivityLevel(
            title: "Pouco ativo",
            subtitle: "Atividade física leve",
            visual: .image("pose1")
        ),

        ActivityLevel(
            title: "Ativo",
            subtitle: "Exercícios regularmente",
            visual: .image("pose2")
        ),

        ActivityLevel(
            title: "Muito ativo",
            subtitle: "Exercícios intensos frequentemente",
            visual: .image("pose8")
        ),

        ActivityLevel(
            title: "Extremamente ativo",
            subtitle: "Treinos intensos diariamente",
            visual: .image("pose5")
        )
    ]


    var body: some View {

        ZStack {
            
            Color(.grayBackground)
                .ignoresSafeArea()
            
            
            VStack(
                alignment: .center,
                spacing: 10
            ) {
                
                Text("Nível de Atividade")
                    .font(.title.bold())
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.colorsIndigo)
                    .padding(.top, -20)

                Text("Como é sua rotina hoje?")
                    .font(.default.bold())
                    .foregroundStyle(.labelsBlack)
                    .multilineTextAlignment(.center)

                Text("Isso nos ajuda a recomendar metas e atividades adequadas para você.")
                    .font(Font.custom("SF Pro", size: 15))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.labelsVibrant2)
                    
               

                ForEach(levels) { level in

                    SelectionCard(
                        title: level.title,
                        subtitle: level.subtitle,
                        visual: convertVisual(level.visual),
                        style: .default,
                        isSelected: selected == level.title,
                        size: .big
                    ) {
                        selected = level.title
                    }
                }

                Spacer()

                PrimaryButton(
                    title: "Continuar",
                    style: .tertiary
                ) {
                    onContinue()
                }
                .padding(.bottom, 20)
            }.padding(.top, 120)
            .padding(.horizontal, 16)
            
        }
        
    }
   

    private func convertVisual(
        _ visual: ActVisual
    ) -> SelectionCard.Visual {

        switch visual {

        case .icon(let name):

            return .icon(name)

        case .image(let name):

            return .image(name)
        }
    }
    
    
}


// MARK: - Preview

#Preview {

    ActivityLevelView {

        print(
            "Continuar pressionado"
        )
    }
}
