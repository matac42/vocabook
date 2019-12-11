//
//  DetaileViewController.swift
//  vocabook
//
//  Created by 高江洲　壱星 on 2019/12/11.
//  Copyright © 2019 Matayoshi Yuto. All rights reserved.
//

import UIKit

class Detail2ViewController: UIViewController {
    @IBOutlet weak var memoTextView: UITextView!

    var selectedRow:Int!
    var selectedMemo : String!

    override func viewDidLoad() {
        super.viewDidLoad()

       memoTextView.text = selectedMemo
    }

    @IBAction func deleteMemo(_ sender: Any) {
        let ud = UserDefaults.standard
        if ud.array(forKey: "memoArray") != nil{
            var saveMemoArray = ud.array(forKey: "memoArray") as![String]
            saveMemoArray.remove(at: selectedRow)
            ud.set(saveMemoArray, forKey: "memoArray" )
            ud.synchronize()
            //画面遷移

            self.navigationController?.popViewController(animated: true)
        }
    }
}
