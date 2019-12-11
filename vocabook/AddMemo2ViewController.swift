//
//  AddMemoViewController.swift
//  vocabook
//
//  Created by 高江洲　壱星 on 2019/12/11.
//  Copyright © 2019 Matayoshi Yuto. All rights reserved.
//

import UIKit

class AddMemoViewController: UIViewController {

    @IBOutlet weak var memoTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func save(_ sender: Any) {

        let inputText = memoTextView.text
        let ud = UserDefaults.standard
        if ud.array(forKey: "memoArray") != nil{
            //saveMemoArrayに取得
            var saveMemoArray = ud.array(forKey: "memoArray") as! [String]
                //テキストに何か書かれているか？
            if inputText != ""{
                //配列に追加
                saveMemoArray.append(inputText!)
                ud.set(saveMemoArray, forKey: "memoArray")
            }else{
                showAlert(title: "何も入力されていません")

            }

        }else{
            //最初、何も書かれていない場合
            var newMemoArray = [String]()
            //nilを強制アンラップはエラーが出るから
            if inputText != ""{
                //inputtextはoptional型だから強制アンラップ
                newMemoArray.append(inputText!)
                ud.set(newMemoArray, forKey: "memoArray")
            }else{
                showAlert(title: "何も入力されていません")
            }
        }
        showAlert(title: "保存完了")
        ud.synchronize()
    }

    func showAlert(title:String){
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        alert.addAction(UIAlertAction(title: "キャンセル", style: .cancel, handler: nil))

        self.present(alert, animated: true, completion:nil)
    }
    @IBAction func backpage(_ sender: Any) {
          self.dismiss(animated: true, completion: nil)
      }
}
