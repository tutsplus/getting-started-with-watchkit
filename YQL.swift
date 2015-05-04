// Helper class to retrieve public weather data from Yahoo! Weather Service using YQL.

// https://github.com/supertommy/yahoo-weather-ios-watchkit-swift/blob/master/weather/YQL.swift

import Foundation

public class YQL
{
    private class var prefix: String {
        return "http://query.yahooapis.com/v1/public/yql?q="
    }
    
    private class var suffix: String {
        return "&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys&callback=";
    }
    
    public class func query(statement: String) -> NSDictionary
    {
        let query = "\(prefix)\(statement.stringByAddingPercentEscapesUsingEncoding(NSASCIIStringEncoding)!)\(suffix)"
        
        let jsonData = String(contentsOfURL: NSURL(string: query)!, encoding: NSUTF8StringEncoding, error: nil)?.dataUsingEncoding(NSUTF8StringEncoding)
        
        var result = { _ -> NSDictionary in
            if let data = jsonData
            {
                var error: NSError?
                
                return NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &error) as! NSDictionary
            }
            
            return NSDictionary()
            }()
        
        return result;
    }
}