//
//  InputNoteViewController.swift
//  TabBar
//
//  Created by Adarsh Singh on 26/08/23.
//

import UIKit

class InputNoteViewController: UIViewController {

    

    @IBOutlet var txtField: UITextField!
    
    @IBOutlet var txtView: UITextView!
   
    var isUpdate = false
    var index = Int()
    
    var noteDetails: Notes?
    // it is an alternative for cellforROwAT
//    var note:Notes!{
//        didSet{
//            note.title = txtField.text
//            note.note = txtView.text
//        }
//    }
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Add Note"
        
        self.txtField.text = noteDetails?.title
        self.txtView.text = noteDetails?.note
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(btnSave))
        
     
    }
    

    
    
    
    @objc func btnSave() {
        editDataSaved()
        
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func editDataSaved(){
        var dic:([String:String]) = (["title": txtField.text!.capitalized,"note":txtView.text!])
        if isUpdate{
            
            DatabaseHelper.shareInstance.editdata(object: dic, i: index)
            isUpdate = false
        }else{
            
            DatabaseHelper.shareInstance.save(object: dic)
        }
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
