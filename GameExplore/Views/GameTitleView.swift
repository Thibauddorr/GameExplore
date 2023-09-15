//
//  GameTitleView.swift
//  GameExplore
//
//  Created by Thibaud DORR on 15/09/2023.
//

import SwiftUI

struct GameTitleView: View {
    let game: Game
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "gamecontroller")
                .resizable()
                .frame(width: 45, height: 35)
            Text(game.name)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(Color(.label))
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
        .padding()
        .alignmentGuide(.leading) { _ in 0 } // Align the content to the left
    }
}

struct GameTitleView_Previews: PreviewProvider {
    static var previews: some View {
        GameTitleView(game: defaultGame)
    }
}
