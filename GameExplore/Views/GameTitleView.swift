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
        HStack(spacing: 2) {
            //Spacer()
            VStack(alignment: .leading, spacing: 3) {
                if let background_image = game.short_screenshots?.first?.image {
                    AsyncImage(url: URL(string: background_image)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            //.cornerRadius(25)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    } placeholder: {
                        Image(systemName: "gamecontroller")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            //.cornerRadius(50/2)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    }
                } else {
                    Image(systemName: "gamecontroller")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                        //.cornerRadius(25)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
                
            }
            .padding()
           
            VStack(alignment: .leading){
                HStack(alignment: .top) {
                    Text(game.name)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.label))
                        //.scaledToFit()
                        .minimumScaleFactor(0.3)
                        Spacer()
                    
                }
            }
            //.padding()
            Spacer()
        }
    }
}

struct GameTitleView_Previews: PreviewProvider {
    static var previews: some View {
        GameTitleView(game: defaultGame)
    }
}
