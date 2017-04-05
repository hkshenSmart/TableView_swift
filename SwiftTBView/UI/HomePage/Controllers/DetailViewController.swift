//
//  DetailViewController.swift
//  SwiftTBView
//
//  Created by kun shen on 2017/3/21.
//  Copyright © 2017年 kun shen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var showImageView: UIImageView?
    @IBOutlet var showNameLabel: UILabel?
    
    var nameStr: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.showImageView!.image = UIImage(named: "ball-Image")
        self.showNameLabel?.text = nameStr
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
