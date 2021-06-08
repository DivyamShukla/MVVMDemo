//
//  ViewController.swift
//  MVVMDemo
//
//  Created by Divyam on 08/06/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblComingSoon: UITableView!
    
    
    var comingSoonViewModel: ComingSoonViewModel!
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.comingSoonViewModel != nil && self.comingSoonViewModel.resultData != nil ? self.comingSoonViewModel.resultData.results.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
              
        let dict = self.comingSoonViewModel.resultData.results[indexPath.row]
        cell.name.text = dict.artistName
        cell.myTitle.text = dict.name
        
        let url = URL.init(string:dict.url)
        cell.myImage.sd_setImage(with: url , placeholderImage: UIImage(named: "default.png"))
        
        return cell
        
    }
    
    func callToViewModelForUIUpdate(){
            
            self.comingSoonViewModel =  ComingSoonViewModel()
            self.comingSoonViewModel.bindResultsViewModelToController = {
                
            DispatchQueue.main.async {
                           self.tblComingSoon.reloadData()
                       }
            }
        }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let nib = UINib.init(nibName: "CustomCell", bundle: nil)
        self.tblComingSoon.register(nib, forCellReuseIdentifier: "CustomCell")
        callToViewModelForUIUpdate()
    }


}

