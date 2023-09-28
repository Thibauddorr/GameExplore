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
            LazyVGrid(columns: [GridItem(.flexible(minimum: 80))]) {
                
                VStack {
                    Text(gameData.name)
                        .font(.body)
                        .padding()
                    
                    VStack(alignment: .leading, spacing: 20) {
                        if let setImage = gameData.short_screenshots {
                            ForEach(setImage, id: \.id) { img in
                                AsyncImage(url: URL(string: img.image!)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 200, height: 200)
                                        .cornerRadius(8)
                                } placeholder: {
                                    Image(systemName: "gamecontroller")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 200, height: 200)
                                        .cornerRadius(8)
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
}
