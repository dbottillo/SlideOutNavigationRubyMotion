class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    
    
    @contentViewController = FirstViewController.alloc.init
    
    @window.rootViewController = @contentViewController
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible
    
    true
  end
  
  def showSideMenu
    puts "showSideMenu"
  end
end