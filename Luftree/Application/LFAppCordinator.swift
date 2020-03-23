import UIKit

protocol AppCoordinator {
    static func configureRootViewController(
                rootViewController: UIViewController,
                inWindow window: UIWindow?)
}

final public class LFAppCoordinator: AppCoordinator {
    static func configureRootViewController(
                rootViewController: UIViewController,
                inWindow window: UIWindow?) {
                window?.rootViewController = rootViewController
                window?.makeKeyAndVisible()
    }
}
