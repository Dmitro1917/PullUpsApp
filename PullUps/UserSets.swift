import Foundation

class UserSets{
    static let shared = UserSets()
    
    private let kUserSetsKey = "UserSets.kUserSetsKey"
    
    var selectionSet: [String]? {
        set { UserDefaults.standard.set(newValue, forKey: kUserSetsKey) }
        get { return UserDefaults.standard.stringArray(forKey: kUserSetsKey) }
    }
}
