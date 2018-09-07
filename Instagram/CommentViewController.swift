//
//  CommentViewController.swift
//  Instagram
//
//  Created by 冨田大介 on 2018/08/31.
//  Copyright © 2018年 dai916. All rights reserved.
//
import UIKit
import Firebase
import FirebaseAuth
import SVProgressHUD
class CommentViewController: UIViewController {
    @IBOutlet weak var commentTextField: UITextField!
    var postData:PostData!
    @IBAction func handlePostButton(_ sender: Any) {
        if let commentTextField = commentTextField.text {
            // コメントが入力されていない時はHUDを出して何もしない
            if commentTextField.isEmpty {
                SVProgressHUD.showError(withStatus: "コメントを入力して下さい")
                return
            }
            let name = Auth.auth().currentUser?.displayName
            let comment = "\(name!):\(commentTextField)"
            postData.comments.append(comment)
            let postRef = Database.database().reference().child(Const.PostPath).child(postData.id!)
            let comments = ["comments": postData.comments]
            postRef.updateChildValues(comments)
        }
    }
    @IBAction func handleCancelButton(_ sender: Any) {
            //キャンセルボタンを押したときに呼ばれるメソッド
            //画面を閉じる
            dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
