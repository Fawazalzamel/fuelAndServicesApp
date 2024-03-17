import UIKit

class MainTabBarController: UITabBarController {
    
    var token : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViewControllers()
        customizeTabBarAppearance()
        token = UserDefaults.standard.string(forKey: "token")
        print("main: " + (token ?? "no token"))
    }
    
    func setupViewControllers() {
        let homeViewController = HomeViewController()
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        let requestViewController = RequestPageViewController()
        requestViewController.token = token
        requestViewController.tabBarItem = UITabBarItem(title: "Request", image: UIImage(systemName: "square.and.arrow.down"), selectedImage: UIImage(systemName: "square.and.arrow.down.fill"))
        
        let profileViewController = ProfileViewController()
        profileViewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
        viewControllers = [homeViewController, requestViewController, profileViewController]
    }
    
    func customizeTabBarAppearance() {
        // Set the selected color
        UITabBar.appearance().tintColor = UIColor.darkerOrange
        
        // Set the unselected color
        for item in tabBar.items ?? [] {
            item.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.darkerOrange], for: .normal)
        }
    }
}

extension UIColor {
    static var darkerOrange: UIColor {
        return UIColor(red: 1.0, green: 0.6, blue: 0.0, alpha: 1.0)
    }
}
