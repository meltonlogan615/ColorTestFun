//
//  TabBarController.swift
//  ColorTestFun
//
//  Created by Logan Melton on 1/10/23.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    delegate = self
    style()
    layout()
  }
}

extension TabBarController {
  func style() {
    self.tabBar.backgroundColor = .secondarySystemBackground
    self.tabBar.tintColor = .red
    self.tabBar.unselectedItemTintColor = .blue
  }
  
  func layout() {
    let listTab = UINavigationController(rootViewController: ColorListViewController())
    let listItem = UITabBarItem(
      title: "List",
      image: UIImage(systemName: "checklist.unchecked"),
      selectedImage: UIImage(systemName: "checklist.checked"))
    listTab.tabBarItem = listItem
    
        let userDefined = UINavigationController(rootViewController: UserDefinedViewController())
        userDefined.view.backgroundColor = .systemBackground
        let definedItem = UITabBarItem(
          title: "DIY",
          image: UIImage(systemName: "seal"),
          selectedImage: UIImage(systemName: "seal.fill"))
        userDefined.tabBarItem = definedItem
    
    self.viewControllers = [
      listTab,
            userDefined
    ]
  }
  
  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    
  }
}

