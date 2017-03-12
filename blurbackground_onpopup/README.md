# Blurry-Pop-Up-Animation-with-UIVisualEffects

1. In this project a blur effect is applied on backgroud image on opening of popup, and it will be revert back on canceling the popup.

2. First create a xcode project, and add  uimageview add constraints to fit the complete screen.

3. Drag and drop Blur effect view from the story board elements.

4. Embed the view controller inside naigation controller. (editor->embed in -> Navigation Controller).

5. Now add a bar item to navigation bar(name it add).

6. Add Uiview(additemview) to viewcontroller.Add some label and a don or cancel button.

6. Create an outlet from the added blur effect (visual effect), additem view.

7. Add button acion for done button and add button from navigation bar.

8. Create a global view named   var effect:UIVisualEffect! 

9. In didload() function add this,
    
    Just to make sure the background image is not blur by default.

    effect = visualeffectview.effect
    visualeffectview.effect = nil
    additemview.layer.cornerRadius = 5

10. This is code for add item view

	  @IBAction func addItem(_ sender: AnyObject) {
        self.view.addSubview(additemview)
        additemview.center = self.view.center
        additemview.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        self.additemview.alpha = 0
        
        UIView.animate(withDuration: 0.5, animations: {
            self.visualeffectview.effect = self.effect
            self.additemview.alpha = 1
            self.additemview.transform = CGAffineTransform.identity
            
        })
        
    }


11. This is code for done item.

 @IBAction func dismisspopup(_ sender: AnyObject) {
        
        UIView.animate(withDuration: 0.3, animations: {
            self.additemview.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.additemview.alpha = 0
            self.visualeffectview.effect = nil
        }) { (success:Bool) in
               self.additemview.removeFromSuperview()
        }
        
    }
