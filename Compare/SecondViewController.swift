//
//  SecondViewController.swift
//  Compare
//
//  Created by 加藤諒 on 2017/09/17.
//  Copyright © 2017年 mirai. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
  var myText:String!
  
  
  
  //appdelegateに書いた値を共有できるようにする
  var delegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
  
  
  let defaults = UserDefaults.standard
  
  //メモNo
  var memoNo = ""
  
  
  @IBOutlet weak var myTableViewMemo: UITableView!
 
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    myTableViewMemo.delegate = self
    
    myTableViewMemo.reloadData()
    
    print("かかか\(defaults)")
    
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

    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")! as UITableViewCell

    
    cell.textLabel!.text = ""
    
    return cell
  }

    //押された時の処理//データ受け渡し画面
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
     self.memoNo = String(indexPath.row)
    //selectedIndex = indexPath.row
    
    performSegue(withIdentifier: "next3", sender: nil)
  }
  
  //受け渡しメソッド
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if (segue.identifier == "next3") {
      let subVC: SecondViewController2_2 = (segue.destination as? SecondViewController2_2)!
      subVC.memoNo = self.memoNo
    }
  }
  
  
  @IBAction func back (_ segue:UIStoryboardSegue){}
  
  
  
}//class閉じ
