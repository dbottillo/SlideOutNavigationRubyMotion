class FirstViewController < ContentViewController
   
  def viewDidLoad
    
    @navigationBar.topItem.title = "First Controller"
    
    first = UILabel.alloc.initWithFrame([[20,120],[300,50]])
    first.text = "First Controller"
    self.view.addSubview(first)
  end
end
