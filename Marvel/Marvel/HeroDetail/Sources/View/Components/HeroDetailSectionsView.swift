import SwiftUI
import DesignSystem

struct HeroDetailSectionsView: View {
    let hero: HeroDetail

    var body: some View {
        
        VStack(alignment: .leading, spacing: DSPadding.large) {
            if !hero.comics.isEmpty {
                heroDetailSection(titleKey: "heroDetail_comics", items: hero.comics)
            }
            if !hero.series.isEmpty {
                heroDetailSection(titleKey: "heroDetail_series", items: hero.series)
            }
            if !hero.stories.isEmpty {
                heroDetailSection(titleKey: "heroDetail_stories", items: hero.stories)
            }
            if !hero.events.isEmpty {
                heroDetailSection(titleKey: "heroDetail_events", items: hero.events)
            }
        }
        .padding(DSPadding.normal)
        .background(
            RoundedRectangle(cornerRadius: DSCorner.large)
                .fill(DSColors.black.opacity(DSOpacity.dotFour))
        )
        .padding(.horizontal, DSPadding.large)
        .padding(.vertical, DSPadding.large)
    }

    private func heroDetailSection(titleKey: String, items: [String]) -> some View {
        VStack(alignment: .leading, spacing: DSPadding.small) {
            DSSectionHeaderView(localizedKey: titleKey, bundle: .heroDetail)

            ForEach(items, id: \.self) { item in
                Text("• \(item)")
                    .font(DSFonts.callout)
                    .foregroundColor(DSColors.white)
                    .padding(.horizontal)
                    .padding(.vertical, DSPadding.xSmall)
            }
        }
        .background(Color.clear)
    }
}

#Preview {
    HeroDetailSectionsView(
        hero: HeroDetail(
            id: 1,
            name: "Spider-Man",
            description: "A friendly neighborhood superhero.",
            thumbnailURL: URL(string: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg")!,
            comics: ["Amazing Spider-Man #1", "Ultimate Spider-Man #2", "Spider-Verse #3"],
            series: ["Marvel's Spider-Man", "Ultimate Comics"],
            stories: ["The Clone Saga", "Spider-Island"],
            events: ["Civil War", "Secret Wars"]
        )
    )
    .previewLayout(.sizeThatFits)
    .padding(DSPadding.normal)
    .background(DSColors.black.opacity(DSOpacity.dotFour))
}
