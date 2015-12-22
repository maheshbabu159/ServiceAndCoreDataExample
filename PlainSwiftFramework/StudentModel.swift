//
//  StudeentModel.swift
//  PlainSwiftFramework
//
//  Created by maheshbabu.somineni on 12/22/15.
//  Copyright © 2015 maheshbabu.somineni. All rights reserved.
//
//
//  ModelManager.swift
//  DataBaseDemo
//
//  Created by Krupa-iMac on 05/08/14.
//  Copyright (c) 2014 TheAppGuruz. All rights reserved.
//

import UIKit

let sharedInstance = StudentModel()

class StudentModel: NSObject {
    
    var database: FMDatabase? = nil
    
    class func getInstance() -> StudentModel{
        if(sharedInstance.database == nil){
            sharedInstance.database = FMDatabase(path: GlobalSettings.getPath("Student.sqlite"))
        }
        return sharedInstance
    }
    
    func addStudentData(studentInfo: StudentInfo) -> Bool {
        sharedInstance.database!.open()
        let isInserted = sharedInstance.database!.executeUpdate("INSERT INTO student_info (Name, Marks) VALUES (?, ?)", withArgumentsInArray: [studentInfo.Name, studentInfo.Marks])
        sharedInstance.database!.close()
        return isInserted
    }
    
    func updateStudentData(studentInfo: StudentInfo) -> Bool {
        sharedInstance.database!.open()
        let isUpdated = sharedInstance.database!.executeUpdate("UPDATE student_info SET Name=?, Marks=? WHERE RollNo=?", withArgumentsInArray: [studentInfo.Name, studentInfo.Marks, studentInfo.RollNo])
        sharedInstance.database!.close()
        return isUpdated
    }
    
    func deleteStudentData(studentInfo: StudentInfo) -> Bool {
        sharedInstance.database!.open()
        let isDeleted = sharedInstance.database!.executeUpdate("DELETE FROM student_info WHERE RollNo=?", withArgumentsInArray: [studentInfo.RollNo])
        sharedInstance.database!.close()
        return isDeleted
    }
    
    func getAllStudentData() -> NSMutableArray {
        sharedInstance.database!.open()
        let resultSet: FMResultSet! = sharedInstance.database!.executeQuery("SELECT * FROM student_info", withArgumentsInArray: nil)
        let marrStudentInfo : NSMutableArray = NSMutableArray()
        if (resultSet != nil) {
            while resultSet.next() {
                let studentInfo : StudentInfo = StudentInfo()
                studentInfo.RollNo = resultSet.stringForColumn("RollNo")
                studentInfo.Name = resultSet.stringForColumn("Name")
                studentInfo.Marks = resultSet.stringForColumn("Marks")
                marrStudentInfo.addObject(studentInfo)
            }
        }
        sharedInstance.database!.close()
        return marrStudentInfo
    }
}
