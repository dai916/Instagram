            //
            //  PostData.swift
            //  Instagram
            //
            //  Created by 冨田大介 on 2018/08/27.
            //  Copyright © 2018年 dai916. All rights reserved.
            //
            
import UIKit
import Firebase
import FirebaseDatabase
class PostData: NSObject {
    var id: String?
    var image: UIImage?
    var imageString: String?
    var name: String?
    var caption: String?
    var date: Date?
    var likes: [String] = []
    var isLiked: Bool = false
    var comments : [String] = []
                
    init(snapshot: DataSnapshot, myId: String) {
        self.id = snapshot.key
        let valueDictionary = snapshot.value as! [String: Any]
        imageString = valueDictionary["image"] as? String
        image = UIImage(data: Data(base64Encoded: imageString!, options: .ignoreUnknownCharacters)!)
        self.name = valueDictionary["name"] as? String
        self.caption = valueDictionary["caption"] as? String
        let time = valueDictionary["time"] as? String
        self.date = Date(timeIntervalSinceReferenceDate: TimeInterval(time!)!)
        if let likes = valueDictionary["likes"] as? [String] {
            self.likes = likes
        }
        for likeID in self.likes {
            if likeID == myId {
                self.isLiked = true
                break
            }
                
        }
        if let comments = valueDictionary["comments"] as? [String] {
            self.comments = comments
        }
    }
}
            
            
            
            
            
            
