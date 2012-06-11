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
   
   def selectColor(red, green, blue)
     selectColorWithAlpha(red,green,blue,1)
   end
   
   def selectColorWithAlpha(red, green, blue, alpha)
     return UIColor.colorWithRed(red/255.to_f, green:green/255.to_f, blue:blue/255.to_f, alpha:alpha.to_f)
   end
end