//
//  MyTableViewController.swift
//  testDeinit
//
//  Created by 郁洋 on 2018/10/8.
//  Copyright © 2018年 郁洋. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {

   
    
    var mode: [String] = {
        return ["no.1", "no.2", "no.3", "no.4", "no.5", "no.6", "no.7", "no.8"]
    }()
    var heights = [CGFloat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "MINE"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        
        tableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "reuseIdentifier")
        tableView.separatorStyle = .none
    }
    
    @objc private func add() {
        
        mode.insert("new number", at: 1)
        
        tableView.beginUpdates()
        let idx1 = IndexPath(row: 1, section: 0)

        tableView.insertRows(at: [idx1], with: .bottom)
        tableView.endUpdates()
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return mode.count
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if heights.count > indexPath.row {
            let height = heights[indexPath.row]
            return height
        }
        
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! MyTableViewCell

        cell.title.text = mode[indexPath.row]
        // Configure the cell...
        
        let height = cell.systemLayoutSizeFitting(CGSize(width: tableView.frame.size.width, height: 0), withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel).height
        heights.replaceSubrange(Range(indexPath.row..<indexPath.row), with: [height])
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        print(indexPath)
        let r = Range(indexPath.row..<indexPath.row+1)
        mode.replaceSubrange(r, with: ["#warning Incomplete implementation, return the number of rows"])
        tableView.reloadRows(at: [indexPath], with: .automatic)
        
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
