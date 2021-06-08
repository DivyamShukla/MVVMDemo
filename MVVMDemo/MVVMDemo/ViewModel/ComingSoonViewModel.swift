//
//  ListViewModel.swift
//  MVVMDemo
//
//  Created by Divyam on 08/06/21.
//

import Foundation
class ComingSoonViewModel : NSObject{
 
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

    
    func callAPI(){
        
        HttpClient.shared().httpGet(url: "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/50/explicit.json") { (data, error) in
            
            do {
                // make sure this JSON is in the format we expect
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] {
                    
                    if let feeds = json["feed"] as? Dictionary<String, Any> {
                        if let results = feeds["results"] as? Array<[String:Any]>{
                            var comingSoon = [Result]()
                            for result in results{
                                
                                var genres = [Genre]()
                                
                                if let genre = result["genres"] as? Array<[String: String]>{
                                    for gen in genre{
                                        let name = gen["name"]
                                        let url = gen["url"]
                                        genres.append(Genre(name: name ?? "", image_url: url ?? ""))
                                        
                                    }
                                }
                                
                                let artistName = result["artistName"] as? String
                                let imageUrl = result["artworkUrl100"] as? String
                                let resultName = result["name"] as? String
                                comingSoon.append(Result(name: artistName ?? ""  , title: resultName ?? "" , image_url: imageUrl ?? "", genre: genres))   
                            }
                            self.resultData = Results(resultArray: comingSoon)
                        }
                    }
                }
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
                        
            }
        
    }
}
