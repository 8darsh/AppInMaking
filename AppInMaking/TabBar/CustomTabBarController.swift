//
//  CustomTabBarController.swift
//  TabBar
//
//  Created by Adarsh Singh on 26/08/23.
//

import UIKit

class CustomTabBarController: UITabBarController {

    @IBInspectable var initialIndex: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

       selectedIndex = initialIndex
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
