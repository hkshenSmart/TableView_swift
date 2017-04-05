//
//  ShowHomeViewController.swift
//  SwiftTBView
//
//  Created by kun shen on 2017/3/21.
//  Copyright © 2017年 kun shen. All rights reserved.
//

import UIKit

//@objc(ShowHomeViewController)
class ShowHomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ShowHomeTableViewCellDelegate {
    
    @IBOutlet var showHomeTBView: UITableView?
    
    var itemsArray: NSMutableArray?
    var selectedIndexPath: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "首页"
        
        loadData()
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
    
    // MARK: - Load data
    
    func loadData() {
        
        itemsArray = ["a", "b", "c", "d"]
    }
    
    // MARK: - UITableViewDataSource UITableViewDelegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.itemsArray!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var showHomeTableViewCell: ShowHomeTableViewCell!
        showHomeTableViewCell = self.showHomeTBView!.dequeueReusableCell(withIdentifier: "ShowHomeTableViewCellIdentifier", for: indexPath) as? ShowHomeTableViewCell
        showHomeTableViewCell!.showImageView!.image = UIImage(named: "ball-Image")
        showHomeTableViewCell?.showNameLabel?.text = self.itemsArray![indexPath.row] as? String
        showHomeTableViewCell.delegate = self
        
        return showHomeTableViewCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 160
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selectedIndexPath = indexPath
        
        //self.performSegue(withIdentifier: "gotoDetailViewController", sender: self)
        
        self.showHomeTBView?.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - TableViewCell delegate
    
    func doSelect(_ sender: Any) {
        
        /*
        UIView *view = [button superview];
        GameForPlaceTableViewCell *gameForPlaceTableViewCell = (GameForPlaceTableViewCell *)[view superview];
        NSIndexPath *indexPath = [self.gameForPlaceTBView indexPathForCell:gameForPlaceTableViewCell];
        self.selectedIndexPath = indexPath;
        */
        
        let view = (sender as! UIButton).superview
        let showHomeTableViewCell = view!.superview as! ShowHomeTableViewCell
        let indexPath = self.showHomeTBView!.indexPath(for: showHomeTableViewCell)
        self.selectedIndexPath = indexPath
        
        self.performSegue(withIdentifier: "gotoDetailViewController", sender: self)
    }
    
    // MARK: - Transmit data
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let detailVC = segue.destination as! DetailViewController
        if segue.identifier == "gotoDetailViewController" {
            detailVC.nameStr = self.itemsArray![self.selectedIndexPath!.row] as? String
        }
    }
}
