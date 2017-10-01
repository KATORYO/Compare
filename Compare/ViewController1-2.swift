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
    var scSelectedName1 = ""
  
    //前の画面から送られてきた行番号
    var scSelectedIndex = -1
  
    //この画面から１−３への番号
    var scSelectedIndex1 = -1
    var scSelectedName2 = ""
    var placeList1:[String] = []
  
    var Image:UIImage = UIImage()
  
    @IBOutlet weak var myCollectionView1_2: UICollectionView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

      print(scSelectedIndex)
      
    myCollectionView1_2.delegate = self
    myCollectionView1_2.dataSource = self
      
      
    //プロパティリスト読み込み
      let filePathFastfood = Bundle.main.path(forResource: "Fastfood", ofType: "plist")
      
      let filePathConvinience = Bundle.main.path(forResource:"Convenience", ofType:"plist")
      
      let filePathShopAndGallery = Bundle.main.path(forResource: "ShopAndGallery", ofType: "plist")
      
      let filePathLivingOfCosts = Bundle.main.path(forResource: "LivingOfCosts", ofType: "plist")
      
      let filePathBigShopping = Bundle.main.path(forResource: "BigShopping", ofType: "plist")
      
      let filePathErectricAppliances = Bundle.main.path(forResource: "ElectricAppliances", ofType: "plist")
      
      let filePathConstruction = Bundle.main.path(forResource: "Construction", ofType: "plist")
      let filePathDwelling = Bundle.main.path(forResource: "Dwelling", ofType: "plist")
      
    //ファイルの内容を読み込んでarray型に格納
      switch scSelectedIndex {
      case 0:
        array = NSArray(contentsOfFile: (filePathFastfood)!)!
      case 1:
        array = NSArray(contentsOfFile:filePathConvinience!)!
      case 2:
        array = NSArray(contentsOfFile:filePathShopAndGallery!)!
      case 3:
        array = NSArray(contentsOfFile:filePathLivingOfCosts!)!
      case 4:
        array = NSArray(contentsOfFile:filePathBigShopping!)!
      case 5:
        array = NSArray(contentsOfFile:filePathErectricAppliances!)!
        
      case 6:
        array = NSArray(contentsOfFile: filePathDwelling!)!
      case 7:
        array = NSArray(contentsOfFile: filePathConstruction!)!
      default: break
      }
 
  }
  
  
    /*
     Cellが押された時
    */
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
      //ここが３番目の画面を左右する！
      scSelectedIndex1 = indexPath.row
      
      if scSelectedIndex == 0 && scSelectedIndex1 == 0 {
        print("成功です")
        
      }
    
    //画面遷移
    performSegue(withIdentifier: "next2", sender: nil)

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

    return cell
  }
  
  // セクションの数（今回は1つ）
  func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
  }
  
  //一つ前に戻るためのプログラム
  @IBAction func back1_2 (_ segue:UIStoryboardSegue){}
  
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    
    //移動先の画面に渡したい情報をセットできる
    //dv　今から移動する画面のオブジェクト(インスタンス)
    //移動先画面のオブジェクトを取得！
    let dv: ViewController1_3 = segue.destination as! ViewController1_3
    
    dv.scSelectedName2 = scSelectedName2
    
    dv.scSelectedIndex2 = scSelectedIndex1

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
