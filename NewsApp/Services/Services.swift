import Foundation

class Services {
    let apikey = "Your API Key"
    
    func getNews(page:Int) async throws -> News {
        let baseUrl = "https://newsapi.org/v2/everything?domains=techcrunch.com,thenextweb.com&language=en&pageSize=20&page=\(page)&apiKey=\(apikey)"
        
        guard let url = URL(string: baseUrl) else {
            throw URLError(.badURL)
        }
        
        let(data,response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else{throw URLError(.badServerResponse)}
        
        do{
           let newsData = try JSONDecoder().decode(News.self, from: data)
            return newsData
        }catch{
            throw URLError(.cannotDecodeContentData)
        }
        
    }
    
}
