//
//  NoteViewController.swift
//  TabBar
//
//  Created by Adarsh Singh on 26/08/23.
//

import UIKit
import CoreData

class NoteViewController: UITableViewController,UISearchBarDelegate,UISearchControllerDelegate, UISearchResultsUpdating {
    
    @IBOutlet var addbtnOut: UIButton!
    var search = UISearchController(searchResultsController: nil)

    var note = [Notes]()
    
    
    
    
    //View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBtn))
        
        searchSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.note = DatabaseHelper.shareInstance.getData()
        self.tableView.reloadData()
    }
    
    //Search Helper Func
    func arr(){
        note = DatabaseHelper.shareInstance.getData()
    }

    
    func searchSetup(){
        search.searchResultsUpdater = self
        search.searchBar.delegate = self
        navigationItem.searchController = search
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {return}
        if searchText == ""{
            arr()
        }else{
            arr()
            note = note.filter{
                ($0.title?.contains(searchText))!
            }
            
            
        }
        tableView.reloadData()
    }

    
    
//Table View
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return note.count 
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = note[indexPath.row].title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailVc") as! DetailViewController
        
        vc.notedetail = note[indexPath.row]
        vc.indexRow = indexPath.row
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            note = DatabaseHelper.shareInstance.deleteData(index: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    
    @objc func addBtn() {
        let vc = self.storyboard?.instantiateViewController(identifier: "InputNoteVc") as! InputNoteViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }


    
    
    
    
}

