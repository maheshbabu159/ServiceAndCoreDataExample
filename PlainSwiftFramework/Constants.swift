//
//  Constants.swift
//  GameFramework
//
//  Created by apple on 1/16/15.
//  Copyright (c) 2015 apple. All rights reserved.
//

import Foundation

struct GlobalVariables {


    static let globalUserDefaults = NSUserDefaults.standardUserDefaults()

    static let globalSingleton =  GlobalSingleton.sharedInstance

    static let blue_color = "#4AB3EF"
    static let green_color = "#fc4f02"
    static let yellow_color = "#fc4f02"
    static let appColor = "#F04300"
    
    static let timeInterval = 60.0
    
    static let admobBannerId = "ca-app-pub-1963486029431498/2630997168"
    static let admobInterstialId = "ca-app-pub-1963486029431498/4107730369"
    
    static let isPurchased : Bool = false

    static let inappPurchaseProductId = "com.sptcs.rugbyscoreboard.Rugby"
    static let appName = "Rugby Scoreboard"

    //User defuals keys
    static let user_defaults_app_iteration_number_key = "app_iteration_number"
    static let user_defaults_app_purchased_flag_key = "is_app_purchased"
    static let user_defaults_level_objects_array_key = "level_objects_array"
    static let user_defaults_current_level_key = "current_level"
    static let user_defaults_category_id_key = "category_id"
    static let user_defaults_budget_id_key = "budget_id"
    static let user_defaults_match_id_key = "match_id"
    static let user_defaults_tournment_id_key = "tournment_id"
    static let user_defaults_location_id_key = "location_id"
    static let user_defaults_remember_me_key = "remember_me"
    static let user_defaults_signed_in_key = "signedin"
    static let user_defaults_username_key = "username"
    static let user_defaults_password_key = "password"
    static let user_defaults_from_month_key = "fromMonth"
    static let user_defaults_to_month_key = "toMonth"
    static let user_defaults_from_year_key = "fromYear"
    static let user_defaults_to_year_key = "toYear"
    static let user_defaults_session_id_key = "session_id"
    
    static let user_defaults_city_id_key = "city"
    static let user_defaults_course_id_key = "course"
    static let user_defaults_user_id_key = "userId"
    static let user_defaults_role_id_key = "roleId"
    static let user_defaults_name_key = "name"
    static let user_defaults_isPurchased_key = "isPurchased"
     
    //Service calls values
    static let request_url = "https://api.parse.com/1/functions/function"
    static let moreAppsURL = "https://itunes.apple.com/us/artist/mahendra-babu/id470889593"
    static let appReviewURL =  "https://itunes.apple.com/us/app/rugby-scoreboard/id507755804?mt=8"

    static let x_parse_application_id_key = "X-Parse-Application-Id"
    static let x_parse_application_id_value = "3iSUed31jR3LPJwMSBy9rKZDCwo5nYz5i56QMy7s"
    
    static let x_parse_rest_api_key = "X-Parse-REST-API-Key"
    static let x_parse_rest_api_value = "PF90VEIV03MedSVp3SVz2Q75QO0SsUZWW2RC09WS"
    
    static let x_parse_client_key_value = "AxXgRnQRxorVr15m8RLCkLsDwztJMO7raAr9DDLD"



    static let request_content_type_key = "Content-Type"
    static let request_content_type_value = "application/json"
    
    static let request_content_length_key = "Content-Length"

    static let request_type_value = "POST"
    
    enum RequestAPIMethods : NSString{
        
        case getComments = "getComments"
        case registerDevice = "registerDevice"
        
    }
    enum CoreDataEntities : NSString{
        
        case Movies = "Movies"
        case ReviewOrComment = "ReviewOrComment"
        
    }
    enum BookmarkType : NSString{
        
        case Institute = "Institute"
        case Trainer = "Trainer"
        case Course = "Course"
        
    }

    
    enum SlideMenuItem : Int{
        
        case HOME = 0
        case INSTITUTES = 1
        case COURSES = 2
        case ACCOUNT = 3

    }
     

  
}

