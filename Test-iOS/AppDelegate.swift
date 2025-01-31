//
//  AppDelegate.swift
//  Test-iOS
//
//  Created by Данил Марков on 12.11.2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Создаем окно
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // Создаем экземпляр ViewController
        let viewController = ViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        // Устанавливаем корневой контроллер
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}
