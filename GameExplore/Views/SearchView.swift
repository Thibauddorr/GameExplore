import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State var searchResultGames: [Game] = []
    
    var body: some View {
        VStack{
            SearchBar(text: $searchText, searchResultGames: $searchResultGames)
            SearchResult(searchResultGames: $searchResultGames)
        }
        .padding()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct SearchResult: View {
    @Binding var searchResultGames: [Game]

//    var body: some View {
//        NavigationView { // Wrap the list in a NavigationView
//            List(searchResultGames, id: \.name) { game in
//               // NavigationLink(destination: GameDetailsView(gameData: game)) {
//                NavigationLink(destination: GameDetailsView(gameData: game)) {
//                    Text(game.name)
//                }
//            }
//        }
//    }
    
        var body: some View {
            NavigationView { // Wrap the list in a NavigationView
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible(minimum: 80))]) {
                        ForEach(searchResultGames, id: \.name) { game in
                            NavigationLink(destination: GameDetailsView(gameData: game)) {
                                GameTitleView(game: game)
                            }
                        }
                    }
                }
//                .navigationTitle("Search Results")
            }
        }

}

struct SearchBar: View {
    @State var networkManager = NetworkManager()
    @Binding var text: String
    @State private var isEditing = false
    @Binding var searchResultGames: [Game] // Pass as @State

    var body: some View {
        HStack {
            TextField("Search a game title", text: $text, onEditingChanged: { editing in
                withAnimation {
                    self.isEditing = editing
                }
            }, onCommit: {
                networkManager.fetchGame(gameTitle: text) { games in
                    print("Data is Ready")
                    self.searchResultGames = games // Update the search result games within SearchBar
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
