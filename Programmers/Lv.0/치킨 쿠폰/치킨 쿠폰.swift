import Foundation

// 체크할 점: 서비스 치킨에도 쿠폰이 발급됨
// 체크할 쿠폰 개수를 업데이트 해야 함

func solution(_ chicken:Int) -> Int {
    
    var coupons = chicken
    var bonus = 0
    
    while coupons >= 10 {
        bonus += coupons / 10
        
        // coupons/10 : 서비스로 받는 치킨 개수 (= 치킨 마리당 쿠폰 1개)
        // coupons%10 : 서비스로 받을 수 있는 쿠폰 제외 나머지 남은 쿠폰 개수
        
        coupons = coupons / 10 + coupons % 10
    }
    
    return bonus
}
