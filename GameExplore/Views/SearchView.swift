//
//  SearchView.swift
//  GameExplore
//
//  Created by Thibaud DORR on 14/09/2023.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    
    var body: some View {
        VStack{
            SearchBar(text: $searchText)
            Spacer()
                
        }
        .padding()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct SearchBar: View {
    @State var networkManager = NetworkManager()
    @Binding var text: String
    @State private var isEditing = false // Add this state property

    var body: some View {
        HStack {
            TextField("Search", text: $text, onEditingChanged: { editing in
                withAnimation {
                    self.isEditing = editing
                }
            }, onCommit: {
                            // Call the fetchGame() function with the entered text
                networkManager.fetchGame(gameTitle: text) {
                    print("Data is Ready")
                    // Print it into List -> Set bool to true
                }
            })
            .padding(7)
            .padding(.horizontal, 25)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)

                    if !text.isEmpty {
                        Button(action: {
                            withAnimation {
                                self.text = ""
                            }
                        }) {
                            Image(systemName: "multiply.circle.fill")
                                .foregroundColor(.gray)
                                .padding(.trailing, 8)
                        }
                    }
                }
            )
            .padding(.horizontal, 10)
            
            if isEditing {
                Button(action: {
                    withAnimation {
                        self.text = ""
                        self.isEditing = false
                    }
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
            }
        }
    }
}
