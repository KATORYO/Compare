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
  
    //var dicC:NSDictionary = [:]
  
    var array:NSArray = []
    //var dicB:NSDictionary = data as! NSDictionary
  
    //選択されたエリア名を保存するプロパティ
    var scSelectedName = ""
  
    //前の画面から送られてきた行番号
    var scSelectedIndex = -1
  
    var Image:UIImage = UIImage()
  
    @IBOutlet weak var myCollectionView1_2: UICollectionView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

      print(scSelectedIndex)
      
    myCollectionView1_2.delegate = self
    myCollectionView1_2.dataSource = self
      
      
    //プロパティリスト読み込み
    //ファイルパスを取得（エリア名が格納されているプロパティリスト）
    let filePath = Bundle.main.path(forResource: "Detail", ofType: "plist")
      
    let filePathFood = Bundle.main.path(forResource: "Fastfood", ofType: "plist")
      
    let filePathConvinience = Bundle.main.path(forResource:"Convenience", ofType:"plist")
      
    let filePathShopAndGallery = Bundle.main.path(forResource: "ShopAndGallery", ofType: "plist")
      
    //ファイルの内容を読み込んでarray型に格納
      switch scSelectedIndex {
      case 0:
        array = NSArray(contentsOfFile: (filePath)!)!
      case 1:
        array = NSArray(contentsOfFile:filePathFood!)!
      case 2:
        array = NSArray(contentsOfFile:filePathConvinience!)!
      case 3:
        array = NSArray(contentsOfFile:filePathShopAndGallery!)!
      default: break
      }
    //array = NSArray(contentsOfFile: filePath!)!
    //array = NSArray(contentsOfFile:filePathFood!)!
      
//    //let dic_classs = dic?[scSelectedName] as! NSDictionary
//
//      //データがゲットできている↓
//    print(dic_classs["description"]!)
//
//    for(key,data) in dic!{
//    dicB = data as! NSDictionary
//      if ((key as! NSString) as String == scSelectedName) {
//        navigationItem.title = scSelectedName
//        
//      }
//    }
  }
  
    /*
     Cellが押された時
    */
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    //セグエを指定して、画面遷移 アイデンティファイヤーの通路！
    performSegue(withIdentifier: "next2", sender: nil)
    
    print("Num:\(indexPath.row)")
    print("Value:\(collectionView)")
    print("arrayの数は\(array.count)")
    
  }
  
  
    /*
      表示するセルの数！
    */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return array.count
      
    }
  
    /*
     Cellに値を設定する
    */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell:CustomCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1_2", for: indexPath) as! CustomCell
      
      //取り出す時は型の宣言しなければならない！ as!NS~~
      dicB = array[indexPath.row] as! NSDictionary
      //dicC = array[indexPath.row] as!NSDictionary
      
      //print(dicC["description"] as! String)
      print(dicB["image"] as! String)

      
      cell.myLabel1_2.text? = dicB["description"] as! String
      cell.myImage1_2.image = UIImage(named: dicB["image"] as! String)

//      //表示今 料金比較のセルの画面を表示する１　２　３
//      switch indexPath.row {
//      case 0:
//        cell.myLabel1_2.text? = dicB["description"] as! String
//        cell.myImage1_2.image = UIImage(named: dicB["image"] as! String)
//     case 1:
//        cell.myLabel1_2.text? = dicB["description"] as! String
//        cell.myImage1_2.image = UIImage(named: dicB["image"] as! String)
//      default:break
//      }

    return cell
  }
  // セクションの数（今回は1つ）
  func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
  }
  
  @IBAction func back1_2 (_ segue:UIStoryboardSegue){}
  

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
