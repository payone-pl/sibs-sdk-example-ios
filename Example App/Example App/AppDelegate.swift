//
//  AppDelegate.swift
//  Example App
//
//  Created by Marcin Kuświk on 30/11/2022.
//

import UIKit
import SibsSDK

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    // data for sandbox
    private let baseURL = "https://stargate-cer.qly.site1.sibs.pt"
    private let webURL = "https://stargate-cer.qly.site1.sibs.pt"
    private let clientID = "502dfe94-5d7a-40e4-a707-e50cedda6c4b"
    private let token = "eyJhbGciOiJIUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJjODQxM2VmNC1iMDc1LTRhMGMtOWM5OS1lMDZlMDEzNDAxMmEifQ.eyJpYXQiOjE2NzA5NDQyMzYsImp0aSI6IjAxZDNhNDRjLTk0ZDgtNGY4Yi1hMmE0LWY4NzlmNDc1YjI4ZSIsImlzcyI6Imh0dHBzOi8vY2VyLnNpdGUxLnNzby5zeXMuc2licy5wdC9hdXRoL3JlYWxtcy9DRVIuU1BHLUlOVC5BUEkiLCJhdWQiOiJodHRwczovL2Nlci5zaXRlMS5zc28uc3lzLnNpYnMucHQvYXV0aC9yZWFsbXMvQ0VSLlNQRy1JTlQuQVBJIiwic3ViIjoiNTg5MTdlMWUtOTMxOC00ZmVhLWIzZjYtOTcwZDkyNTMxZGM4IiwidHlwIjoiT2ZmbGluZSIsImF6cCI6IkNFUi5TUEctSU5ULkFQSS1DTEkiLCJzZXNzaW9uX3N0YXRlIjoiZTNkYmNmMTYtNDdjOS00NTllLTk4ZTgtMTQ5MmQ5YTZiMGIyIiwic2NvcGUiOiJvcGVuaWQgcHJvZmlsZSBvZmZsaW5lX2FjY2VzcyBlbWFpbCJ9.farJCsVCx5wM-HMOuU7rAlthBa1Kg0BN01SGNdcB424.eyJtYyI6IjIxMiIsInRjIjoiMTgyIn0=.D7AF6CA6B2774F82E6F63EA52001291F621CA5902D2444C8EFC538F2DFDCF828"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        SIBS.configure(withBaseURL: baseURL, webURL: webURL, clientID: clientID, token: token, language: .en)
        return true
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
