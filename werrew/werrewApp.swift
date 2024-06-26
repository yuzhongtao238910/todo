//
//  werrewApp.swift
//  werrew
//
//  Created by 于忠涛 on 2024/6/24.
//

import UserNotificationsUI
import SwiftUI

@main
struct werrewApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: { (success, error) in
                        if success {
                            print("success")
                        }
                        if error != nil {
                            print("error")
                        }
                    })
                }
        }
    }
}















