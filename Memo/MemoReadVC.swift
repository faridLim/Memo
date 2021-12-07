//
//  MemoReadVC.swift
//  Memo
//
//  Created by 임재헌 on 2021/12/03.
//

import UIKit

class MemoReadVC: UIViewController {
    
    //콘텐츠 데이터를 저장하는 변수
    var parm : MemoData?
    
    @IBOutlet var subject: UILabel!
    @IBOutlet var contents: UILabel!
    @IBOutlet var img: UIImageView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        //1.제목, 내용, 이미지 출력
        self.subject.text = parm?.title
        self.contents.text = parm?.contents
        self.img.image = parm?.image
        
        //2.날짜 포멧 변환
        let formatter = DateFormatter()
        formatter.dateFormat = "dd일 HH:mm분에 작성됨"
        let dateString = formatter.string(from: (parm?.regdate)!)
        
        //3.네비게이션 타이틀에 날짜를 표시
        self.navigationItem.title = dateString
    }
    

    

}
