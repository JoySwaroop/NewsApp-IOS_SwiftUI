# News App 📰

## What is this App All About

News App is a beautifully designed iOS application built with modern SwiftUI that delivers the latest technology news from trusted sources like TechCrunch and The Next Web. The app features an intuitive interface with smooth scrolling, infinite pagination, and comprehensive article details to keep you informed about the latest developments in the tech world.

- **Real-Time News**: Get the latest technology news from TechCrunch and The Next Web with automatic updates.
- **Infinite Scrolling**: Seamlessly browse through articles with automatic pagination and smooth loading.
- **Detailed Articles**: View comprehensive article details with full content, images, and publication information.
- **Image Caching**: Optimized image loading with intelligent caching system for faster performance and reduced data usage.
- **Network Monitoring**: Real-time network status monitoring with user-friendly connection indicators.
- **Pull-to-Refresh**: Intuitive refresh functionality with haptic feedback for a premium user experience.
- **Modern UI**: Clean, card-based design with smooth animations and responsive layouts.
- **External Links**: Direct access to full articles on original websites for complete reading experience.
- **Date Formatting**: Smart date formatting for better readability of publication times.
- **Error Handling**: Robust error handling with graceful fallbacks for network issues and image loading failures.

## What I have learned

- **Advanced SwiftUI**: Mastered complex SwiftUI concepts including LazyVStack for performance optimization, NavigationView integration, and custom view components.
- **News API Integration**: Successfully integrated with [NewsAPI.org](https://newsapi.org/) to fetch real-time news data using modern async/await patterns and proper error handling.
- **MVVM Architecture**: Structured the app using Model-View-ViewModel pattern with proper separation of concerns between UI, business logic, and data models.
- **Custom Image Caching**: Implemented a sophisticated image caching system using custom `CachedAsyncImage` component for optimal performance and user experience.
- **Network Monitoring**: Integrated Network framework to monitor internet connectivity and provide real-time status updates to users.
- **Pagination & Infinite Scrolling**: Implemented efficient pagination system with automatic loading of additional content as users scroll through articles.
- **State Management**: Managed complex app state using `@ObservableObject`, `@StateObject`, and `@Published` properties for reactive UI updates.
- **JSON Decoding**: Decoded complex nested JSON responses from news APIs into Swift `Codable` structs with proper error handling and data validation.
- **Custom UI Components**: Created reusable SwiftUI components including `NewsTile` for article previews and `NetworkStatusBanner` for connectivity feedback.
- **Haptic Feedback**: Integrated haptic feedback for pull-to-refresh actions to enhance user interaction and provide tactile confirmation.
- **Date Formatting**: Implemented custom date formatting utilities to convert ISO date strings into user-friendly readable formats.
- **Error Handling**: Implemented comprehensive error handling for network failures, API responses, and image loading with graceful fallbacks.
- **Performance Optimization**: Used LazyVStack for efficient memory management when displaying large lists of news articles.
- **App Icon Design**: Created custom app icons using Apple's Icon Composer tool with proper scaling and formatting for different device sizes.

## Note

**API Key Configuration**: To use this news app, you need to obtain a free API key from [NewsAPI.org](https://newsapi.org/) and replace the placeholder in the code.

**Where to edit the API key:**
- Navigate to `NewsApp/Services/Services.swift`
- Find the line: `let apikey = "Your API Key"`
- Replace `"Your API Key"` with your actual API key from NewsAPI.org

**Steps to get your API key:**
1. Visit [NewsAPI.org](https://newsapi.org/)
2. Sign up for a free account
3. Go to your dashboard to get your API key
4. Copy the key and paste it in the Services.swift file

## Demo

https://github.com/user-attachments/assets/ae226006-c93e-4df4-90b4-0efeae3715e7

