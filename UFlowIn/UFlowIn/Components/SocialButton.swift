//
//  SocialButton.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI

struct SocialButton: View {

    let title: String
    let icon: String
    var isSystemIcon = true
    var action: () -> Void

    var body: some View {

        Button {

            action()

        } label: {

            HStack {

                if isSystemIcon {

                    Image(systemName: icon)
                        .font(.title3)

                } else {

                    Text(icon)
                        .font(.headline)
                        .bold()
                }

                Text(title)
                    .fontWeight(.semibold)
            }
            .foregroundStyle(.primary)
            .frame(maxWidth: .infinity)
            .frame(height: 52)
            .background(.white)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 16
                )
            )
            .overlay {

                RoundedRectangle(
                    cornerRadius: 16
                )
                .stroke(
                    Color.gray.opacity(0.25),
                    lineWidth: 1
                )
            }
        }
    }
}
