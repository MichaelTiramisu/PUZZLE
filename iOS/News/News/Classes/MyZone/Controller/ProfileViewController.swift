//
//  ProfileViewController.swift
//  Research
//
//  Created by Siyang Liu on 2017/8/15.
//  Copyright © 2017年 Siyang Liu. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: TableView Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        print(#function)
//        print(indexPath.section)
//        print(indexPath.row)
        
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "HeadImageCell", for: indexPath) as! HeadImageCell
                return cell
                
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! DetailCell
                cell.descriptionLabel.text = "Firstname"
                
                let userDefaults = UserDefaults.standard
                let firstname = userDefaults.string(forKey: "firstname") ?? ""
                cell.valueTextField.text = firstname
                
                return cell
                
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! DetailCell
                cell.descriptionLabel?.text = "Lastname"
                
                let userDefaults = UserDefaults.standard
                let lastname = userDefaults.string(forKey: "lastname") ?? ""
                cell.valueTextField.text = lastname
                
                return cell
                
            default:
                break
            }
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return 60.0
        }
        
        return 44.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    @IBAction func cancelButtonClick(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonClick(_ sender: UIBarButtonItem) {
        var cell = tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as! DetailCell
        let firstname = cell.valueTextField.text
        
        cell = tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as! DetailCell
        let lastname = cell.valueTextField.text
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(firstname, forKey: "firstname")
        userDefaults.set(lastname, forKey: "lastname")
        userDefaults.synchronize()
        
        
        navigationController?.popViewController(animated: true)
    }
    
}
