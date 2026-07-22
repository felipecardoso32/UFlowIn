//
//  RegistrationFlowView.swift
//  UFlowIn
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI

struct RegistrationFlowView: View {

    @State private var currentPage = 0

    var body: some View {

        Group {

            switch currentPage {

            case 0:

                PermissionsView {

                    currentPage += 1
                }

            case 1:

                AboutYouView {

                    currentPage += 1
                }

            case 2:

                GoalsView {

                    currentPage += 1
                }

            case 3:

                ActivityLevelView {

                    currentPage += 1
                }

            case 4:

                FavoriteActivitiesView {

                    currentPage += 1
                }

            default:

                RegistrationFinishView()
            }
        }
    }
}
#Preview {

    RegistrationFlowView()
        .environmentObject(
            AppState()
        )
}
