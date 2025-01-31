//
//  SceneDelegate.swift
//  Test-iOS
//
//  Created by Данил Марков on 12.11.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        let viewController = ViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Освобождаем ресурсы при отключении сцены
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Восстанавливаем состояние при активации сцены
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Приостанавливаем действия при неактивности сцены
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Подготовка к переходу из фона в активное состояние
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Сохранение состояния при переходе в фон
    }
}
