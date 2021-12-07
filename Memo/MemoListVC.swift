//
//  MemoListVC.swift
//  Memo
//
//  Created by 임재헌 on 2021/12/03.
//

import UIKit

class MemoListVC: UITableViewController {
    //앱 댈리게이트 객체의 참조정보를 읽어옴
    let appDelegte = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //디바이스 스크린에 뷰 컨트롤러가 나타날 때마다 호출
    override func viewWillAppear(_ animated: Bool) {
        //메모를 추가하고 리스트화면으로 돌아가기전, 테이블을 업데이트
        self.tableView.reloadData()
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.appDelegte.memoList.count
        return count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //1.memolist 배열 데이터에서 주어진 행에 맞는 데이터를 추출
        let data = self.appDelegte.memoList[indexPath.row]
        //2.이미지 속성이 비어있을 경우, 'memoCell' 호출, 비어있지 않을 경우 'memoCellWithImage'호출
        let cellId = data.image == nil ? "memoCell" : "memoCellWithImage"
        //3.프로토타입 셀 인스턴스를 생성 (재사용 큐에 들어감)
       let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as! MemoCell
        //4.셀의 내용을 구성한다.
        cell.subject?.text = data.title
        cell.contents?.text = data.contents
        cell.img?.image = data.image
        //5.Date 타입의 날짜를 yyyy-MM-dd HH:mm:ss 포멧에 맞게 변경한다.
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        //Date() 타입 객체인 data.regdate 를 문자열 형으로 변환
        cell.regdate?.text = formatter.string(from: data.regdate!)
        //6.cell 객체를 리턴한다.
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //1.셀이 클릭될때 해당 셀의 내용을 appDelegate클래스의 memolist 로부터 가져옴
        let data = self.appDelegte.memoList[indexPath.row]
        
        //2.상세화면 인스턴스를 생성
        guard let readVC = self.storyboard?.instantiateViewController(withIdentifier: "MemoRead") as?
                MemoReadVC else {return}
        //3.값을 전달한 다음 상세화면으로 이동
        readVC.parm = data
        self.navigationController?.pushViewController(readVC, animated: true)
        
    }
    
}
