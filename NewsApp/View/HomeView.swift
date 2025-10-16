import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    @StateObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack{
                    ForEach(viewModel.news) { card in
                        NavigationLink {
                            DetailView(headline: card.title, Newssource: card.author, Newsbody: card.content, imgUrl: card.urlToImage, Newsdate: card.publishedAt, NewsUrl: card.url)
                        } label: {
                            NewsTile(title: card.title, description: card.description, url: card.urlToImage)
                        }
                        .buttonStyle(.plain)
                        .task {
                            if card.id == viewModel.news.last?.id {
                                print("last page")
                                await viewModel.loadMoreNews()
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top)
            }
            .scrollDismissesKeyboard(.immediately)
            .navigationTitle(Text("News"))
            .refreshable {
                let impact = UIImpactFeedbackGenerator(style: .medium)
                impact.impactOccurred()
                
                await viewModel.getNews()
                
                
                let success = UINotificationFeedbackGenerator()
                success.notificationOccurred(.success)
            }
            
            .overlay {
                if !networkManager.isConnected {
                    Color.black.opacity(0.5)
                        .ignoresSafeArea()
                        .overlay {
                            VStack(spacing: 16) {
                                Image(systemName: "wifi.slash")
                                    .font(.system(size: 50))
                                    .foregroundColor(.red)
                                
                                Text("No Internet Connection")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                
                                Text("Please check your connection")
                                    .font(.body)
                                    .foregroundColor(.secondary)
                            }
                            .padding(40)
                            .background(Color(UIColor.systemBackground))
                            .cornerRadius(20)
                            .shadow(radius: 20)
                        }
                        .transition(.opacity)
                }
            }
        }
        .onAppear {
            Task {
                if networkManager.isConnected {
                    await viewModel.getNews()
                }
            }
        }
        .onChange(of: networkManager.isConnected) { oldValue, newValue in
            if !oldValue && newValue {
                Task {
                    await viewModel.getNews()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
