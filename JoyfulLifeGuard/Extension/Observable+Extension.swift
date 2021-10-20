import RxCocoa
import RxSwift

extension ObservableType where Element == Bool {
    
    func not() -> Observable<Bool> {
        return map(!)
    }
    
}

extension SharedSequenceConvertibleType {
    
    func mapToVoid() -> SharedSequence<SharingStrategy, Void> {
        return map { _ in }
    }
    
}

extension ObservableType {
    
    func catchErrorJustNever() -> Observable<Element> {
        return catchError { _ in
            return Observable.never()
        }
    }
    
    func catchErrorJustComplete() -> Observable<Element> {
        return catchError { _ in
            return Observable.empty()
        }
    }
    
    func asDriverOnErrorJustNever() -> Driver<Element> {
        return asDriver(onErrorDriveWith: .never())
    }
    
    func asDriverOnErrorJustComplete() -> Driver<Element> {
        return asDriver(onErrorDriveWith: .empty())
    }
    
    func mapToVoid() -> Observable<Void> {
        return map { _ in }
    }
    
}

extension PrimitiveSequence {
    
    func asDriverOnErrorJustNever() -> Driver<Element> {
        return asDriver(onErrorDriveWith: .never())
    }
    
    func asDriverOnErrorJustComplete() -> Driver<Element> {
        return asDriver(onErrorDriveWith: .empty())
    }
    
}
