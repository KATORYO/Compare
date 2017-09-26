//
//  SecondViewController2_2.swift
//  Compare
//
//  Created by 加藤諒 on 2017/09/26.
//  Copyright © 2017年 mirai. All rights reserved.
//


import UIKit

class NoteViewController: UIViewController {
  // MARK: - Properties
  var note: Note
  
  // MARK: - View Elements
  let memoTextView: UITextView
  
  // MARK: - Initializers
  init(
    note: Note
    ) {
    self.note = note
    
    self.memoTextView = UITextView.newAutoLayoutView()
    
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - View Controller Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = UIColor.whiteColor()
    
    configureNavigationBar()
    addSubviews()
    configureSubviews()
    addConstraints()
  }
  
  override func didMoveToParentViewController(parent: UIViewController?) {
    super.willMoveToParentViewController(parent)
    if parent == nil && !memoTextView.text.isEmpty {
      let notesManager = NotesManager()
      note.memo = memoTextView.text
      notesManager.save(note)
    }
  }
  
  private func configureNavigationBar() {
    title = note.id.isEmpty ? "メモ追加" : "メモ編集"
  }
  
  private func addSubviews() {
    view.addSubview(memoTextView)
  }
  
  private func configureSubviews() {
    memoTextView.text = note.id.isEmpty ? "" : note.memo
    memoTextView.becomeFirstResponder()
  }
  
  private func addConstraints() {
    memoTextView.autoPinEdgesToSuperviewEdges()
  }
  
  
}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


