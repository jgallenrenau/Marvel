import SwiftUI
import HeroList
import HeroDetail

@main
struct MarvelApp: App {
    @State private var selectedHero: Hero?
    @State private var showSplash = true

    var body: some Scene {
        WindowGroup {
            if showSplash {
                SplashScreenView(onAnimationEnd: {
                    self.showSplash = false
                })
            } else {
                NavigationView {
                    HeroListCoordinator(
                        onHeroSelected: { hero in
                            self.selectedHero = hero
                        }
                    )
                    .sheet(item: $selectedHero) { hero in
                        HeroDetailCoordinator(heroId: hero.id)
                    }
                }
                .onAppear {
                    AppInitializer.initializeKeys()
                }
            }
        }
    }
}
