import UIKit


func getMethod() {
    
    // URL구조체 만들기
    guard let url = URL(string: "https://itunes.apple.com/search?media=music&term=oasis") else {
        print("Error: cannot create URL")
        return
    }
    
    // URL요청 생성
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    
    // 요청을 가지고 작업세션시작
    URLSession.shared.dataTask(with: request) { data, response, error in
        // 에러가 없어야 넘어감
        guard error == nil else {
            print("Error: error calling GET")
            print(error!)
            return
        }
        // 옵셔널 바인딩
        guard let safeData = data else {
            print("Error: Did not receive data")
            return
        }
        // HTTP 200번대 정상코드인 경우만 다음 코드로 넘어감
        guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
            print("Error: HTTP request failed")
            return
        }
            
        // 원하는 모델이 있다면, JSONDecoder로 decode코드로 구현 ⭐️
        print(String(decoding: safeData, as: UTF8.self))


    }.resume()     // 시작
}


getMethod()


// MARK: - Welcome
struct Welcome: Codable {
    let resultCount: Int
    let results: [Music]
}


// MARK: - Result
struct Music: Codable {
    
    enum ArtistName: String, Codable {
        case gracePotterTheNocturnals = "Grace Potter & The Nocturnals"
        case oasis = "Oasis"
    }

    enum Explicitness: String, Codable {
        case explicit = "explicit"
        case notExplicit = "notExplicit"
    }

    enum Country: String, Codable {
        case usa = "USA"
    }

    enum Currency: String, Codable {
        case usd = "USD"
    }

    enum Kind: String, Codable {
        case song = "song"
    }

    enum PrimaryGenreName: String, Codable {
        case indieRock = "Indie Rock"
        case rock = "Rock"
        case soundtrack = "Soundtrack"
    }

    enum WrapperType: String, Codable {
        case track = "track"
    }

    enum CodingKeys: String, CodingKey {
        case wrapperType, kind
        case artistID = "artistId"
        case collectionID = "collectionId"
        case trackID = "trackId"
        case artistName, collectionName, trackName, collectionCensoredName, trackCensoredName
        case artistViewURL = "artistViewUrl"
        case collectionViewURL = "collectionViewUrl"
        case trackViewURL = "trackViewUrl"
        case previewURL = "previewUrl"
        case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, releaseDate, collectionExplicitness, trackExplicitness, discCount, discNumber, trackCount, trackNumber, trackTimeMillis, country, currency, primaryGenreName, isStreamable
        case collectionArtistID = "collectionArtistId"
        case collectionArtistName, contentAdvisoryRating
    }
    
    let wrapperType: WrapperType
    let kind: Kind
    let artistID, collectionID, trackID: Int
    let artistName: ArtistName
    let collectionName, trackName, collectionCensoredName, trackCensoredName: String
    let artistViewURL, collectionViewURL, trackViewURL: String
    let previewURL: String
    let artworkUrl30, artworkUrl60, artworkUrl100: String
    let collectionPrice, trackPrice: Double
    let releaseDate: Date
    let collectionExplicitness, trackExplicitness: Explicitness
    let discCount, discNumber, trackCount, trackNumber: Int
    let trackTimeMillis: Int
    let country: Country
    let currency: Currency
    let primaryGenreName: PrimaryGenreName
    let isStreamable: Bool
    let collectionArtistID: Int?
    let collectionArtistName, contentAdvisoryRating: String?


}


