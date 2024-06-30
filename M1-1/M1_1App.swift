//
//  M1_1App.swift
//  M1-1
//
//  Created by Nagayama Kazuki on 2024/06/30.
//

import SwiftUI
import UIKit
import GoogleMaps
import GooglePlaces
@main
struct M1_1App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?

      func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // Override point for customization after application launch.
          GMSServices.provideAPIKey("AIzaSyDj-CmPmozmkXKyb6MBwXeT9TDNd5w8sW8")
          GMSPlacesClient.provideAPIKey("AIzaSyDj-CmPmozmkXKyb6MBwXeT9TDNd5w8sW8")

        return true
      }
}
