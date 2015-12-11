//
//  GlobalSettings.swift
//  GameFramework
//
//  Created by apple on 1/16/15.
//  Copyright (c) 2015 apple. All rights reserved.
//

import Foundation
import UIColor_Hex_Swift

class GlobalSettings {
    
    class func addUserDefaults(){
        
        
        GlobalVariables.globalUserDefaults.setInteger(0, forKey: GlobalVariables.user_defaults_app_iteration_number_key)
        
        GlobalVariables.globalUserDefaults.setBool(false, forKey: GlobalVariables.user_defaults_app_purchased_flag_key)
        
        GlobalVariables.globalUserDefaults.setInteger(-1,forKey:GlobalVariables.user_defaults_match_id_key)
        
        GlobalVariables.globalUserDefaults.setInteger(-1,forKey:GlobalVariables.user_defaults_location_id_key)
        
        GlobalVariables.globalUserDefaults.setInteger(-1,forKey:GlobalVariables.user_defaults_tournment_id_key)
        
        GlobalVariables.globalUserDefaults.setBool(false,forKey:GlobalVariables.user_defaults_remember_me_key)
     
        GlobalVariables.globalUserDefaults.setBool(false,forKey:GlobalVariables.user_defaults_signed_in_key)

        GlobalVariables.globalUserDefaults.setValue("", forKey: GlobalVariables.user_defaults_session_id_key)
      
        GlobalVariables.globalUserDefaults.setValue("", forKey: GlobalVariables.user_defaults_username_key)
    
        GlobalVariables.globalUserDefaults.setValue("", forKey: GlobalVariables.user_defaults_password_key)
        
        GlobalVariables.globalUserDefaults.setValue("", forKey: GlobalVariables.user_defaults_city_id_key)
        
        GlobalVariables.globalUserDefaults.setValue("", forKey: GlobalVariables.user_defaults_course_id_key)
        
        GlobalVariables.globalUserDefaults.setValue("", forKey: GlobalVariables.user_defaults_user_id_key)
        
        GlobalVariables.globalUserDefaults.setValue("", forKey: GlobalVariables.user_defaults_role_id_key)
        
        GlobalVariables.globalUserDefaults.setValue("", forKey: GlobalVariables.user_defaults_name_key)
        
        GlobalVariables.globalUserDefaults.setBool(GlobalVariables.isPurchased, forKey: GlobalVariables.user_defaults_isPurchased_key)


        
        NSUserDefaults.standardUserDefaults().synchronize()
        
        
    }
    class func increaseAppIterationNumber(){
        
        var iterationNumber = GlobalVariables.globalUserDefaults.integerForKey(GlobalVariables.user_defaults_app_iteration_number_key)
        
        iterationNumber = iterationNumber+1;
        
        GlobalVariables.globalUserDefaults.setInteger(iterationNumber, forKey: GlobalVariables.user_defaults_app_iteration_number_key)
        
        NSUserDefaults.standardUserDefaults().synchronize()

    }
    
    class func isPurchased() -> Bool{
        
        let isPurchased = GlobalVariables.globalUserDefaults.boolForKey(GlobalVariables.user_defaults_isPurchased_key)
        
        return isPurchased
    }
    class func setIsPurchased(value: Bool){
        
        GlobalVariables.globalUserDefaults.setBool(value, forKey: GlobalVariables.user_defaults_isPurchased_key)
        
        NSUserDefaults.standardUserDefaults().synchronize()

    }

    class func udateSessionId(value:NSString){
        
        GlobalVariables.globalUserDefaults.setValue(value, forKey: GlobalVariables.user_defaults_session_id_key)
        
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
    

    class func updateRoleIdDefaultValue(value : NSString){
        
        
        GlobalVariables.globalUserDefaults.setValue(value, forKey: GlobalVariables.user_defaults_role_id_key)
        
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }

    class func getNewMatchId() -> Int{
        
        var currentValue = GlobalVariables.globalUserDefaults.integerForKey(GlobalVariables.user_defaults_match_id_key)
        
        currentValue = currentValue+1;
        
