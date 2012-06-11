class FirstViewController < ContentViewController
  
  def loadView
     self.view = UIView.alloc.init
     self.title = 'First Controller'
     
     navigationItem.leftBarButtonItem = UIBarButtonItem.alloc.initWithTitle("Menu", style:UIBarButtonItemStylePlain, target:self, action:"slideMenuButtonTouched")
  end

  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor

    first = UILabel.alloc.initWithFrame([[20,0],[300,50]])
    first.text = "First Controller"
    self.view.addSubview(first)
  end
end
