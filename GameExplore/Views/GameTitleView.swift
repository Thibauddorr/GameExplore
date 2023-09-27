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
        HStack(spacing: 10) {
            Spacer()
            VStack(alignment: .leading, spacing: 10) {
                if let background_image = game.background_image {
                    AsyncImage(url: URL(string: background_image)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .cornerRadius(8)
                    } placeholder: {
                        Image(systemName: "gamecontroller")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                            .cornerRadius(8)
                    }
                } else {
                    Image(systemName: "gamecontroller")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                        .cornerRadius(8)
                }
                
            }
            .padding()
            .frame(width: 30)
            Spacer()
           
            VStack(alignment: .leading, spacing: 10){
                HStack(spacing: 10) {
                    Text(game.name)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.label))
                        .scaledToFit()
                        .minimumScaleFactor(0.3)
                    
                }
            }
            .padding()
            .frame(width: 220)
            Spacer()
        }
    }
}

struct GameTitleView_Previews: PreviewProvider {
    static var previews: some View {
        GameTitleView(game: defaultGame)
    }
}
