class SecondViewController < ContentViewController
  
  def loadView
     self.view = UIView.alloc.init
     self.title = 'Second Controller'
     
     navigationItem.leftBarButtonItem = UIBarButtonItem.alloc.initWithTitle("Menu", style:UIBarButtonItemStylePlain, target:self, action:"slideMenuButtonTouched")
  end

  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor

    label = UILabel.alloc.initWithFrame([[20,0],[300,50]])
    label.text = "Second Controller"
    self.view.addSubview(label)
  end
end
