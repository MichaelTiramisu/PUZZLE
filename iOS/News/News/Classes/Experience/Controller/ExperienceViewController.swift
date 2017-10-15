//
//  ExperienceViewController.swift
//  News
//
//  Created by Siyang Liu on 2017/10/15.
//  Copyright © 2017年 Siyang Liu. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ExperienceViewController: UIViewController {
    
    weak var playerLayer1: AVPlayerLayer!
    let playerVC1 = AVPlayerViewController()
    
    weak var playerLayer2: AVPlayerLayer!
    let playerVC2 = AVPlayerViewController()
    
//    var url: String! {
//        didSet {
//            let url = URL(string: self.url)
//            playerVC1.player = AVPlayer(url: url!)
//        }
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let url1 = Bundle.main.url(forResource: "Career Advice on becoming a Broadcaster  Journalist by Gabby Logan", withExtension: nil)
        playerVC1.player = AVPlayer(url: url1!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func image1ButtonClick(_ sender: Any) {
        
    }
    
    @IBAction func image2ButtonClick(_ sender: Any) {
    }
}
