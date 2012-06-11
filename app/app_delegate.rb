class AppDelegate
  
  attr_accessor :window
  
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    
    @menuViewController = MenuViewController.alloc.init
    
    @contentViewController = UINavigationController.alloc.initWithRootViewController(FirstViewController.alloc.init)
    
    @window.rootViewController = @contentViewController
    
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible
    
    true
  end
  
  def setContentViewController(controller)
    @contentViewController = UINavigationController.alloc.initWithRootViewController(controller)
  end
  
  def showSideMenu
    viewSize = @contentViewController.view.bounds.size
    
    UIGraphicsBeginImageContextWithOptions(viewSize, false, 1.0)
    @contentViewController.view.layer.renderInContext(UIGraphicsGetCurrentContext())
    
    image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    @menuViewController.screenShotImage = image
    @window.rootViewController = @menuViewController
  end
  
  def hideSideMenu
    @window.rootViewController = @contentViewController
  end
end