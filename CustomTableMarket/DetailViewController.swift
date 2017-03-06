//
//  DetailViewController.swift
//  CustomTableMarket
//
//  Created by Сергей Чертков on 19.02.17.
//  Copyright © 2017 Сергей Чертков. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    required init?(coder aDecoder: NSCoder) {
        id = 0
        setName = ""
        setFullDescription = ""
        setPrice = ""
        setImage = ""
        
        super.init(coder: aDecoder)
    }
    
    @IBOutlet weak var idDetail: UILabel!
    
    @IBOutlet weak var nameDetail: UILabel!
    
    @IBOutlet weak var imgDetail: UIImageView!
    
    @IBOutlet weak var fullDescriptionDetail: UILabel!
    
    @IBOutlet weak var priceDetail: UILabel!
    
    var id: Int
    var setName: String
    var setFullDescription: Any
    var setPrice: String
    var setImage: String
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        idDetail.text = "\(id)"
        nameDetail.text = "\(setName)"
        fullDescriptionDetail.text = "\(setFullDescription)"
        priceDetail.text = "\(setPrice)"
        imgDetail.image = UIImage(named: setImage)
        
        let buyButton = UIBarButtonItem(title: "Buy", style: .done, target: self, action: #selector(DetailViewController.doIt))
        self.navigationItem.rightBarButtonItem = buyButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pressedBuy(sender: AnyObject) {
        doIt()
    }
    
    func doIt() {
        
//        print(id)
//        print(setName)
//        print(setFullDescription)
//        print(setPrice)
        navigationController?.popViewController(animated: true)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
