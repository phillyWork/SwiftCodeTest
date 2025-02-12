import Foundation

class ParkingSystem {

    var big: Int
    var medium: Int
    var small: Int

    init(_ big: Int, _ medium: Int, _ small: Int) {
        self.big = big
        self.medium = medium
        self.small = small
    }
    
    func addCar(_ carType: Int) -> Bool {
        switch carType {
            case 1:
                big -= 1
                return big >= 0 ? true : false
            case 2:
                medium -= 1
                return medium >= 0 ? true : false
            case 3:
                small -= 1
                return small >= 0 ? true : false
            default: return false
        }
    }
}

// handle index by int type array

class ParkingSystem {

    // 0: Big, 1: Medium, 2: Small
    private var slots: [Int]

    init(_ big: Int, _ medium: Int, _ small: Int) {
        self.slots = [big, medium, small]
    }
    
    func addCar(_ carType: Int) -> Bool {
        let index = carType - 1  // carType: 1, 2, 3 --> array index: 0, 1, 2
        guard index >= 0 && index < slots.count else { return false }
        
        if slots[index] > 0 {
            slots[index] -= 1
            return true
        } else {
            return false
        }
    }
}


// using dictionary instead of array

class ParkingSystem {
    private var dict: [Int:Int] = [:]
    
    init(_ b: Int, _ m: Int, _ s: Int) {
        [b,m,s].enumerated().forEach {
            dict[$0 + 1] = $1
        }
    }
    
    func addCar(_ t: Int) -> Bool {
        dict[t, default: 1] -= 1
        return (dict[t] ?? 0) >= 0
    }
}
