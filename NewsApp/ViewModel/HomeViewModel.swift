import Foundation

@MainActor
class HomeViewModel : ObservableObject {
    
    @Published var news : [Article] = []
    @Published var currentPage = 1
    private let pageSize = 20
    var totalResult = 0
    var totalPages: Int{(totalResult+pageSize - 1)/pageSize}
    
    
    
    let service = Services()
    
    func getNews() async {
        currentPage = 1
        do {
            let newsData = try await service.getNews(page:currentPage)
            self.news = newsData.articles
            self.totalResult = newsData.totalResults
            
        }catch{
            
        }
    }
    
    func loadMoreNews() async {
        guard currentPage < totalPages else {
                    print("No more pages to load. Current: \(currentPage), Total: \(totalPages)")
                    return
                }
        
        currentPage += 1
        print("Loading page \(currentPage) of \(totalPages)")
        do {
                    let newsData = try await service.getNews(page: currentPage)
                    self.news.append(contentsOf: newsData.articles)
                } catch {
                    print("Error loading more news: \(error)")
                    
                    currentPage -= 1
            }
    }
    
    
}
