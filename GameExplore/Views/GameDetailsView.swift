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

            VStack(alignment: .leading){
                HStack(alignment: .top){
                    Text(gameData.name)
                        .font(.title)
                        .padding()
                }
                            
                HStack{
                    Text("Rate:")
                        .font(.body)
                        .padding()
                    if let rate = gameData.rating {
                        Text(String(rate))
                            .font(.body)
                            .padding()
                    }
                }
                Spacer()
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
                                        .frame(width: 120, height: 80)
                                        .cornerRadius(15)
                                } placeholder: {
                                    Image(systemName: "gamecontroller")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 120, height: 80)
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
