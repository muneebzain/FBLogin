//
//  AppDelegate.swift
//  FBLogin
//
//  Created by Muneeb Zain on 08/03/2022.
//


// AppDelegate.swift
import UIKit
import FacebookCore
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
) -> Bool {
    ApplicationDelegate.shared.application(
        application,
        didFinishLaunchingWithOptions: launchOptions
        
    )
    FirebaseApp.configure()
    return true
}
      
func application(
    _ app: UIApplication,
    open url: URL,
    options: [UIApplication.OpenURLOptionsKey : Any] = [:]
) -> Bool {
    ApplicationDelegate.shared.application(
        app,
        open: url,
        sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
        annotation: options[UIApplication.OpenURLOptionsKey.annotation]
    )
}
    
    
}
