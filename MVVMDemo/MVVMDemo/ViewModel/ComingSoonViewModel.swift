//
//  ListViewModel.swift
//  MVVMDemo
//
//  Created by Divyam on 08/06/21.
//

import Foundation
class ComingSoonViewModel : NSObject{
 
    var ComingSoon = Array<Result>()
    var gen = Array<Genre>()
    
    
    private(set) var resultData : Results! {
            didSet {
                self.bindResultsViewModelToController()
            }
        }
    
    var bindResultsViewModelToController : (() -> ()) = {}
    
    override init() {
            super.init()
            callAPI()
        }

        func numberOfRowsInSection() -> Int {
            return ComingSoon.count
        }
    
    func callAPI(){
        
        HttpClient.shared().httpGet(url: "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/50/explicit.json") { (data, error) in
            
            do {
                // make sure this JSON is in the format we expect
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] {
                    
                    if let feeds = json["feed"] as? Dictionary<String, Any> {
                        print(feeds)
                    }
                }
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
                        
            }
        
    }
}
