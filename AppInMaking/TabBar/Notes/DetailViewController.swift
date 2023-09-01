//
//  DetailViewController.swift
//  TabBar
//
//  Created by Adarsh Singh on 26/08/23.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var lblTxt: UILabel!
    
    @IBOutlet var txtViewDetail: UITextView!
    var notedetail: Notes?
    var indexRow = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = notedetail?.title
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editNote))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.lblTxt.text = notedetail?.title?.capitalized
        self.txtViewDetail.text = notedetail?.note
    }
    
    @objc func editNote(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "InputNoteVc") as! InputNoteViewController
        vc.isUpdate = true
        vc.noteDetails = notedetail
        vc.index = indexRow
        
        navigationController?.pushViewController(vc, animated: true)
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
