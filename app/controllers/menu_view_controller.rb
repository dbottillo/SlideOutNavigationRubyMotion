class MenuViewController < UIViewController
  
  attr_accessor :screenShotImage, :screenShotImageView
  
  def loadView
    self.view = UIView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    view.backgroundColor = UIColor.scrollViewTexturedBackgroundColor
    
    # tableView for select a page to display    
    @tableView = UITableView.alloc.initWithFrame([[0,0],[254,460]])
    @tableView.backgroundColor = selectColor(73,87,107)
    @tableView.dataSource = @tableView.delegate = self
    view.addSubview(@tableView)
    
    # UIImageView on the right with the screenshot of the last contentViewController
    @screenShotImageView = UIImageView.alloc.init
    @screenShotImageView.userInteractionEnabled = true
    view.addSubview(@screenShotImageView)
  end
  
  def viewDidLoad
    # tapGesture for closing menu tapping the UIImageView on the right
    @tapGesture = UITapGestureRecognizer.alloc.initWithTarget(self, action:"singleTapScreenShot:")
    @screenShotImageView.addGestureRecognizer @tapGesture
    
    # panGesture for managing panning of UIImageView
    @panGesture = UIPanGestureRecognizer.alloc.initWithTarget(self, action:"panGestureMoveAround:")
    @panGesture.setMaximumNumberOfTouches 2
    @panGesture.setDelegate self
    @screenShotImageView.addGestureRecognizer @panGesture
  end 
  
  def viewWillAppear(animated)
    # put the screenshot of the last contentViewController and perform an animation from left to right
    @screenShotImageView.setImage(@screenShotImage) 
    @screenShotImageView.setFrame([[0,-20],[self.view.frame.size.width, self.view.frame.size.height+20]])
    
    UIView.animateWithDuration(0.25, delay:0, options: UIViewAnimationCurveEaseInOut, animations:lambda do
      @screenShotImageView.setFrame([[254,-20],[320,480]])
    end, completion: lambda do |finished| end)
  end
 
 
  # perform the animation from right to left and then close the menu
  def slideThenHide
    UIView.animateWithDuration(0.25, delay:0, options: UIViewAnimationCurveEaseInOut, animations:lambda do
      @screenShotImageView.setFrame([[0,-20],[self.view.frame.size.width, self.view.frame.size.height+20]])
    end, completion: lambda do |finished|
      appDelegate.hideSideMenu
    end)
  end
  
  def singleTapScreenShot(gestureRecognizer)
    slideThenHide
  end
  
  
  def panGestureMoveAround(gesture)
    piece = gesture.view
    adjustAnchorPointForGestureRecognizer gesture
    
    if (gesture.state == UIGestureRecognizerStateBegan || gesture.state == UIGestureRecognizerStateChanged) then
      translation = gesture.translationInView(piece.superview)
      
      x = piece.center.x + translation.x
      y = piece.center.y
      piece.setCenter(CGPointMake(x,y))
      gesture.setTranslation(CGPointZero, inView:piece.superview)
    else
      slideThenHide if gesture.state == UIGestureRecognizerStateEnded
    end
  end
  
  def adjustAnchorPointForGestureRecognizer(gestureRecognizer)
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) then
      piece = gestureRecognizer.view
      locationInView = gestureRecognizer.locationInView(piece)
      locationInSuperView = gestureRecognizer.locationInView(piece.superview)
      
      x = locationInView.x / piece.bounds.size.width
      y = locationInView.y / piece.bounds.size.height
      piece.layer.anchorPoint = CGPointMake(x,y)
      piece.center = locationInSuperView
    end
  end
  
  
  def tableView(tableView, numberOfRowsInSection:section)
    2
  end
  
  CELLID = 'CellMenuIdentifier'
  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CELLID) || begin
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:CELLID)
      cell
    end
    
    cell.textLabel.textColor = UIColor.whiteColor  
  
    cell.textLabel.text = "First" if indexPath.row == 0
    cell.textLabel.text = "Second" if indexPath.row == 1
    
    return cell
  end
  
  def tableView(tableView, willDisplayCell:cell, forRowAtIndexPath:indexPath)
    cell.backgroundColor = selectColor(110,132,162)
  end
    
  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
    appDelegate.setCurrentController(indexPath.row)
    
    slideThenHide
    tableView.deselectRowAtIndexPath(indexPath, animated:true)
  end

  
end
