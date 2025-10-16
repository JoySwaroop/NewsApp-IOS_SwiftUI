import SwiftUI

struct NewsTile: View {
    
    var title : String?
    var description : String?
    var url : String?
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            
            Color(UIColor.secondarySystemBackground)
            
            HStack(spacing: 12) {
                
                
                
                CachedAsyncImage(url: URL(string: url ?? "")) { phase in
                                    switch phase {
                                    case .empty:
                                        // Loading state
                                        ProgressView()
                                            .frame(width: 100, height: 100)
                                            .background(Color.gray)
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                        
                                    case .success(let image):
                                        // Image loaded successfully
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 100, height: 100)
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                        
                                    case .failure:
                                        // Failed to load image
                                        Image(systemName: "photo.artframe")
                                            .font(.largeTitle)
                                            .foregroundColor(.white)
                                            .frame(width: 100, height: 100)
                                            .background(Color.gray)
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                        
                                    @unknown default:
                                        EmptyView()
                                    }
                                }


                
                
                    

                // MARK: Text Section
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text("\(title ?? "This is the News Tile")")
                        .font(.headline)
                        .lineLimit(2)
                        .foregroundStyle(Color.primary)
                    
                    Text("\(description ?? "This is a short description of the news article, providing a glimpse of the content.")")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(3)
                        
                }
                .padding(.vertical, 8)
            }
            .padding(.horizontal, 12)
        }
        .frame(height: 124)
        .cornerRadius(12)
    }
}

#Preview {
    NewsTile()
        .padding()
}
