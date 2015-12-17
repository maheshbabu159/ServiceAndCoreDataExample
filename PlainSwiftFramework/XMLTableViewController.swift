//
//  XMLTableViewController.swift
//  PlainSwiftFramework
//
//  Created by maheshbabu.somineni on 12/16/15.
//  Copyright © 2015 maheshbabu.somineni. All rights reserved.
//

import UIKit

class XMLTableViewController: BaseViewController,NSXMLParserDelegate {

    @IBOutlet var tbData : UITableView?
    
    var parser:NSXMLParser!
    var posts = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    var title1 = NSMutableString()
    var date = NSMutableString()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "XML"
        super.showMenuButton()
        
        self.beginParsing()

    }
    func beginParsing(){
        
        let path = NSBundle.mainBundle().pathForResource("Books", ofType: "xml")
     
        if path != nil {
            parser = NSXMLParser(contentsOfURL: NSURL(fileURLWithPath: path!))
        } else {
            NSLog("Failed to find MyFile.xml")
        }
        
        self.parser.delegate = self
        self.parser.parse()
        
        self.tbData!.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //XMLParser Methods
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]){
        
        element = elementName
        if (elementName as NSString).isEqualToString("book"){
            
            elements = NSMutableDictionary()
            elements = [:]
            title1 = NSMutableString()
            title1 = ""
            date = NSMutableString()
            date = ""
        }
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?){
        
        if (elementName as NSString).isEqualToString("book") {
            if !title1.isEqual(nil) {
                elements.setObject(title1, forKey: "title")
            }
            if !date.isEqual(nil) {
                elements.setObject(date, forKey: "author")
            }
            
            posts.addObject(elements)
        }
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String){
        
        if element.isEqualToString("title") {
            
            title1.appendString(string)
            
        } else if element.isEqualToString("author") {
            
            date.appendString(string)
            
        }
    
    }
    
    //Tableview Methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return posts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        var cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell")!
        
        if(cell.isEqual(NSNull)) {
            cell = NSBundle.mainBundle().loadNibNamed("Cell", owner: self, options: nil)[0] as! UITableViewCell;
        }
        
        cell.textLabel?.text = posts.objectAtIndex(indexPath.row).valueForKey("title") as! NSString as String
        cell.detailTextLabel?.text = posts.objectAtIndex(indexPath.row).valueForKey("author") as! NSString as String
        
        return cell as UITableViewCell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
