//
//  HomeViewController.swift
//  FemaleMusic
//
//  Created by Ferdinand on 09/01/19.
//  Copyright © 2019 Tedjakusuma. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialBottomNavigation

class HomeViewController: UITabBarController, MDCBottomNavigationBarDelegate {
    
    lazy var bottomNavigationBar: MDCBottomNavigationBar = {
        let bottomNavigation = MDCBottomNavigationBar(frame: CGRect.zero)
        bottomNavigation.delegate = self
        bottomNavigation.alignment = MDCBottomNavigationBarAlignment.justifiedAdjacentTitles
        bottomNavigation.titleVisibility = MDCBottomNavigationBarTitleVisibility.selected
        return bottomNavigation
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        commonBottomNavigationTypicalUseExampleViewDidLoad()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.addSubview(bottomNavigationBar)
        layoutBottomNavBar()
    }
    
    override func viewSafeAreaInsetsDidChange() {
        if #available(iOS 11.0, *) {
            super.viewSafeAreaInsetsDidChange()
        }
        layoutBottomNavBar()
    }
        
    func commonBottomNavigationTypicalUseExampleViewDidLoad() {
        
        let tabOne = FindViewController()
        let tabBarItem1 = UITabBarItem.init(title: "Find", image: UIImage(named: "Search")!, tag: 0)
        tabOne.tabBarItem = tabBarItem1
        
        let tabTwo = WishlistTableViewController()
        let tabBarItem2 = UITabBarItem.init(title: "Wishlist", image: UIImage(named: "Favorite")!, tag: 1)
        tabTwo.tabBarItem = tabBarItem2
        
        let tabThree = CalenderViewController()
        let tabBarItem3 = UITabBarItem.init(title: "Calendar", image: UIImage(named: "Cake")!, tag: 2)
        tabThree.tabBarItem = tabBarItem3
        
        let tabFour = CreateViewController()
        let tabBarItem4 = UITabBarItem.init(title: "Create", image: UIImage(named: "Add")!, tag: 3)
        tabFour.tabBarItem = tabBarItem4
        
        let tabBarItem5 = UITabBarItem.init(title: "Logout", image: UIImage(named: "Demo")!, tag: 4)
       
        bottomNavigationBar.items = [tabBarItem1, tabBarItem2, tabBarItem3, tabBarItem4, tabBarItem5]
        bottomNavigationBar.selectedItem = tabBarItem1
        let viewControllerList = [tabOne, tabTwo, tabThree, tabFour]
        self.viewControllers = viewControllerList
        self.viewControllers = viewControllerList.map { UINavigationController(rootViewController: $0) }

    }
    
    func layoutBottomNavBar() {
        let size = bottomNavigationBar.sizeThatFits(view.bounds.size)
        bottomNavigationBar.frame = CGRect(x: 0, y: view.bounds.height - size.height, width: view.bounds.width, height: size.height)
    }
    
    //MARK: MDCBottomNavigationBarDelegate
    func bottomNavigationBar(_ bottomNavigationBar: MDCBottomNavigationBar, didSelect item: UITabBarItem) {
        if item.tag < 4 {
            self.selectedViewController = self.viewControllers![item.tag]
        } else {
           print("Selected Item:", item.title!)
        }
    }
}
