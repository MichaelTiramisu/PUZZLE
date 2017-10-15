//
//  NewsDetailViewController.swift
//  News
//
//  Created by Siyang Liu on 2017/10/14.
//  Copyright © 2017年 Siyang Liu. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var news: News!
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = self.news.title
        
        let str = self.news.title as NSString
        
        let screenWidth = UIScreen.main.bounds.width
        let size = str.boundingRect(with: CGSize(width: screenWidth, height: CGFloat(Float.greatestFiniteMagnitude)), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 17)], context: nil).size
        
        label.frame.size = size
        
        return label
    }()
    
    lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = self.news.author
        
        let str = self.news.author as NSString
        
        let screenWidth = UIScreen.main.bounds.width
        let size = str.boundingRect(with: CGSize(width: screenWidth / 2, height: CGFloat(Float.greatestFiniteMagnitude)), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 17)], context: nil).size
        
        label.frame.size = size
        return label
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        
        let date = Date(timeIntervalSince1970: self.news.time)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let dateStr = formatter.string(for: date)
        
        
        label.text = dateStr
        
        let str = dateStr! as NSString
        
        let screenWidth = UIScreen.main.bounds.width
        let size = str.boundingRect(with: CGSize(width: screenWidth / 2, height: CGFloat(Float.greatestFiniteMagnitude)), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 17)], context: nil).size
        
        label.frame.size = size
        return label
    }()
    
    lazy var headlineImageView: UIImageView = {
        let url = "http://localhost:8080/news/html" + self.news.imageUrl
        let image = try! UIImage(data: Data(contentsOf: URL(string: url)!))
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFit
        
        let width = (image?.size.width)!
        let height = (image?.size.height)!
        let ratio = height / width
        
        let newWidth = UIScreen.main.bounds.width - 10
        let newHeight = newWidth * ratio
        
        imageView.frame = CGRect(x: 5, y: 5, width: newWidth, height: newHeight)
//        imageView.sizeToFit()
        
        return imageView
    }()
    
    lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = self.news.content
        
        let str = self.news.content as NSString
        
        let screenWidth = UIScreen.main.bounds.width
        let size = str.boundingRect(with: CGSize(width: screenWidth, height: CGFloat(Float.greatestFiniteMagnitude)), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 17)], context: nil).size
        
        label.frame.size = size
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }

    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let index = indexPath.row
        if index == 0 {
            return titleLabel.frame.height + 10
        } else if index == 1 {
            return authorLabel.frame.height + 10
        } else if index == 2 {
            return headlineImageView.bounds.height + 10
        } else if index == 3 {
            return contentLabel.frame.height + 10
        }
        return 20
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "ContentCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        let index = indexPath.row
        switch index {
        case 0:
            cell.addSubview(self.titleLabel)
            titleLabel.snp.makeConstraints({ (make) in
                make.top.equalTo(cell.snp.top).offset(5)
                make.left.equalTo(cell.snp.left).offset(10)
                make.right.equalTo(cell.snp.right).offset(-10)
            })
            
        case 1:
            cell.addSubview(self.authorLabel)
            cell.addSubview(self.timeLabel)
            authorLabel.snp.makeConstraints({ (make) in
                make.top.equalTo(cell.snp.top).offset(5)
                make.left.equalTo(cell.snp.left)
                make.right.equalTo(cell.snp.right).offset(0).dividedBy(2)
            })
            timeLabel.snp.makeConstraints({ (make) in
                make.top.equalTo(cell.snp.top).offset(5)
                make.left.equalTo(authorLabel.snp.right)
            })

        case 2:
            cell.addSubview(self.headlineImageView)
//            headlineImageView.bounds = CGRect(x: 0, y: 0, width: 500, height: 500)
//            headlineImageView.snp.makeConstraints({ (make) in
//                make.top.equalTo(cell.snp.top).offset(5)
//                make.left.equalTo(cell.snp.left).offset(5)
//                make.right.equalTo(cell.snp.right).offset(-5)
//            })
        case 3:
            cell.addSubview(self.contentLabel)
            contentLabel.snp.makeConstraints({ (make) in
                make.top.equalTo(cell.snp.top).offset(5)
                make.left.equalTo(cell.snp.left).offset(10)
                make.right.equalTo(cell.snp.right).offset(-10)
            })
            
        default:
            break
        }
        
        return UITableViewCell()
    }

}
