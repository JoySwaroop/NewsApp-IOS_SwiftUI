import SwiftUI

struct DetailView: View {
    
    var headline : String?
    var Newssource : String?
    var Newsbody : String?
    var imgUrl : String?
    var Newsdate : String?
    var NewsUrl : String?
    
    func formatNewsDate(from dateString: String) -> String? {
            let inputFormatter = DateFormatter()
            inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            inputFormatter.locale = Locale(identifier: "en_US_POSIX")

            guard let date = inputFormatter.date(from: dateString) else {
                print("Error: Could not parse the date string.")
                return nil
            }

            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "MMMM d, yyyy"

            return outputFormatter.string(from: date)
        }
        
        var formattedDate: String {
            formatNewsDate(from: Newsdate ?? "") ?? "Invalid Date"
        }
    
    var body: some View {
        GeometryReader { reader in
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    
                    // MARK: Image
                    CachedAsyncImage(url: URL(string: imgUrl ?? "demoImage")) { phase in
                        switch phase {
                        case .empty:
                                ProgressView()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: reader.size.width, height: reader.size.height / 3)
                                .clipped()
                        case .success(let image):
                            // Image loaded successfully
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: reader.size.width, height: reader.size.height / 3)
                                .clipped()
                            
                        case .failure:
                            // Failed to load image
                            Image(systemName: "photo.artframe")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: reader.size.width, height: reader.size.height / 3)
                                .clipped()
                            
                        @unknown default:
                            EmptyView()
                                
                            
                        }
                    }
                    
                    
                    Group {

                        // MARK: Headline
                        Text("\(headline ?? "Here the Headline Appears")")
                            .font(.largeTitle)
                            .fontWeight(.bold)

                        // MARK: Author & Date
                        VStack(alignment: .leading) {
                            Text("By \(Newssource ?? "Alex Carter") ")
                                .font(.headline)
                            Text("Published on \(formattedDate)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        
                        // MARK: Separator
                        Divider() 

                        // MARK: Article Body
                        Text("\(Newsbody ?? "Researchers at the Nova Institute of Technology have unveiled a revolutionary solar panel design that shatters previous efficiency records, potentially heralding a new era for clean energy...")")
                            .font(.body)
                        
                        if let url = URL(string: NewsUrl ?? "") {
                            Link("Read Full Article", destination: url)
                                .font(.headline)
                                .padding()
                        }
                        
                    }
                    .padding(.horizontal)
                }
            }
        }
        .navigationTitle("Article")
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    NavigationView {
        DetailView()
    }
}


