//
//  NobetciEczaneSwiftUIAppApp.swift
//  NobetciEczaneSwiftUIApp
//
//  Created by M.Ömer Ünver on 23.03.2023.
//

import SwiftUI
import UIKit
//import GoogleMobileAds




class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        GADMobileAds.sharedInstance().start()
        return true
    }
}
@main
struct NobetciEczaneSwiftUIAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            SplashScreen()
        }
    }
}
