//
//  SecondViewController2_2.swift
//  Compare
//
//  Created by 加藤諒 on 2017/10/01.
//  Copyright © 2017年 mirai. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController2_2: UIViewController {
  
  
  
  //メモNo
  var memoNo = ""
  
  //メモ内容
  @IBOutlet weak var myTitle: UITextView!
  
  //インスタンスの作成
  //let saves = UserDefaults.standard
  
  let str = ""
  
  //@NSManaged var name: String
  
  var contentTitle:[String] = []
  
  var people: [NSManagedObject] = []

  
  
  var fetchedArray: [NSManagedObject] = []
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
      return
    }
    
    let managedContext = appDelegate.persistentContainer.viewContext
    
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Memo")
    do {
      fetchedArray = try managedContext.fetch(fetchRequest)
    } catch let error as NSError {
      print("Could not fetch. \(error), \(error.userInfo)")
    }
  }
  
  
  
  //保存
  @IBAction func saveButton(sender: AnyObject) {
    
   //UserDefaults.standard.set(myTitle, forKey: "myText"+memoNo)
    
//    saves.set(myTitle.text, forKey: ""+memoNo)
//    
//    print(myTitle.text)
//    print("")
    
    
//    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
//      return
//    }
//    
//    let managedContext = appDelegate.persistentContainer.viewContext
//    
//    let entity = NSEntityDescription.entity(forEntityName: "Memo",
//                                            in: managedContext)!
//    
//    let person = NSManagedObject(entity: entity,
//                                 insertInto: managedContext)
//    
//    person.setValue(name, forKeyPath: "name")
//    
//    do {
//      try managedContext.save()
//      people.append(person)
//    } catch let error as NSError {
//      print("Could not save. \(error), \(error.userInfo)")
//    }
//  
    
    
    
    
    //AppDelegateを使う用意をしておく
    let appD:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //エンティティを操作するためのオブジェクトを作成
    let viewContext = appD.persistentContainer.viewContext
    
    //ToDoエンティティオブジェクトを作成
    let Memo = NSEntityDescription.entity(forEntityName: "Memo", in: viewContext)
    
    //ToDoエンティティにレコード（行）を挿入するためのオブジェクトを作成
    let newRecord = NSManagedObject(entity: Memo!, insertInto: viewContext)
    
    //値のセット(アトリビュート毎に指定) forKeyはモデルで指定したアトリビュート名
    newRecord.setValue(myTitle.text, forKey: "memo")
   
    
    //レコード（行）の即時保存
    do{
      try viewContext.save()
    }catch{
      
    }
    
    //配列再取得
    //配列を空っぽにして、readで再び読み込み。
    //reloadDataでリアルタイム表示を可能にさせる
//    contentTitle = []
    fetchedArray = []
    read()
    
    
    //Memo.reloadData()
    //なぜか？
    //myTitle.text = fetchedArray[]
    
    //myTitle.text(forkey: "memo")
  
    //myTitle.reloadData()
    
    myTitle.reloadInputViews()
  

    
  }//保存ボタンの閉じたぐ
  
  
  //テキストを閉じる処理
  @IBAction func closeBtn(_ sender: UIBarButtonItem) {
      myTitle.resignFirstResponder()
  }
  
  
  //vie
  override func viewDidLoad() {
        super.viewDidLoad()
    
    //CoreDataからデータを読み込む処理
    read()
    
    //userdefault
//    saves.register(defaults: ["myText": "default"])
//    
//    myTitle.text = saves.string(forKey: "myText"+memoNo)

  }

  //CoreDataに保存されているデータの読み込み処理（READ）
  func read(){
    
    //AppDelegateを使う用意をしておく
    let appD:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //エンティティを操作するためのオブジェクトを使用
    let viewContext = appD.persistentContainer.viewContext
    
    //どのエンティティからデータを取得してくるか設定
    let query:NSFetchRequest<Memo> = Memo.fetchRequest()
    
    //データ一括取得
    do{
      //保存されてるデータをすべて取得
      let fetchResults = try viewContext.fetch(query)
      
      //一件ずつ表示
      for result:AnyObject in fetchResults{
        let memo:String? = result.value(forKey:"memo") as? String
        
        print("memo:\(memo!)")
        
        contentTitle.append(memo as! String)
        
        //print(contentTitle[])
        print(memo!)
        
        
      }
    }catch{
    }
    
  }

  
//  override func viewWillAppear(_ animated: Bool) {
//    super.viewWillAppear(true)
//    

     let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Memo")
//    do {
//      contentTitle[] = try context.fetch(fetchRequest as! NSFetchRequest<NSFetchRequestResult>) as! [Memo]
//      UIRefreshControl()
//    }
//    catch {
//      print("Fetching Failed")
//    }
//  }
  
  


  //一つ前に戻る処理
  @IBAction func backBtn(_ sender: UIBarButtonItem) {
    
    //saves.set(myTitle.text, forKey: ""+memoNo)
    
    performSegue(withIdentifier: "next4", sender: nil)
    
    
  }



  override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
  }
    // cell.textLabel!.text = self.saves

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
