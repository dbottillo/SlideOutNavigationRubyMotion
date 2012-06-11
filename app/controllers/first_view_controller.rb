class FirstViewController < ContentViewController
  
  def loadView
     self.view = UIView.alloc.init
     self.title = 'First Controller'
     
     navigationItem.leftBarButtonItem = UIBarButtonItem.alloc.initWithTitle("Menu", style:UIBarButtonItemStylePlain, target:self, action:"slideMenuButtonTouched")
     navigationItem.rightBarButtonItem = UIBarButtonItem.alloc.initWithTitle("Push", style:UIBarButtonItemStylePlain, target:self, action:"pushThird")
  end

  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor

    label = UILabel.alloc.initWithFrame([[20,0],[300,50]])
    label.text = "First Controller"
    self.view.addSubview(label)
  end
  
  
  def pushThird
    third = ThirdViewController.alloc.init if @third == nil
    navigationController.pushViewController(third, animated:true)    
  end
end
