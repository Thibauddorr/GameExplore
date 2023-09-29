//
//  GameDetailsView.swift
//  GameExplore
//
//  Created by Thibaud DORR on 15/09/2023.
//

import SwiftUI

struct GameDetailsView: View {
    var gameData: Game
    //@State private var isShowingSafariView = false
    
    var body: some View {
        
        
        ScrollView {
            VStack(alignment: .center) {
                HStack(alignment: .top) {
                    Text(gameData.name)
                        .font(.title)
                        .padding()
                }
                HStack(alignment: .top) { // Align the content at the top
                    if let rate = gameData.rating {
                        StarRating(rating: .constant(rate), maxRating: 5)
                            .font(.title2)
                            .padding()
                    }
                    Spacer() // Pushes the rating to the left
                    
                    Button {
                        //isShowingSafariView = true
                        // TODO: Add game into library
                    } label: {
                        Label("", systemImage: "plus.circle")
                    }
                    .controlSize(.large)
                    .padding()
                }
            }

            
            VStack(){
                VStack(alignment: .leading, spacing: 20) {
                    if let setImage = gameData.short_screenshots {
                        LazyVGrid(columns: [GridItem(.flexible(minimum: 120)),
                                            GridItem(.flexible(minimum: 120)),
                                            GridItem(.flexible(minimum: 120))
                                           ], spacing: 10) {
                            ForEach(setImage, id: \.id) { img in
                                AsyncImage(url: URL(string: img.image!)) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 65)
                                        .cornerRadius(15)
                                } placeholder: {
                                    Image(systemName: "gamecontroller")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 65)
                                        .cornerRadius(15)
                                }
                            }
                        }
                    }
                }
                .padding()
                .frame(width: 30)
                Spacer()
                
                
                Button {
                    //isShowingSafariView = true
                } label: {
                    //                AFButton(title: "Learn More")
                    Label("Learn More", systemImage: "book.fill")
                }
                .buttonStyle(.bordered)
                .controlSize(.large)
                //            .foregroundColor(.yellow)
                //            .buttonBorderShape(.roundedRectangle(radius: 20))
                .tint(.red)
            }
            //        .sheet(isPresented: $isShowingSafariView, content: {
            //            SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
            //        })
        }
        
    }
}

#Preview {
    GameDetailsView(gameData: defaultGame)
}
