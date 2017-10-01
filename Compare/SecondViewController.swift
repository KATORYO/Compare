//
//  SecondViewController.swift
//  Compare
//
//  Created by 加藤諒 on 2017/09/17.
//  Copyright © 2017年 mirai. All rights reserved.
//

import UIKit
class SecondViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

  @IBOutlet weak var myTableViewMemo: UITableView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }


override func didReceiveMemoryWarning() {
  super.didReceiveMemoryWarning()
  // Dispose of any resources that can be recreated.
}

  
  //セクションの数
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  //表示するセルの数
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  //cellに表示させる　値を決める
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    performSegue(withIdentifier: "next3", sender: nil)
  }
  
  
  @IBAction func back (_ segue:UIStoryboardSegue){}
  
  
  
}//class閉じ
