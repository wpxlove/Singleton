//Global Constant

private let _SingletonSharedInstance = Singleton()

class Singleton {
	class var sharedInstance: Singleton {
		return _SingletonSharedInstance
	}
}

//Nested Struct

class Singleton {
	class var sharedInstance: Singleton {
		struct Static {
			static let instance: Singleton = Singleton()
		}
		return Static.instance
	}
}

//dispatch_once
class Singleton {
	class var sharedInstance: Singleton {
		struct Static {
			static var onceToken: dispatch_once_t = 0
			static var instance: Singleton? = nil
		}
		dispatch_once(&Static.onceToken) {
			Static.instance = Singleton()
		}
		return Static.instance!
	}
}






