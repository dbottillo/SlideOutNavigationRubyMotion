class AppDelegate
  
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    
    # left menu view
    @menuViewController = MenuViewController.alloc.init
    
    # firstContainer is the first stack of controllers: it contains FirstViewController and ThirdViewController
    @firstContainer = UINavigationController.alloc.initWithRootViewController(FirstViewController.alloc.init)
    
    # contentViewController is the owner of the visibile container of controllers
    # application starts with firstContainer as a first page
    @contentViewController = @firstContainer
    @window.rootViewController = @contentViewController
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible
    
    true
  end
  
  # put the right container of controllers as a contentviewcontroller, index arrives from menu view controller after user clicks a row
  def setCurrentController(index)
    if index == 0 then
      @firstContainer = UINavigationController.alloc.initWithRootViewController(FirstViewController.alloc.init) if @firstContainer == nil
      @contentViewController = @firstContainer
    else
      @secondContainer = UINavigationController.alloc.initWithRootViewController(SecondViewController.alloc.init) if @secondContainer == nil
      @contentViewController = @secondContainer
    end
  end
  
  # take a screenshot of the contentViewController, pass it menuViewController and then change the rootViewController with menuViewController
  def showSideMenu
    viewSize = @contentViewController.view.bounds.size
    
    UIGraphicsBeginImageContextWithOptions(viewSize, false, 1.0)
    @contentViewController.view.layer.renderInContext(UIGraphicsGetCurrentContext())
    
    image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    @menuViewController.screenShotImage = image
    @window.rootViewController = @menuViewController
  end
  
  # put contentViewController back as a root View Controller
  def hideSideMenu
    @window.rootViewController = @contentViewController
  end
end