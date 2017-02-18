//
//  ViewController.swift
//  CustomTableMarket
//
//  Created by Сергей Чертков on 18.02.17.
//  Copyright © 2017 Сергей Чертков. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
class Catalog: SafeJsonObject {
    var name: String?
    var image: String?
    var summary: String?
    var price: String?
    var title: String?
}
    
class SafeJsonObject: NSObject {
    override func setValue(_ value: Any?, forKey key: String) {
        let selectorString = "set\(key.uppercased().characters.first!)\(String(key.characters.dropFirst())):"
        let selector = Selector(selectorString)
        if responds(to: selector) {
            super.setValue(value, forKey: key)
        }
    }
}
    
    var catalogs = [Catalog]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.path(forResource: "catalog3", ofType: "json") {
            
            do {
                
                let data = try(NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe))
                
                let jsonDictionary = try(JSONSerialization.jsonObject(with: data as Data, options: .mutableContainers)) as! [String:AnyObject]
                
                if let catalogArray = jsonDictionary["catalog"] as? [[String: AnyObject]] {
                    
                    self.catalogs = [Catalog]()
                    
                    for catalogDictionary in catalogArray {
                        
                        let catalog = Catalog()
                        catalog.setValuesForKeys(catalogDictionary)
                        self.catalogs.append(catalog)
                        
                        OperationQueue.main.addOperation {
                            self.tableView.reloadData()
                        }
                    }
                    
                    print(catalogs[5].name!)
                    
                }
                
            } catch let err {
                print(err)
            }
            
        }
        
        navigationItem.title = "Catalog"
        
        tableView?.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catalogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        cell.imgView.image = UIImage(named: catalogs[indexPath.item].image!)
        cell.nameLabel.text = catalogs[indexPath.item].name
        cell.priceLabel.text = catalogs[indexPath.item].price
        cell.smallDescriptionLabel.text = catalogs[indexPath.item].title
        
        return cell
    }
}

