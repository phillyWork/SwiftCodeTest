import Foundation

func solution(_ id_pw:[String], _ db:[[String]]) -> String {
    
    var result = "fail"
    
    for data in db {
        if data[0] == id_pw[0] {
            result = data[1] == id_pw[1] ? "login" : "wrong pw"
            break
        }
    }
    
    return result
}


// 개선
// id만 동일할 경우는 없으므로, login이 되려면 무조건 pw 동일 --> db가 id_pw 포함 여부 따지기로 시작
// 없는 경우: id는 존재하지만 pw를 잘못 입력한 경우 or 아예 없는 경우

func solution(_ id_pw:[String], _ db:[[String]]) -> String {
    return db.contains(id_pw) ? "login"
    : db.map{ $0[0] }.contains(id_pw[0]) ? "wrong pw"
    : "fail"
}
