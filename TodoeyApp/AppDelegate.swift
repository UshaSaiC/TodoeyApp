//
//  AppDelegate.swift
//  TodoeyApp
//
//  Created by Usha Sai Chintha on 12/09/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    // this is called when the app is being launched
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // NSSearchPathForDirectoriesInDomains method points to directory where user defaults would be stored for a particular device's specific application represented by an unique id
        // path till unique id of application , after that whatever file we see are referred to as sandbox
        // dat is at, follw above path till unique id then, library (instead of documents) -> preferences -> .plist file in which we can save the data added
        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)
        return true
    }
    
    // this is called when something happens on phone while our app is on foreground like getting calls or messages
    func applicationWillResignActive(_ application: UIApplication) {
    }
    
    // this is called when application is removed from foreground by clicking on home button or opening some other app
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }
    
    // this is called when application is terminated either by user or system. Here app isn't there even in background.. its completely quitted
    func applicationWillTerminate(_ application: UIApplication) {
        
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

