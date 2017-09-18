//
//  ViewController1-2.swift
//  Compare
//
//  Created by 加藤諒 on 2017/09/17.
//  Copyright © 2017年 mirai. All rights reserved.
//

import UIKit

class ViewController1_2: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
  
    var dicB:NSDictionary = [:]
  
    //選択されたエリア名を保存するプロパティ
    var scSelectedName = ""
  
    @IBOutlet weak var myCollectionView1_2: UICollectionView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

    myCollectionView1_2.delegate = self
    myCollectionView1_2.dataSource = self
    self.view.addSubview(myCollectionView1_2)
      
      
    //プロパティリスト読み込み
    //ファイルパスを取得（エリア名が格納されているプロパティリスト）
    let filePath = Bundle.main.path(forResource: "Detail", ofType: "plist")
      
    //ファイルの内容を読み込んでディクショナリー型に格納
    let dic = NSDictionary(contentsOfFile: filePath!)
      
    let dic_class = dic?[scSelectedName] as!NSDictionary

    print(dic_class["description"]!)
      
      
    for(key,data) in dic!{
    dicB = data as! NSDictionary
      if ((key as! NSString) as String == scSelectedName) {
        navigationItem.title = scSelectedName
    
      }
    }
  }
  
    /*
     Cellが押された時
    */
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    //セグエを指定して、画面遷移 アイデンティファイヤーの通路！
    performSegue(withIdentifier: "next2", sender: nil)
    
    print("Num: \(indexPath.row)")
    print("Value:\(collectionView)")
    
  }
  
    /*
      表示するセルの数！
    */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 3
    }
  
    /*
     Cellに値を設定する
    */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell:CustomCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1_2", for: indexPath) as! CustomCell
    
      
      cell.myLabel1_2.text? = dicB["description"] as! String
      cell.myImage1_2.image? = UIImage(named:dicB["image"] as!String)!
    //cell.lblSample?.text = list[indexPath.row]
    //cell.imgSample?.image = UIImage(named: imageDesu[indexPath.row])
    return cell
  }
  // セクションの数（今回は1つ）
  func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
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
