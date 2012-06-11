module Kernel
  private
  
  def appDelegate
    UIApplication.sharedApplication.delegate
  end
  
   def alert title, message
     UIAlertView.alloc.initWithTitle(title, 
             message: message,
             delegate: nil,
             cancelButtonTitle: _("Ok"),
             otherButtonTitles: nil).show
  end
end