# 📰 News App (SwiftUI)

A modern iOS news application built with **SwiftUI** that fetches and displays the latest news articles from a public news API.  
The app follows a clean **MVVM architecture**, uses **async/await** for networking, and provides a smooth, responsive user experience.

## Demo
<p align="center">
  <img src="./assets/newsAppDemo.gif" width="420" alt="NewsApp Demo" />
</p>

---

## ✨ Features

- 🗞️ Browse latest news headlines
- 📱 Clean and responsive SwiftUI interface
- ⚡ Fast networking using `async/await`
- 🧱 MVVM architecture for scalability and testability
- ❗ User-friendly error handling
- 🖼️ Article images loaded asynchronously

---

## 🧰 Tech Stack

| Category | Technology |
|--------|------------|
| **Language** | Swift |
| **Framework** | SwiftUI |
| **Architecture** | MVVM |
| **Networking** | URLSession |
| **Concurrency** | async/await |
| **Data Parsing** | Codable |
| **Minimum iOS** | iOS 17+ |
| **IDE** | Xcode 15+ |

---

## 🚀 Getting Started

### 1️⃣ Clone the Repository

```bash
git clone "https://github.com/HamedKharazmi1990/NewsApp.git"
cd "News App"
```

### 2️⃣ Create Your News API Key

    1. Get a free API key from NewsApi.
    2. Create a file named `Secrets.plist` at the following path:
        News App/News App/Config/Secrets.plist
    3. Paste the following content and replace `YOUR_NEWSAPI_KEY`:

    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
    "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
        <key>API_KEY</key>
        <string>YOUR_NEWSAPI_KEY</string>
        </dict>
    </plist>

⚠️ Do not commit your real API key.

### 3️⃣ Open & Run
    1.    Open News App.xcodeproj in Xcode
    2.    Select an iOS Simulator
    3.    Press Run (⌘R)

### 💡 Usage
    1.    Launch the app
    2.    Browse top news headlines
    3.    Tap an article to read details

 ###   🧩 Project Structure
    News App
    ├── Assets.xcassets
    ├── Models
    │   └── NewsResponse.swift      # Codable API models
    ├── ViewModels
    │   └── NewsViewModel.swift    # Fetches data and manages state
    ├── Views
    │   ├── NewsListView.swift     # Main article list
    │   ├── NewsRowView.swift      # Article row UI
    │   └── NewsDetailView.swift   # Article details
    ├── Services
    │   └── NewsService.swift      # API networking logic
    └── News_AppApp.swift          # App entry point


 ###   🔄 Data Flow
    View
    ↓
    ViewModel
    ↓
    Network Service
    ↓
    API Response → Model → UI Update


### API Request Example
    https://api.thenewsapi.com/v1/news/top?api_token=\(apiKey)&locale=us&limit=10

### ⚙️ Configuration & Secrets
The app reads the API key securely from Secrets.plist using:

    Bundle.main.url(forResource: "Secrets", withExtension: "plist")

❌ Never hardcode API keys directly in source files.

### 🧾 .gitignore for Secrets
Add the following rules to your .gitignore file:

    # macOS
    .DS_Store

    # Xcode user data
    *.xcuserstate
    *.xcuserdatad

    # Secrets
    **/Config/Secrets.plist

###   🧰 Troubleshooting
| Problem | Possible Fix |
|--------|------------|
| **No data displayed** | Check API key and endpoint |
| **Network error** | Verify internet connection |
| **JSON decoding error** | Ensure API response matches models |

### 🙏 Acknowledgments
[NewsAPI](https://www.thenewsapi.com/) — for providing free news data

### 👨‍💻 Maintainer

    Hamed Kharazmi
    📧 hamed.kharazmi@gmail.com
