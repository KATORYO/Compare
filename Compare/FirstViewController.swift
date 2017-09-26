//
//  FirstViewController.swift
//  Compare
//
//  Created by 加藤諒 on 2017/09/17.
//  Copyright © 2017年 mirai. All rights reserved.
//

import UIKit



class FirstViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
  let list:[String] = ["コーヒー","ファストフード","コンビニ","雑貨","生活費","レストラン","大きな買い物","電化製品","住宅","工事費"]
  
  let imageDesu:[String] = ["Image-1","BurgerKing.Image","Image-6","Image-11","Image-9","Image","Image-10","Image-2","Image-3","Image-12"]
  
  var myImage:UIImage = UIImage()
  
  
  //紹介したいエリア名が格納される配列
  var placeList:[String] = []
  
  //選択された行の表示エリア名
  var selectedName = ""
  
  var selectedIndex = -1 //選択された行番号！
		

  @IBOutlet weak var myCollectionView: UICollectionView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    //ファイルパスを取得(エリア名が格納されているプロパティリスト)
    let filePath = Bundle.main.path(forResource: "Detail", ofType: "plist")
    
    //ファイルの内容を読み込んでディクショナリー型に格納(わかりやすくするため)
    let array = NSArray(contentsOfFile:filePath!)
    
    //TableViewで扱いやすい形（エリア名の入っている配列）を作成
    //dictionary型の高速列挙
    for data in array! {
      
    //print(key) //データ取れている9/19
      
      var dic = data as! NSDictionary
      
    placeList.append(dic["description"] as! String)
      //apendが何か？ Key配列の追加！
    }
  
    
    myCollectionView.delegate = self
    myCollectionView.dataSource = self
    
    //self.view.addSubview(myCollectionView)
    //ここの処理は何をしているか？ プログラム内の追加の処理
  }
  
 
  /*
   Cellが押された時
   */
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    selectedName = placeList[indexPath.row]
    
    //選択されたエリア名を保存
    //相手セルの番号を指定しておくる！9/19
    if 0 == indexPath.row {
      print("確認用")
      selectedName = placeList[indexPath.row]
    }else if 1 == indexPath.row {
      selectedName = placeList[indexPath.row]
    }else if 2 == indexPath.row{
      selectedName = placeList[indexPath.row]
    }else if 3 == indexPath.row {
      selectedName = placeList[indexPath.row]
    }else if 4 == indexPath.row{
      selectedName = placeList[indexPath.row]
    }else if 5 == indexPath.row{
      myImage = UIImage(named: "Image")!
    }
    
    
    
//    if 0 == indexPath.row {
//      selectedName = placeList[indexPath.row]
//    }
    
    //セグエを指定して、画面遷移 アイデンティファイヤーの通路！
    performSegue(withIdentifier: "next", sender: nil)
    
    print("Num: \(indexPath.row)")
    print("Value:\(collectionView)")
    
  }
  
  /*
   表示するセルの数！
   */
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return list.count
  }
  
  /*
   Cellに値を設定する
   */
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
   
    let cell:CustomCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
    
    cell.lblSample?.text = list[indexPath.row]
    cell.imgSample?.image = UIImage(named: imageDesu[indexPath.row])
    return cell
  }
  // セクションの数（今回は1つ）
  func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
  }
  
   @IBAction func back (_ segue:UIStoryboardSegue){}
  
  //override(上書き)だが、prepareはviewcontroller画面に組み込まれているため、上書きする必要がある！
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    
    //移動先の画面に渡したい情報をセットできる
    //dv　今から移動する画面のオブジェクト(インスタンス)
    //移動先画面のオブジェクトを取得！
    let dv: ViewController1_2 = segue.destination as! ViewController1_2
    
    
    //作成しておいたプロパティに、選択されたエリア名を保存
    dv.scSelectedName = selectedName
    
    dv.scSelectedIndex = selectedIndex
    
    dv.Image = myImage
  }

  

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}
