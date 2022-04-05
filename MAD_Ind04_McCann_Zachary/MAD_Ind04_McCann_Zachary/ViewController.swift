//
//  ViewController.swift
//  Ind03_McCann_Zachary
//
//  Created by zacharymccann on 3/22/22.
//

import UIKit

public var check: Int = 0

class ViewController: UIViewController, UITableViewDelegate {
    var appDelegate: AppDelegate?
    var webnickNames = NSArray()
    var webStates = NSArray()
    
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    var states = ["Alabama" , "Alaska" , "Arizona" , "Arkansas" , "California" , "Colorado" , "Connecticut" , "Delaware" , "Florida" , "Georgia" , "Hawaii" , "Idaho" , "Illinois" , "Indiana" , "Iowa" , "Kansas" , "Kentucky" , "Louisiana" , "Maine" , "Maryland" , "Massachusetts" , "Michigan" , "Minnesota" , "Mississippi" , "Missouri" , "Montana" , "Nebraska" , "Nevada" , "New Hampshire" , "New Jersey" , "New Mexico" , "New York" , "North Carolina" , "North Dakota" , "Ohio" , "Oklahoma" , "Oregon" , " Pennsylvania" , "Rhode Island" , "South Carolina" , "South Dakota" , "Tennessee" , "Texas" , "Utah" , "Vermont" , "Virginia" , "Washington" , "WestVirginia" , "Wisconsin" , "Wyoming"]
    
    let nicknames = ["Yellowhammer State" , "The Last Frontier" , "The Grand Canyon State" , "The Natural State" , "The Golden State" , "The Centennial State" , "The Constitution State", "The First State" , "The Sunshine State" ,  "The Peach State" , "The Aloha State" , "The Gem State" , "Praire State" , "The Hoosier State" , "The Hawkeye State" , "The Sunflower State" , "The Bluegrass State", "The Pelican State" , "The Pine Tree State" , "The Old Line State" , "The Bay State" , "The Great Lakes State" , "The North Star State" , "The Magnolia State" , "The Show Me State" , "The Treasure State" , "The Cornhusker State" , "The Silver State" , "The Granite State" , "The Garden State" , "The Land of Enchantment" , "The Empire State" , "The Tar Heel State" , "The Peace Garden State" , "The Buckeye State" , "The Sooner State" , "The Beaver State" , "The Keystone State" , "The Ocean State" , "The Palmetto State" , "Mount Rushmore State" , "The Volunteer State" , "The Lone Star State" , "The Beehive State" , "The Green Mountain State" , "The Old Dominion State" , "The Evergreen State" , "The Mountain State" , "The Badger State" , "The Cowboy State"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        webService()
        
        
        tableView.delegate = self
       tableView.dataSource = self
        
        
    }




    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        check = indexPath.row
        
    }
    

    



    
    
    func webService(){
        startActivity()
        let url =  NSURL(string: "https://webmail.cs.okstate.edu/~zmccann/states.php")
        
        let urlRequest = URLRequest(url: url as! URL)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with:  urlRequest, completionHandler: {data,response,error in
            self.stopActivity()
            guard error == nil else{
                return
            }
            guard let data = data else
            {
             return
            }
            do {
                let parseData = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                
                let dict = parseData as! NSDictionary
                
                self.webStates = dict.value(forKey: "$States") as! NSArray
                self.webnickNames = dict.value(forKey: "$Nicknames") as! NSArray
                
                
                print(parseData)
            }
            catch let error
            {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
    
    func reload(){
        if(self.webStates.count > 0){
            DispatchQueue.main.async(execute: { [unowned self] in
                self.tableView.reloadData()
            })
        }
    }
    
    func startActivity(){
        DispatchQueue.main.async(execute: { [unowned self] in
            self.activityView.isHidden = false
            self.activityView.startAnimating()
        })
    }
    
    func stopActivity(){
        DispatchQueue.main.async(execute: { [unowned self] in
            self.activityView.stopAnimating()
            self.activityView.isHidden = true
        })
    }
}
//Creats the table

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Ala", for: indexPath)
        
        
        
        cell.textLabel?.text = states[indexPath.row]
       cell.detailTextLabel?.text = nicknames[indexPath.row]
        
        return cell
    }
}


