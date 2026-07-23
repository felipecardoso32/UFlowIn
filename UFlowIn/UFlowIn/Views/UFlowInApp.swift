
//
//  Created by Felipe Colares Cardoso on 22/07/26.
//

import SwiftUI

@main
struct UFlowInApp: App {

    @StateObject private var appState = AppState()

    var body: some Scene {

        WindowGroup {

            RootView()
                .environmentObject(appState)
        }
    }
}
