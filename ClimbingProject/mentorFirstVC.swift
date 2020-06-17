//
//  mentorFirstVC.swift
//  ClimbingProject
//
//  Created by Kyle Yang on 2020/06/17.
//  Copyright © 2020 Kyle Yang. All rights reserved.
//

import UIKit

class mentorFirstVC: UIViewController {
    var mentorName: String = ""
    var mentorLicense: Any = ""
    let picker = UIImagePickerController()
    
    @IBOutlet weak var mentorNameLbl: UILabel!
    @IBOutlet weak var mentorNameTf: UITextField!
    
    @IBOutlet weak var mentorLicenseLbl: UILabel!
    @IBOutlet weak var mentorLicenseImgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
    }
    
    @IBAction func addAction(_ sender: Any) {
        let alert =  UIAlertController(title: "자격증 사진 가져오기", message: "촬영 혹은 앨범에서 가져오기", preferredStyle: .actionSheet)
        let library =  UIAlertAction(title: "사진앨범", style: .default) { (action) in self.openLibrary()
        }
        let camera =  UIAlertAction(title: "카메라", style: .default) { (action) in
        self.openCamera()
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
    
    func openLibrary() {
      picker.sourceType = .photoLibrary
      present(picker, animated: false, completion: nil)
    }

    func openCamera() {
      if(UIImagePickerController .isSourceTypeAvailable(.camera)){
          picker.sourceType = .camera
          present(picker, animated: false, completion: nil)
      }
      else{
          print("Camera not available")
      }
    }
    
    @IBAction func metorInfoSubmit(_ sender: Any) {
        self.mentorName = mentorNameTf.text!
        self.mentorLicense = mentorLicenseImgView.image!
        
        print(self.mentorName)
        print(self.mentorLicense)
        
        //dismiss(animated: true, completion: nil)
        
        let newVC = self.storyboard?.instantiateViewController(identifier: "MainPageVC")
               newVC?.modalPresentationStyle = .fullScreen
               self.present(newVC!, animated: true, completion: nil)
    }
}

extension mentorFirstVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            mentorLicenseImgView.image = image
        }
        dismiss(animated: true, completion: nil)
    }
}
