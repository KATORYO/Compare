//
//  FirstViewController.swift
//  Compare
//
//  Created by 加藤諒 on 2017/09/17.
//  Copyright © 2017年 mirai. All rights reserved.
//

import UIKit



class FirstViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
  let list:[String] = ["飲食店","コンビニ","雑貨","生活費","大きな買い物","電化製品","住宅","工事費"]
  
  let imageDesu:[String] = ["CoffeeSrarbucks","Convenience7","Image-11","LivingOfCosts","Image-10","Image-2","Image-3","Image-12"]
  
  var myImage:UIImage = UIImage()
  
  //一つだけでもオッケー！
  //紹介したいエリア名が格納される配列
  
  var placeListFood:[String] = []
  
  var placeListConvenience:[String] = []
  
  var placeListShopAndGallery:[String] = []
  
  var placeListLivingOfCosts:[String] = []
  
  var placeListBigShopping:[String] = []
  
  var placeListElectricAppliances:[String] = []
  
  var placeListDwelling:[String] = []
  
  var placeListConstruction:[String] = []
  
  
  //ここに保存されて、次の画面に送る！
  var selectedName = ""
  
  var selectedIndex = -1 //選択された行番号！
		

  @IBOutlet weak var myCollectionView: UICollectionView!

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  //ファイルパスを取得
//  let filePath = Bundle.main.path(forResource: "Detail", ofType: "plist")
//    
//  let filePathFastfood = Bundle.main.path(forResource: "Fastfood", ofType: "plist")
//    
//  let filePathConvinience = Bundle.main.path(forResource:"Convenience", ofType:"plist")
//    
//  let filePathShopAndGallery = Bundle.main.path(forResource: "ShopAndGallery", ofType: "plist")
//    
//  let filePathLivingOfCosts = Bundle.main.path(forResource: "LivingOfCosts", ofType: "plist")
//    
//  let filePathElectricAppliances = Bundle.main.path(forResource: "ElectricAppliances", ofType: "plist")
//    
//  let filePathBigShopping = Bundle.main.path(forResource: "BigShopping", ofType: "plist")
//    
//  let filePathConstruction = Bundle.main.path(forResource: "Construction", ofType: "plist")
//  let filePathDwelling = Bundle.main.path(forResource: "Dwelling", ofType: "plist")
//    
    
    //ファイルの内容を読み込んでディクショナリー型に格納(わかりやすくするため)
//    let array = NSArray(contentsOfFile:filePath!)
//
//    let arrayFood = NSArray(contentsOfFile:filePathFastfood!)
//    
//    let arrayConvenience = NSArray(contentsOfFile:filePathConvinience!)
//    
//    let arrayShopAndGallery = NSArray(contentsOfFile:filePathShopAndGallery!)
//    
//    let arrayLivingOfcosts = NSArray(contentsOfFile: filePathLivingOfCosts!)
//    
//    let arrayBigShopping = NSArray(contentsOfFile: filePathBigShopping!)
//    
//    let arrayElectricAppliances = NSArray(contentsOfFile: filePathElectricAppliances!)
//    
//    let arrayConstruction = NSArray(contentsOfFile: filePathConstruction!)
//    
//    let arrayDwelling = NSArray(contentsOfFile: filePathDwelling!)
    
    //TableViewで扱いやすい形（エリア名の入っている配列）を作成
    //dictionary型の高速列挙
//    for data in array! {
//      let dic = data as! NSDictionary
    
      
          //apendが何か？ Key配列の追加！
//          placeListFood.append(dic["description"] as! String)
//      
//      placeListConvenience.append(dic["description"] as! String)
//      placeListShopAndGallery.append(dic["description"] as! String)
//      
//      placeListLivingOfCosts.append(dic["description"] as! String)
//
//      placeListBigShopping.append(dic["description"] as! String)
//      
//      placeListElectricAppliances.append(dic["description"] as! String)
//      
//      
//        placeListDwelling.append(dic["description"] as! String)
//      placeListConstruction.append(dic["description"] as! String)
//
//    }
//  }
 
  
  /*
   Cellが押された時
   */
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    selectedIndex = indexPath.row
    
//    if selectedIndex == 0 {
//      var selectedIndex20 = indexPath.row
//      var selectedName = placeListFood
//    }else if selectedIndex == 1 {
//      var selectedIndex = indexPath.row
//      var selectedName = placeListConvenience
//    }else if selectedIndex == 2{
//      var selectedIndex = indexPath.row
//      var selectedName:[String] = placeListShopAndGallery
//    }else if selectedIndex == 3 {
//      var selectedName:[String] = placeListLivingOfCosts
//    }else if selectedIndex == 4{
//      var selectedName:[String] = placeListBigShopping
//    }else if selectedIndex == 5{
//      var selectedName:[String] = placeListElectricAppliances
//    }else if selectedIndex == 6{
//      var selectedName:[String] = placeListDwelling
//    }else if selectedIndex == 7{
//      var selectedName:[String] = placeListConstruction
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
  
   
  
  //override(上書き)だが、prepareはviewcontroller画面に組み込まれているため、上書きする必要がある！
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    
    //移動先の画面に渡したい情報をセットできる
    //dv　今から移動する画面のオブジェクト(インスタンス)
    //移動先画面のオブジェクトを取得！
    let dv: ViewController1_2 = segue.destination as! ViewController1_2
    
    //dv.scSelectedName = selectedName
    
    dv.scSelectedIndex = selectedIndex
    
    dv.Image = myImage
  }

  

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}
