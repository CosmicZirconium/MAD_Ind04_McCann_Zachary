//
//  ViewController2.swift
//  Ind03_McCann_Zachary
//
//  Created by zacharymccann on 3/22/22.
//

import UIKit


class ViewController2: UIViewController {
    var hype: Int = 0
    var appDelegate: AppDelegate?
    var webOutlines = NSArray()
    var webFlags = NSArray()
    var webMiles = NSArray()
    var webStates = NSArray()
    
    //This is mostly used for storing arrays and assigning them to the labels.
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
                
                self.webStates = dict.value(forKey: "States") as! NSArray
                self.webFlags = dict.value(forKey: "Flags") as! NSArray
                self.webMiles = dict.value(forKey: "Miles") as! NSArray
                self.webOutlines = dict.value(forKey: "Outlines") as! NSArray
                
                print(parseData)
            }
            catch let error
            {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
    
    
        
    

    
      // Check to see if we received any data.
      
          // Check to see if we received any data.
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet weak var miles: UILabel!
    @IBOutlet weak var stateName: UILabel!
    @IBOutlet weak var shape: UIImageView!
    @IBOutlet weak var Flag: UIImageView!
    
    
    
    
    let sqmile = ["50,744" , "571,951" ,"113,635", "52,068", "155,959", "103,718" , "4,845" , "1,954", "53,927" , "57,906" , "6,423" , "82,747" , "55,584" , "35,867" , "55,869" ,"81,815" , "39,728" , "43,562", "30,862", "9,774", "7,840", "56,804", "79,610" , "46,907" , "68,886" , "145,552", "76,872" , "109,826", "9,968" , "7,417" , "121,356", "47,214" , "48,711" , "68,976" , "40,948" , "68,667" , "95,997" , "44,817" , "1,045" , "30,109" , "75,885" , "41,217" , "261,797" , "82,144" , "9,250", "39,594" , "66,544" , "24,078" , "54,310" , "97,100"]
    
    let states = ["Alabama" , "Alaska" , "Arizona" , "Arkansas" , "California" , "Colorado" , "Connecticut" , "Delaware" , "Florida" , "Georgia" , "Hawaii" , "Idaho" , "Illinois" , "Indiana" , "Iowa" , "Kansas" , "Kentucky" , "Louisiana" , "Maine" , "Maryland" , "Massachusetts" , "Michigan" , "Minnesota" , "Mississippi" , "Missouri" , "Montana" , "Nebraska" , "Nevada" , "New Hampshire" , "New Jersey" , "New Mexico" , "New York" , "North Carolina" , "North Dakota" , "Ohio" , "Oklahoma" , "Oregon" , " Pennsylvania" , "Rhode Island" , "South Carolina" , "South Dakota" , "Tennessee" , "Texas" , "Utah" , "Vermont" , "Virginia" , "Washington" , "WestVirginia" , "Wisconsin" , "Wyoming"]
    
    
    let maps = [#imageLiteral(resourceName: "Alabama.jpg") , #imageLiteral(resourceName: "Alaska.jpg"), #imageLiteral(resourceName: "Arizona.jpg") ,  #imageLiteral(resourceName: "Arkansas.jpg") , #imageLiteral(resourceName: "California.jpg") , #imageLiteral(resourceName: "Colorado.jpg") , #imageLiteral(resourceName: "connecticut.jpg") , #imageLiteral(resourceName: "Delaware.jpg") , #imageLiteral(resourceName: "Florida.jpg") , #imageLiteral(resourceName: "Georgia.jpg") , #imageLiteral(resourceName: "Hawaii.jpg") , #imageLiteral(resourceName: "Idaho.jpg"), #imageLiteral(resourceName: "IL.jpg") , #imageLiteral(resourceName: "Indiana.jpg") , #imageLiteral(resourceName: "Iowa.jpg") , #imageLiteral(resourceName: "Kansas.jpg") , #imageLiteral(resourceName: "Kentucky.jpg") , #imageLiteral(resourceName: "Louisiana.jpg") , #imageLiteral(resourceName: "Maine.jpg") , #imageLiteral(resourceName: "Maryland.jpg") , #imageLiteral(resourceName: "Mass.jpg") , #imageLiteral(resourceName: "Michigan.jpg") , #imageLiteral(resourceName: "Minnesota.jpg") , #imageLiteral(resourceName: "Miss.jpg") , #imageLiteral(resourceName: "Missouri.jpg") , #imageLiteral(resourceName: "Montana.jpg") , #imageLiteral(resourceName: "NC.jpg") , #imageLiteral(resourceName: "ND.jpg") , #imageLiteral(resourceName: "Nebraska.jpg") , #imageLiteral(resourceName: "Nevada.jpg") , #imageLiteral(resourceName: "NewHamp.jpg") , #imageLiteral(resourceName: "NewJersey.jpg") , #imageLiteral(resourceName: "NewMexico.jpg"), #imageLiteral(resourceName: "Newyork.jpg"), #imageLiteral(resourceName: "Ohio.jpg") , #imageLiteral(resourceName: "OKL.jpg") , #imageLiteral(resourceName: "Oregon.jpg") , #imageLiteral(resourceName: "Penn.jpg") , #imageLiteral(resourceName: "Rhode.jpg") , #imageLiteral(resourceName: "SC.jpg") , #imageLiteral(resourceName: "SD.jpg") , #imageLiteral(resourceName: "Tennessee.jpg") , #imageLiteral(resourceName: "Texas.jpg") , #imageLiteral(resourceName: "Utah.jpg") , #imageLiteral(resourceName: "Vermont.jpg") , #imageLiteral(resourceName: "Virginia.jpg") , #imageLiteral(resourceName: "Washington.jpg"), #imageLiteral(resourceName: "WestVirginia.jpg"), #imageLiteral(resourceName: "Wisconsin.jpg"), #imageLiteral(resourceName: "Wyoming.jpg")]

    let flags = [ #imageLiteral(resourceName: "1024px-Flag_of_Alabama.svg_-360x240.png") , #imageLiteral(resourceName: "nunst003-360x240") ,  #imageLiteral(resourceName: "nunst004-360x240") , #imageLiteral(resourceName: "nunst005r-360x240 2") , #imageLiteral(resourceName: "nunst0006-360x240") ,  #imageLiteral(resourceName: "colorado-flag-360x240-1") , #imageLiteral(resourceName: "Connecticut-state-flag-360x278") , #imageLiteral(resourceName: "de-largeflag-360x240") , #imageLiteral(resourceName: "nunst012-360x240")   , #imageLiteral(resourceName: "nunst090")  ,  #imageLiteral(resourceName: "Hawaii-1") ,   #imageLiteral(resourceName: "Idaho-1") ,  #imageLiteral(resourceName: "illnois-1")  ,   #imageLiteral(resourceName: "nunst021")  ,  #imageLiteral(resourceName: "flagofIowa-360x240-1")  , #imageLiteral(resourceName: "800px-Flag_of_Kansas-360x216"),   #imageLiteral(resourceName: "LouisianaStateFlagRGBLarge-1-360x233")  ,  #imageLiteral(resourceName: "nunst030")  ,  #imageLiteral(resourceName: "nunst032-360x240")  ,  #imageLiteral(resourceName: "nunst033-360x216")   ,  #imageLiteral(resourceName: "nunst035-360x240")  ,   #imageLiteral(resourceName: "nunst037-360x232")  ,   #imageLiteral(resourceName: "missed")  , #imageLiteral(resourceName: "Missouri-state-flag-flat-360x216")  ,  #imageLiteral(resourceName: "nunst042-360x240")  , #imageLiteral(resourceName: "nunst044-360x216"), #imageLiteral(resourceName: "nunst046-360x240-1"), #imageLiteral(resourceName: "hamp") , #imageLiteral(resourceName: "state-flag-new-jersey_800-360x240"), #imageLiteral(resourceName: "nunst052-360x240"), #imageLiteral(resourceName: "nunst053-360x180"), #imageLiteral(resourceName: "nunst055"), #imageLiteral(resourceName: "nunst056"), #imageLiteral(resourceName: "ohio-flag-large-360x221-1"), #imageLiteral(resourceName: "nunst059-360x240"), #imageLiteral(resourceName: "nunst061-360x216"), #imageLiteral(resourceName: "nunst063"), #imageLiteral(resourceName: "road"), #imageLiteral(resourceName: "nunst066-360x240"), #imageLiteral(resourceName: "nunst067-360x216"), #imageLiteral(resourceName: "nunst069-360x216"), #imageLiteral(resourceName: "texas-1"), #imageLiteral(resourceName: "utah-1"),  #imageLiteral(resourceName: "nunst073-360x216")  ,   #imageLiteral(resourceName: "nunst075-360x232") , #imageLiteral(resourceName: "nunst077-360x240")  ,   #imageLiteral(resourceName: "nunst080") ,  #imageLiteral(resourceName: "nunst081-360x240"),  #imageLiteral(resourceName: "nunst083-360x252")  ]
    

    
    

    
    
   
    
    override func viewDidLoad() {
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        
        spinner.startAnimating()
        
        
        
        
        super.viewDidLoad()
        self.stateName.text = states[check]
        self.miles.text = sqmile[check]
        self.shape.image = maps[check]
        self.Flag.image = flags[check]
    }
    

    
    
    func startActivity(){
        DispatchQueue.main.async(execute: { [unowned self] in
            self.spinner.isHidden = false
            self.spinner.startAnimating()
        })
    }
    
    func stopActivity(){
        DispatchQueue.main.async(execute: { [unowned self] in
            self.spinner.stopAnimating()
            self.spinner.isHidden = true
        })
    }

}

