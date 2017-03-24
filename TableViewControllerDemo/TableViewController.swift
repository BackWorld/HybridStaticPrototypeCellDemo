//
//  TableViewController.swift
//  TableViewControllerDemo
//
//  Created by zhuxuhong on 2017/3/24.
//  Copyright © 2017年 zhuxuhong. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    private var numberOfClasses = 3{
        didSet{
            //tableView.reloadData()
        }
    }
    
    private var phoneCell: UITableViewCell!{
        didSet{
            
        }
    }
    private var passwordCell: UITableViewCell!{
        didSet{
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func addNewClass(_ sender: Any) {
        numberOfClasses += 1 // = numberOfClasses < 5 ? numberOfClasses+1 : numberOfClasses
        
        let index = IndexPath(row: numberOfClasses-1, section: 1)
        tableView.insertRows(at: [index], with: .automatic)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0.00001 : 30
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 2 : numberOfClasses
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = section == 0 ? nil : UILabel()
        header?.text = "    选择教课班级"
        return header
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = indexPath.section
        let row = indexPath.row
        
        if section == 0 && row == 0{
            phoneCell = phoneCell ?? tableView.dequeueReusableCell(withIdentifier: "PhoneCell", for: indexPath)
            return phoneCell
        }
        else if section == 0 && row == 1{
            passwordCell = passwordCell ?? tableView.dequeueReusableCell(withIdentifier: "PasswordCell", for: indexPath)
            return passwordCell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolCell", for: indexPath)

        return cell
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
