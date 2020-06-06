//
//  ViewController.swift
//  iOSFirebase
//
//  Created by Ahn on 2020/06/06.
//  Copyright © 2020 ozofweird. All rights reserved.
//

import UIKit
import FirebaseStorage

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func storageBtn(_ sender: Any) {
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        let storageRef = Storage.storage().reference().child("폴더.jpg")
        let 폴더이미지 = self.imageView.image?.jpegData(compressionQuality: 1.0) // 압축 설정
        
        storageRef.putData(폴더이미지!, metadata: metadata){ (metadata, error) in
            if error != nil {
                print(error)
                return
            } else {
                storageRef.downloadURL { (url, error) in
                    print(url)
                }
                
            }
        }
    }
    
}