        GlobalVariables.globalUserDefaults.setInteger(currentValue, forKey: GlobalVariables.user_defaults_match_id_key)
        
        NSUserDefaults.standardUserDefaults().synchronize()
        
        return GlobalVariables.globalUserDefaults.integerForKey(GlobalVariables.user_defaults_match_id_key)
        
    }
    
    class func getNewLocationId() -> Int{
        
        var currentValue = GlobalVariables.globalUserDefaults.integerForKey(GlobalVariables.user_defaults_location_id_key)
        
        currentValue = currentValue+1;
        
        GlobalVariables.globalUserDefaults.setInteger(currentValue, forKey: GlobalVariables.user_defaults_location_id_key)
        
        NSUserDefaults.standardUserDefaults().synchronize()
    
        return GlobalVariables.globalUserDefaults.integerForKey(GlobalVariables.user_defaults_location_id_key)
    }
    
    
    class func updateRemeberMeDefaultValue(boolValue : Bool){
        
        GlobalVariables.globalUserDefaults.setBool(boolValue, forKey: GlobalVariables.user_defaults_remember_me_key)
        
        NSUserDefaults.standardUserDefaults().synchronize()

    }

    class func updateSignedInDefaultValue(boolValue : Bool){
        
        
        GlobalVariables.globalUserDefaults.setBool(boolValue, forKey: GlobalVariables.user_defaults_signed_in_key)
        
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
    class func updateUsernameDefaultValue(value : NSString){
        
        
        GlobalVariables.globalUserDefaults.setValue(value, forKey: GlobalVariables.user_defaults_username_key)
        
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
    
    class func updateCityDefaultValue(value : NSString){
        
        
        GlobalVariables.globalUserDefaults.setValue(value, forKey: GlobalVariables.user_defaults_city_id_key)
        
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
    
    class func updateCourseDefaultValue(value : NSString){
        
        
        GlobalVariables.globalUserDefaults.setValue(value, forKey: GlobalVariables.user_defaults_course_id_key)
        
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
   
    class func updateUsername(value : NSString){
        
        
        GlobalVariables.globalUserDefaults.setValue(value, forKey: GlobalVariables.user_defaults_name_key)
        
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }

    
    
    class func updateUserIdDefaultValue(value : NSString){
        
        
        GlobalVariables.globalUserDefaults.setValue(value, forKey: GlobalVariables.user_defaults_user_id_key)
        
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }

    class func updateFromYearDefaultValue(value : Int){
        
        
        GlobalVariables.globalUserDefaults.setInteger(value, forKey: GlobalVariables.user_defaults_from_year_key)
        
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
    class func updateToYearDefaultValue(value : Int){
        
        
        GlobalVariables.globalUserDefaults.setInteger(value, forKey: GlobalVariables.user_defaults_to_year_key)
        
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
    class func updateFromMonthDefaultValue(value : Int){
        
        
        GlobalVariables.globalUserDefaults.setInteger(value, forKey: GlobalVariables.user_defaults_from_month_key)
        
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
    class func updateToMonthDefaultValue(value : Int){
        
        
        GlobalVariables.globalUserDefaults.setInteger(value, forKey: GlobalVariables.user_defaults_to_month_key)
        
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
    
    class func updatePasswordDefaultValue(value : NSString){
        
        GlobalVariables.globalUserDefaults.setValue(value, forKey: GlobalVariables.user_defaults_password_key)
        
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
    
    class func getNewTournmentId()-> Int{
        
        var currentValue = GlobalVariables.globalUserDefaults.integerForKey(GlobalVariables.user_defaults_tournment_id_key)
        
        currentValue = currentValue+1;
        
        GlobalVariables.globalUserDefaults.setInteger(currentValue, forKey: GlobalVariables.user_defaults_tournment_id_key)
        
        NSUserDefaults.standardUserDefaults().synchronize()
        
