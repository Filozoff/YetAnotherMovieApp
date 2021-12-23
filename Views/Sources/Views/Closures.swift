import Foundation

public typealias Closure = ReturnClosure<Void>
public typealias ReturnClosure<R> = () -> R
public typealias ValueReturnClosure<T, R> = (_ value: T) -> R
public typealias ValueClosure<T> = ValueReturnClosure<T, Void>
