//
//  SceneDelegate.swift
//  colors-list-MVVM
//
//  Created by Tilek Koszhanov on 02.04.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let sceneWindow = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: sceneWindow)
        let viewController = Builder.createMainModule()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}
