//
//  NetworkDelegate.swift
//  CyberMoney
//
//  Created by Teja Bethina on 10/7/15.
//  Copyright © 2015 SenecaGlobal. All rights reserved.
//

import Foundation

//@objc
protocol CMNetworkDelegate{
    
    func dataDelegate(dataVal:AnyObject, sourceType:GlobalVariables.RequestAPIMethods)
    func networkError(errorStr:String)
}