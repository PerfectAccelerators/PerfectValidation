
import Foundation
@testable import PerfectValidation

struct Account: Codable {
    let name: String
    let pass: String
    let email: String
}

extension Account: Validation {
    public func rules() -> [Rule<Account>] {
        var ruless: [Rule<Account>] = []
        
        let rule = Rule(keyPath: \Account.email) {
            (acc) in
            return self.validate(email: acc.email)
        }
        ruless.append(rule)
        return ruless
    }
}
