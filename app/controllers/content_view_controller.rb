class ContentViewController < UIViewController
  
  def loadView
    self.view = UIView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    self.view.backgroundColor = UIColor.whiteColor
    
    @navigationBar = UINavigationBar.alloc.initWithFrame([[0,20],[320,44]])
    navItem = UINavigationItem.alloc
    
    leftButton = UIBarButtonItem.alloc.initWithTitle("Left", style:UIBarButtonItemStylePlain, target:self, action:"slideMenuButtonTouched")
    navItem.leftBarButtonItem = leftButton
    @navigationBar.pushNavigationItem(navItem, animated:false)


    
    #@navigationBar.title = "ContentViewController"
    self.view.addSubview(@navigationBar)
  end
  
  def slideMenuButtonTouched
    appDelegate.showSideMenu
  end
end
