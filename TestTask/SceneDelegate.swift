//
//  SceneDelegate.swift
//  TestTask
//
//  Created by  Alexandr Zakharov on 21.02.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else {
            return
        }

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = scene

        let loginVC = LoginContainer.assemble().viewController
        
        window?.rootViewController = loginVC
        window?.makeKeyAndVisible()
    }
    
    
    func logout() {
        let loginVC = LoginContainer.assemble().viewController
        
        window?.rootViewController = loginVC
        window?.makeKeyAndVisible()
    }


}

