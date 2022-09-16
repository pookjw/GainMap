//
//  SceneDelegate.swift
//  GainMap
//
//  Created by Jinwoo Kim on 9/16/22.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene: UIWindowScene = (scene as? UIWindowScene) else {
      return
    }

    let window: UIWindow = .init(windowScene: windowScene)
    let viewController: ViewController = .init()
    window.rootViewController = viewController
    window.makeKeyAndVisible()
    self.window = window
  }
}
