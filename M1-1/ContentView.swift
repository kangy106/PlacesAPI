import SwiftUI
import GooglePlaces

struct ContentView: View {
    @State private var placeDetails: String = "Loading..."
    let examplePlaceID = "ChIJN1t_tDeuEmsRUsoyG83frY4"

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text(placeDetails)
                .padding()
        }
        .padding()
        .onAppear {
            getPlaceDetails(placeID: examplePlaceID) { details in
                placeDetails = details
            }
        }
    }
}

func getPlaceDetails(placeID: String, completion: @escaping (String) -> Void) {
    let placesClient = GMSPlacesClient.shared()
    let placeFields: GMSPlaceField = [.name, .formattedAddress, .coordinate, .phoneNumber, .website, .openingHours]

    placesClient.fetchPlace(fromPlaceID: placeID, placeFields: placeFields, sessionToken: nil) { (place, error) in
        if let error = error {
            print("An error occurred: \(error.localizedDescription)")
            completion("An error occurred: \(error.localizedDescription)")
            return
        }
        
        guard let place = place else {
            print("No place details found")
            completion("No place details found")
            return
        }
        
        // 取得した場所の詳細情報を文字列にまとめる
        var details = ""
        details += "Place name: \(place.name ?? "No name")\n"
        details += "Address: \(place.formattedAddress ?? "No address")\n"
        details += "Coordinates: \(place.coordinate.latitude), \(place.coordinate.longitude)\n"
        details += "Phone number: \(place.phoneNumber ?? "No phone number")\n"
        details += "Website: \(place.website?.absoluteString ?? "No website")\n"
        
        if let openingHours = place.openingHours?.weekdayText {
            details += "Opening hours:\n"
            for period in openingHours {
                details += "\(period)\n"
            }
        } else {
            details += "No opening hours\n"
        }
        
        completion(details)
    }
}

#Preview {
    ContentView()
}
