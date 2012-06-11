class AppDelegate
  
  attr_accessor :window
  
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    
    @menuViewController = MenuViewController.alloc.init
    
    
    @firstContainer = UINavigationController.alloc.initWithRootViewController(FirstViewController.alloc.init)
    
    @contentViewController = @firstContainer
    
    @window.rootViewController = @contentViewController
    
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible
    
    true
  end
  
  def setCurrentController(index)
    if index == 0 then
      @firstContainer = UINavigationController.alloc.initWithRootViewController(FirstViewController.alloc.init) if @firstContainer == nil
      @contentViewController = @firstContainer
    else
      @secondContainer = UINavigationController.alloc.initWithRootViewController(SecondViewController.alloc.init) if @secondContainer == nil
      @contentViewController = @secondContainer
    end
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