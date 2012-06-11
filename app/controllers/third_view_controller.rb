class ThirdViewController < ContentViewController
  
  def loadView
     self.view = UIView.alloc.init
     self.title = 'Third Controller'
     
     navigationItem.leftBarButtonItem = UIBarButtonItem.alloc.initWithTitle("Menu", style:UIBarButtonItemStylePlain, target:self, action:"slideMenuButtonTouched")
     
     navigationItem.rightBarButtonItem = UIBarButtonItem.alloc.initWithTitle("Pull", style:UIBarButtonItemStylePlain, target:self, action:"pullThird")
  end

  def viewDidLoad
    view.backgroundColor = UIColor.whiteColor

    label = UILabel.alloc.initWithFrame([[20,0],[300,50]])
    label.text = "Third Controller"
    self.view.addSubview(label)
  end
  
  def pullThird
    navigationController.popViewControllerAnimated(animated:true)    
  end
end
