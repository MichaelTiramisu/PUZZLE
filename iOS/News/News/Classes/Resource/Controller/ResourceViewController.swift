//
//  SurveyViewController.swift
//  Fostering
//
//  Created by Siyang Liu on 2017/8/31.
//  Copyright © 2017年 Siyang Liu. All rights reserved.
//

import UIKit

class ResourceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var users = [User]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        parseUsers()
    }
    
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let email = users[indexPath.row].email
        let userDefault = UserDefaults.standard
        userDefault.set(email!, forKey: "sendEmail")
        userDefault.synchronize()
        
        self.tabBarController?.selectedIndex = 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "UserCell"
        let user = users[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! UserCell
        cell.nameLabel.text = user.name
        cell.emailLabel.text = user.email
        
        return cell
    }
    
    private func parseUsers() {
        let manager = AFHTTPSessionManager()
        manager.get(NetworkUrl.getUsers, parameters: nil, progress: nil, success: { (task, data) in
            print("Parse News Success")
            
            var users = [User]()
            
            let newsArr = data as! [[String: String]]
            for i in 0..<newsArr.count {
                let user = User()
                user.name = newsArr[i]["displayName"]
                user.email = newsArr[i]["mail"]
                users.append(user)
            }
            
            self.users = users
            
        }) { (task, eror) in
            print("Parse News Fail")
        }
        
    }

}
