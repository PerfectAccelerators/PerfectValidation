
import Foundation

public struct Rule<T> {
    let keyPath: PartialKeyPath<T>
    let validator: (T) -> ValidationError?
}
