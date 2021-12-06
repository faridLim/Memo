//
//  MemoFormVC.swift
//  Memo
//
//  Created by 임재헌 on 2021/12/03.
//

import UIKit

class MemoFormVC: UIViewController{
    var subject : String!
    
    @IBOutlet var contents: UITextView!
    @IBOutlet var preview: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contents.delegate = self
    }
    
    //저장 버튼을 클릭했을 때 호출되는 메소드
    @IBAction func save(_ sender: Any) {
    }
    //카메라 버튼을 클릭했을 때 호출되는 메소드
    @IBAction func pick(_ sender: Any) {
        //이미지 피커 인스턴스를 생성
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        //이미지 피커 화면을 표시한다.
        self.present(picker,animated:  false)
    }
    
}
//UIImagePicker로 부터 발생하는 이벤를 대신처리
extension MemoFormVC : UIImagePickerControllerDelegate{
    //사용자가 이미지를 선택하면 자동으로 호출되는 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //선택된 이미지를 UIImageView에 표시
        self.preview.image = info[.editedImage] as? UIImage
        
        //이미지 피커 컨트롤러를 닫음
        picker.dismiss(animated: false)
    }
}

//UITextView에서 발생하는 이벤트를 처리
extension MemoFormVC : UITextViewDelegate{
    // 사용자가 텍스트 뷰에 뭔가를 입력하면 자동으로 호출되는 메소드
    func textViewDidChange(_ textView: UITextView) {
        //내용의 최대 15자리까지 읽어 subject 변수에 저장
        
        /* String 타입을 NSString 타입으로 변환 (NSString은 관련 메소드가 많아 다루기 편리)
         String과 NSString은 서로 완전호환되기 때문에 오류나 옵셔널 타입 걱정 없이 단순 캐스팅 가능
        */
        let contents = textView.text as NSString
        //글자길이를 check
        let length =  ((contents.length > 15) ? 15 : contents.length)
        //NSString타입에서 원하는 범위만 잘라낼 때 사용
        self.subject = contents.substring(with: NSRange(location: 0, length: length))
        
        //네비게이션 타이틀에 표시
        self.navigationItem.title = self.subject
    }
    
}

extension MemoFormVC : UINavigationControllerDelegate{
    
}
