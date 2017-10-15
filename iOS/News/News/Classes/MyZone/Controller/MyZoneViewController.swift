//
//  SettingsViewController.swift
//  Research
//
//  Created by Siyang Liu on 2017/8/8.
//  Copyright © 2017年 Siyang Liu. All rights reserved.
//

import UIKit

class MyZoneViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    @IBAction func logOutButtonClick(_ sender: UIBarButtonItem) {
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "username")
        userDefaults.removeObject(forKey: "password")
        userDefaults.removeObject(forKey: "firstname")
        userDefaults.removeObject(forKey: "lastname")
        userDefaults.synchronize()
        dismiss(animated: true)
    }
    
    // MARK: TableView Data Source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return 60.0
        }
        
        return 44.0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 && indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
            
            let userDefaults = UserDefaults.standard
            let email = userDefaults.string(forKey: "email") ?? ""
            let firstname = userDefaults.string(forKey: "firstname") ?? ""
            let lastname = userDefaults.string(forKey: "lastname") ?? ""
            
            cell.emailLabel.text = email
            cell.nameLabel.text = firstname + " " + lastname
            return cell
        }
        
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
