//
//  ViewController.swift
//  FemaleMusic
//
//  Created by Ferdinand on 08/01/19.
//  Copyright © 2019 Tedjakusuma. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialBottomNavigation

class ViewController: UIViewController, MDCBottomNavigationBarDelegate {
    
    weak var bottomNavBar : MDCBottomNavigationBar!{
        didSet{
            bottomNavBar.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonBottomNavigationTypicalUseExampleViewDidLoad()
//        self.view.backgroundColor = self.colorScheme.backgroundColor

    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        layoutBottomNavBar()
    }
    
    override func viewSafeAreaInsetsDidChange() {
        if #available(iOS 11.0, *) {
            super.viewSafeAreaInsetsDidChange()
        }
        layoutBottomNavBar()
    }

    func commonBottomNavigationTypicalUseExampleViewDidLoad() {
//
//    _bottomNavBar = [[MDCBottomNavigationBar alloc] initWithFrame:CGRectZero];
//    _bottomNavBar.titleVisibility = MDCBottomNavigationBarTitleVisibilitySelected;
//    _bottomNavBar.alignment = MDCBottomNavigationBarAlignmentJustifiedAdjacentTitles;
//    _bottomNavBar.delegate = self;
//    [self.view addSubview:_bottomNavBar];
//
//    UITabBarItem *tabBarItem1 =
//    [[UITabBarItem alloc] initWithTitle:@"Home"
//    image:[UIImage imageNamed:@"Home"]
//    tag:0];
//    UITabBarItem *tabBarItem2 =
//    [[UITabBarItem alloc] initWithTitle:@"Messages"
//    image:[UIImage imageNamed:@"Email"]
//    tag:0];
//    UITabBarItem *tabBarItem3 =
//    [[UITabBarItem alloc] initWithTitle:@"Favorites"
//    image:[UIImage imageNamed:@"Favorite"]
//    tag:0];
//    UITabBarItem *tabBarItem4 =
//    [[UITabBarItem alloc] initWithTitle:@"Search"
//    image:[UIImage imageNamed:@"Search"]
//    tag:0];
//    tabBarItem4.badgeValue = @"88";
//    UITabBarItem *tabBarItem5 =
//    [[UITabBarItem alloc] initWithTitle:@"Birthday"
//    image:[UIImage imageNamed:@"Cake"]
//    tag:0];
//    tabBarItem5.badgeValue = @"999+";
//    #if defined(__IPHONE_10_0) && (__IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0)
//    #pragma clang diagnostic push
//    #pragma clang diagnostic ignored "-Wpartial-availability"
//    if ([tabBarItem5 respondsToSelector:@selector(badgeColor)]) {
//    tabBarItem5.badgeColor = [MDCPalette cyanPalette].accent700;
//    }
//    #pragma clang diagnostic pop
//    #endif
//    _bottomNavBar.items = @[ tabBarItem1, tabBarItem2, tabBarItem3, tabBarItem4, tabBarItem5 ];
//    _bottomNavBar.selectedItem = tabBarItem2;
//
//    self.navigationItem.rightBarButtonItem =
//    [[UIBarButtonItem alloc] initWithTitle:@"+Message"
//    style:UIBarButtonItemStylePlain
//    target:self
//    action:@selector(updateBadgeItemCount)];
//    self.navigationItem.rightBarButtonItem.accessibilityLabel = @"Add a message";
//    self.navigationItem.rightBarButtonItem.accessibilityHint =
//    @"Increases the badge on the \"Messages\" tab.";
//    self.navigationItem.rightBarButtonItem.accessibilityIdentifier = @"messages-increment-badge";
    }
    
    func layoutBottomNavBar() {
//    CGSize size = [_bottomNavBar sizeThatFits:self.view.bounds.size];
//    CGRect bottomNavBarFrame = CGRectMake(0,
//    CGRectGetHeight(self.view.bounds) - size.height,
//    size.width,
//    size.height);
//    _bottomNavBar.frame = bottomNavBarFrame;
    }
    
    
    //MARK: MDCBottomNavigationBarDelegate
    
    func bottomNavigationBar(_ bottomNavigationBar: MDCBottomNavigationBar, didSelect item: UITabBarItem) {
        print("Selected Item:", item.title!)
    }

}
