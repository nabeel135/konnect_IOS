//
//  SceneDelegate.swift
//  Konnect
//
//  Created by Mr. Nabeel on 12/8/19.
//  Copyright © 2019 Mr. Nabeel. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowscene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowscene.coordinateSpace.bounds)
        window?.windowScene = windowscene
        window?.rootViewController = Dashboard()
        window?.makeKeyAndVisible()
    }
    
    


}

