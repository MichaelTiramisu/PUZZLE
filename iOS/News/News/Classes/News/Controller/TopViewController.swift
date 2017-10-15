//
//  TopViewController.swift
//  News
//
//  Created by Siyang Liu on 2017/10/14.
//  Copyright © 2017年 Siyang Liu. All rights reserved.
//

import UIKit

class TopViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var newzz = [News]()
    
    var topNewzz = [News]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        parseNews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let news = newzz[indexPath.row]
        
        let storyboard = UIStoryboard(name: "News", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "NewsDetailViewController") as! NewsDetailViewController
        
        vc.news = news
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return topNewzz.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "HeadlineCell"
        let news = topNewzz[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! HeadlineCell
        cell.titleLabel.text = news.title
        let url = "http://localhost:8080/news/html" + news.imageUrl
        cell.headlineImageView.image = try! UIImage(data: Data(contentsOf: URL(string: url)!))
        
        return cell
    }
    
    private func parseNews() {
        let manager = AFHTTPSessionManager()
        manager.get(NetworkUrl.getAllNews, parameters: nil, progress: nil, success: { (task, data) in
            print("Parse News Success")
            
            var newzz = [News]()
            var topNewzz = [News]()
            
            let newsArr = data as! [[String: Any]]
            for i in 0..<newsArr.count {
                let news = News()
                news.id = newsArr[i]["id"] as! Int
                news.typeID = newsArr[i]["typeId"] as! Int
                news.title = newsArr[i]["title"] as! String
                news.author = newsArr[i]["author"] as! String
                news.time = newsArr[i]["time"] as! Double
                news.content = newsArr[i]["content"] as! String
                news.imageUrl = newsArr[i]["imageUrl"] as! String
                
                newzz.append(news)
                
                if news.typeID == 1 {
                    topNewzz.append(news)
                }
            }
            
            self.newzz = newzz
            self.topNewzz = topNewzz
            
        }) { (task, eror) in
            print("Parse News Fail")
        }
        
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
