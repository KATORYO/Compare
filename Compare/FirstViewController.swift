//
//  FirstViewController.swift
//  Compare
//
//  Created by 加藤諒 on 2017/09/17.
//  Copyright © 2017年 mirai. All rights reserved.
//

import UIKit



class FirstViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
  let list:[String] = ["コンビニ","ファストフード","電化製品","雑貨","レストラン","大きな買い物","生活費","住宅","工事費"]
  
  let imageDesu:[String] = ["Image-1","Image","Image-2","Image","Image","Image","Image","Image","Image-3","Image"]
  
  
  //紹介したいエリア名が格納される配列
  var placeList:[String] = []
  
  //選択された行の表示エリア名
  var selectedName = ""
		

  @IBOutlet weak var myCollectionView: UICollectionView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    //ファイルパスを取得(エリア名が格納されているプロパティリスト)
    let filePath = Bundle.main.path(forResource: "Detail", ofType: "plist")
    
    //ファイルの内容を読み込んでディクショナリー型に格納(わかりやすくするため)
    let dic = NSDictionary(contentsOfFile:filePath!)
    
    //TableViewで扱いやすい形（エリア名の入っている配列）を作成
    //dictionary型の高速列挙
    for(key,data) in dic! {
      
    print(key) //アヤラ、モアルボアルが取得できているのが確認できる
    placeList.append(key as! String)
    }
  
    
    myCollectionView.delegate = self
    myCollectionView.dataSource = self
    
    self.view.addSubview(myCollectionView)
    
  }
  
 
  /*
   Cellが押された時
   */
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    //選択されたエリア名を保存
    selectedName = placeList[indexPath.row]
    
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
  }

  

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}
