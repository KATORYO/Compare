//
//  ViewController1_3.swift
//  Compare
//
//  Created by 加藤諒 on 2017/09/17.
//  Copyright © 2017年 mirai. All rights reserved.
//

import UIKit

class ViewController1_3: UIViewController,UITableViewDelegate,UITableViewDataSource {

  //@IBAction func myBack1_3(_ sender: UIBarButtonItem) {}
  // Sectionで使用する配列を定義する.
  private let mySections: NSArray = ["iPhone", "Android"]
  
  
  @IBOutlet weak var myNavigation1_3: UINavigationBar!

  @IBOutlet weak var myTableView1_3: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
  

      self.myTableView1_3.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  

  func numberOfSections(in tableView: UITableView) -> Int {
    return mySections.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
    
    cell.nameLabel.text = "aaaaa"
    
    return cell
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
