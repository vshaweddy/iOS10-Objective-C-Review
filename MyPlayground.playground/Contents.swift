import Foundation
import PlaygroundSupport

class Phone {
    private var phoneAnswerHandler: (() -> Void)?

    deinit {
        print("\(self) is deinitializing")
    }

    func call() {
        self.phoneAnswerHandler?()
    }

    func whenPhoneRings(answer: @escaping (() -> Void)) {
        phoneAnswerHandler = answer
    }
}

class Person {
    let name: String  	// strong is default
    let phone: Phone	// strong is default
	
    init(name: String) {
        self.name = name
        self.phone = Phone()

        setupPhone()
    }

    deinit {
        print("\(self) is deinitializing")
    }

    func setupPhone() {
        self.phone.whenPhoneRings { [weak self] in
			// Decide how you want your closure logic to work if self is no
			// longer alive (could be from a screen change, async networking, etc)
			
			guard let self = self else { return }
			
            print("<Answering phone>")
            print("Hello this is \(self.name)")
        }
    }
}

do {
	var person: Person? = Person(name: "Steve")
	let phone = person!.phone
	person = nil // Person deinits here
	phone.call()
}
