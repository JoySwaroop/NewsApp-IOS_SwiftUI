import Foundation

struct News : Codable{
    let totalResults : Int
    let articles: [Article]
    
}

struct Article : Codable,Identifiable {
    
    let source : Source?
    let id = UUID()
    let author : String
    let title : String
    let description : String
    let urlToImage : String
    let publishedAt : String
    let content : String
    let url : String
    
}

struct Source : Codable {
    let name : String
}


