
import Foundation

public protocol Validation {
    func rules() -> [Rule<Self>]
    func validate() -> ValidationError?
}

extension Validation {
    public func validate() -> ValidationError? {
        let result = self.rules().compactMap {
            $0.validator(self)
        }
        if result.isEmpty {
            return nil
        } else {
            return result.first
        }
    }
}

extension Validation {
    public func validate(email: String) -> ValidationError? {
        guard
            let range = email.range(of: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}",
                                    options: [.regularExpression, .caseInsensitive]), range.lowerBound == email.startIndex && range.upperBound == email.endIndex else {
                                        return ValidationError(message: "email address in not in a proper format",
                                                               reason: "")
        }
        return nil
    }
    
    public func validate(pass: String) -> ValidationError? {
        guard let range = pass.range(of: "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.{8,})",
                                     options: [.regularExpression, .caseInsensitive]), range.lowerBound == pass.startIndex && range.upperBound == pass.endIndex else {
                                        return ValidationError(message: "Pass should consist of at least 8 alphanumeric charcters, 1 capital letter and one number!",
                                                               reason: "password is not strong enough")
        }
        return nil
    }
    
    public func validate(existence of: String) -> ValidationError? {
        return of.isEmpty ? ValidationError(message: "string is empty", reason: "") : nil
    }
}
