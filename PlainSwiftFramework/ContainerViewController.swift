//
//  ContainerViewController.swift
//  SlideOutNavigation
//
//  Created by James Frost on 03/08/2014.
//  Copyright (c) 2014 James Frost. All rights reserved.
//

import UIKit
import QuartzCore

enum SlideOutState {
    
    case BothCollapsed
    case LeftPanelExpanded
    case RightPanelExpanded
}

enum DetailsViewControllerEnum:Int {
    
    case FirstViewController = 0
    
}
class ContainerViewController: UIViewController {
    
    var centerNavigationController: UINavigationController!
    var selectedIndex = 0
    var menuSliderViewController: SideMenuViewController?
    let centerPanelExpandedOffset: CGFloat = 60

    var currentState: SlideOutState = .BothCollapsed {
        
        didSet {
           
            let shouldShowShadow = currentState != .BothCollapsed
            showShadowForCenterViewController(shouldShowShadow)
        }
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addDetailsViewContoller(selectedIndex)
      
    }
    
    override func viewWillAppear(animated: Bool) {
        
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBarHidden = false
    }
    
    
    func addDetailsViewContoller(viewControllerEnumValue:Int){
        
        switch(viewControllerEnumValue){
            
        case DetailsViewControllerEnum.FirstViewController.rawValue:
            
            let detailViewController:FirstViewController = UIStoryboard.firstViewController()!
            detailViewController.menuButtonDlegate = self
            
            // wrap the centerViewController in a navigation controller, so we can push views to it
            // and display bar button items in the navigation bar
            centerNavigationController = UINavigationController(rootViewController: detailViewController)
            //Navigate to details view
            view.addSubview(centerNavigationController.view)
            addChildViewController(centerNavigationController)
            
            centerNavigationController.didMoveToParentViewController(self)

        default:
            break

        }
        
    }
    
}

// MARK: CenterViewController delegate
extension ContainerViewController: SideMenuViewControllerDelegate {
    
    func toggleLeftPanel() {
        
        let notAlreadyExpanded = (currentState != .LeftPanelExpanded)
        
        if notAlreadyExpanded {
          
            addLeftPanelViewController()
        }
        
        animateLeftPanel(shouldExpand: notAlreadyExpanded)
    }
    func menuOptionSelected() {
        
        
    }
    func collapseSidePanels() {
       
        switch (currentState) {
            
        case .LeftPanelExpanded:
          
            toggleLeftPanel()
        
        default:
            break
        }
    }
    
    func addLeftPanelViewController() {
        
        if (menuSliderViewController == nil) {
            
            menuSliderViewController = UIStoryboard.menuSliderViewController()
            
            menuSliderViewController!.menuItemsArray = MenuItem.getAllMenuItems()
            
            addChildSidePanelController(menuSliderViewController!)
            
            
        }
    }
    
    func addChildSidePanelController(sidePanelController: SideMenuViewController) {
       
        
        sidePanelController.deleagate = self
        
        view.insertSubview(sidePanelController.view, atIndex: 0)
        
        addChildViewController(sidePanelController)
        
        sidePanelController.didMoveToParentViewController(self)
    }
    
    
    func animateLeftPanel(shouldExpand shouldExpand: Bool) {
       
        if (shouldExpand) {
            
            currentState = .LeftPanelExpanded
            
            animateCenterPanelXPosition(targetPosition: CGRectGetWidth(centerNavigationController.view.frame) - centerPanelExpandedOffset)
            
        } else {
            
            animateCenterPanelXPosition(targetPosition: 0) {finished in
                
                self.currentState = .BothCollapsed
                self.menuSliderViewController!.view.removeFromSuperview()
                self.menuSliderViewController = nil;
            }
        }
    }
    
    func animateCenterPanelXPosition(targetPosition targetPosition: CGFloat, completion: ((Bool) -> Void)! = nil) {
        
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .CurveEaseInOut, animations: {
            self.centerNavigationController.view.frame.origin.x = targetPosition
            }, completion: completion)
    }
 
    func showShadowForCenterViewController(shouldShowShadow: Bool) {
        
        if (shouldShowShadow) {
            
            centerNavigationController.view.layer.shadowOpacity = 0.8
            
        } else {
            
            centerNavigationController.view.layer.shadowOpacity = 0.0
        }
    }
    func replaceViewController(row:NSInteger){
        
        self.currentState = .BothCollapsed
        
        centerNavigationController.removeFromParentViewController()
        
        if(row == 0){
            
            addDetailsViewContoller(DetailsViewControllerEnum.FirstViewController.rawValue)
            
        }
    }
    
}

extension ContainerViewController: UIGestureRecognizerDelegate {
    
    // MARK: Gesture recognizer
    func handlePanGesture(recognizer: UIPanGestureRecognizer) {
        
        let gestureIsDraggingFromLeftToRight = (recognizer.velocityInView(view).x > 0)
        
        switch(recognizer.state) {
            
        case .Began:
            
            if (currentState == .BothCollapsed) {
                
                if (gestureIsDraggingFromLeftToRight) {
                    
                    addLeftPanelViewController()
                }
                
                showShadowForCenterViewController(true)
            }
        case .Changed:
            
            recognizer.view!.center.x = recognizer.view!.center.x + recognizer.translationInView(view).x
            recognizer.setTranslation(CGPointZero, inView: view)
            
        case .Ended:
            if (menuSliderViewController != nil) {
                
                let hasMovedGreaterThanHalfway = recognizer.view!.center.x > view.bounds.size.width
                animateLeftPanel(shouldExpand: hasMovedGreaterThanHalfway)
            }
        default:
            break
        }
    }
}
extension ContainerViewController: MenuButtonDelegate {
    
    func replaceDetailsViewController(row:NSInteger){
    
        self.currentState = .BothCollapsed
        
        centerNavigationController.removeFromParentViewController()
        
        switch(row){
            
        case DetailsViewControllerEnum.FirstViewController.rawValue:
            
            addDetailsViewContoller(DetailsViewControllerEnum.FirstViewController.rawValue)
            
        default:
            break
        }
    }
    
}
private extension UIStoryboard{
    
    class func mainStoryboard() -> UIStoryboard {
    
        return UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
    }
    
    class func menuSliderViewController() -> SideMenuViewController? {
        
        return mainStoryboard().instantiateViewControllerWithIdentifier("SideMenuViewController") as? SideMenuViewController
        
    }
    
    class func firstViewController() -> FirstViewController? {
        
        return mainStoryboard().instantiateViewControllerWithIdentifier("FirstViewController") as? FirstViewController
        
    }
    
}