        return GlobalVariables.globalUserDefaults.integerForKey(GlobalVariables.user_defaults_tournment_id_key)
        
    }
    class func setButtonProperties(button:UIButton){
        
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 4
        button.layer.borderColor = UIColor.whiteColor().CGColor
        button.backgroundColor = UIColor.clearColor()

    }
    class func setScoreboardButtonProperties(button:UIButton){
        
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blackColor().CGColor
        button.backgroundColor = UIColor.whiteColor()
       

        
    }
    class func setTextfiledProperties(textFiled:UITextField){
        
        textFiled.layer.borderColor = UIColor.clearColor().CGColor
        //textFiled.floatingPlaceholderEnabled = true
        //textFiled.tintColor = UIColor.MKColor.Green
        //textFiled.rippleLocation = .Right
        //textFiled.cornerRadius = 0
        //textFiled.bottomBorderEnabled = true
        
    }
    

    enum TableViewCellEnum : Int {
        
        case kTimerCell = 0
        case kTriesCell = 1
        case kGoalsCell = 2
        case kPenaltiesCell = 3
        case kConversionsCell = 4
        case kTotalCell = 5
        case kMenuCell = 6
        
        
    }



    // MARK: Colours functions
    class func RGBA(r r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat)->UIColor{
        
        let color: UIColor = UIColor( red: CGFloat(r/255.0), green: CGFloat(g/255.0), blue: CGFloat(b/255.0), alpha: CGFloat(a) )
        return color
    }
    
  
    
    /*class func saveImageToDirectory(photo_url:NSString) {
        
        let fileUrl = NSURL(string: photo_url as String)
        
        let request: NSURLRequest = NSURLRequest(URL: fileUrl!)
        let mainQueue = NSOperationQueue.mainQueue()
        
        NSURLConnection.sendAsynchronousRequest(request, queue: mainQueue, completionHandler: { (response, data, error) -> Void in
            if error == nil {
                let image = UIImage(data: data!)
                
                dispatch_async(dispatch_get_main_queue(), {
                    
                    let imagePath = fileUrl?.lastPathComponent
                    
                    let imageToSave:NSData = UIImagePNGRepresentation(image!)!
                    
                    let path = NSTemporaryDirectory() + imagePath!
                    
                    imageToSave.writeToFile(path, atomically: true)
                    
                })
            }
            
        })
        
    }*/
    class func isImageAvailable(photo_url:NSString) -> Bool {
        
        let fileUrl = NSURL(string: photo_url as String)
        
        let fileManager = NSFileManager.defaultManager()
        
        let imagePath = fileUrl?.lastPathComponent
        
        let path = NSTemporaryDirectory() + imagePath!
        
        if (fileManager.fileExistsAtPath(path)){
            
            return true
            
        }else{
            
            return false
        }
    }
    /*class func getImageFromPath(photo_url:NSString) -> UIImage {
        
        let fileUrl = NSURL(string: photo_url as String)
        
        let fileManager = NSFileManager.defaultManager()
        
        let imagePath = fileUrl?.lastPathComponent
        
        let path = NSTemporaryDirectory() + imagePath!
        
        return UIImage(contentsOfFile: path)!
    }
    class func removeImageFromPath(photo_url:NSString)  {
        
        let fileUrl = NSURL(string: photo_url as String)
        
        let fileManager = NSFileManager.defaultManager()
        
        let imagePath = fileUrl?.lastPathComponent
        
        let path = NSTemporaryDirectory() + imagePath!
        
        if (fileManager.fileExistsAtPath(path)){
            
            var error:NSError?
            
            fileManager.removeItemAtPath(path)
            
        }
    }*/
  
    class func setNavigationBarProperties() {
        
        //Navigation bar settings
        let navbarFont = UIFont(name: "Ubuntu", size: 17) ?? UIFont.systemFontOfSize(17)
        //let barbuttonFont = UIFont(name: "Ubuntu-Light", size: 15) ?? UIFont.systemFontOfSize(15)
        
        UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName: navbarFont, NSForegroundColorAttributeName:UIColor.whiteColor()]
        
        UINavigationBar.appearance().barTintColor = UIColor(rgba: GlobalVariables.appColor)
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()

    }
    
 
}