//
//  ViewController.swift
//  TabBar
//
//  Created by Adarsh Singh on 26/08/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var qtTxt: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchInfo()
    }
    
    func fetchInfo(){
        guard let path = Bundle.main.path(forResource: "quotes", ofType: "json") else {return}
        
        let url = URL(filePath: path)
        
        do{
            let data = try! Data(contentsOf: url)
            let json = try! JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            guard let array = json as? [String] else {return}
            qtTxt.text = array.randomElement()
        }
        
        
                
    }


}

