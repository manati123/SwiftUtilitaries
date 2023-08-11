//
//  ContentView.swift
//  UserDefault
//
//  Created by Preoteasa Ioan-Silviu on 05.07.2023.
//

import SwiftUI

@propertyWrapper
struct UserDefault<T: Codable> {
    let key: String
    let defaultValue: T
    
    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            guard let value = UserDefaults.standard.value(forKey: key) else {
                switch T.self {
                case is String.Type, is Bool.Type, is Data.Type, is Int.Type, is Double.Type, is Float.Type, is URL.Type:
                    UserDefaults.standard.set(defaultValue, forKey: key)
                default:
                    UserDefaults.standard.set(try? JSONEncoder().encode(defaultValue), forKey: key)
                }
                return defaultValue
            }
            
            switch T.self {
            case is String.Type, is Bool.Type, is Data.Type, is Int.Type, is Double.Type, is Float.Type, is URL.Type:
                guard let returnValue = value as? T else {
                    return defaultValue
                }
                return returnValue
            default:
                guard let data = UserDefaults.standard.data(forKey: key) else {
                    return defaultValue
                }
                guard let returnValue = try? JSONDecoder().decode(T.self, from: data) else {
                    return defaultValue
                }
                return returnValue
            }
        }
        set {
            switch T.self {
            case is URL.Type, is String.Type, is Bool.Type, is Double.Type, is Float.Type, is Int.Type, is Data.Type:
                UserDefaults.standard.set(newValue, forKey: key)
            default:
                let encoder = JSONEncoder()
                if let encodedValue = try? encoder.encode(newValue) {
                    UserDefaults.standard.set(encodedValue, forKey: key)//won't work for nil
                }
            }
        }
    }
}
class UserDefaultsService {
    private enum UserDefaultsKeys: String, Codable {
        case int, double, bool, data, url, string, float
        case optional
    }
    
    @UserDefault(key: UserDefaultsKeys.int.rawValue, defaultValue: 0)
    var number: Int
    @UserDefault(key: UserDefaultsKeys.string.rawValue, defaultValue: "htz")
    var str: String
    @UserDefault(key: UserDefaultsKeys.double.rawValue, defaultValue: 0)
    var double: Double
    @UserDefault(key: UserDefaultsKeys.float.rawValue, defaultValue: 0)
    var float: Float
    @UserDefault(key: UserDefaultsKeys.bool.rawValue, defaultValue: false)
    var bool: Bool
    @UserDefault(key: UserDefaultsKeys.data.rawValue, defaultValue: nil)
    var data: Data?
    @UserDefault(key: UserDefaultsKeys.url.rawValue, defaultValue: nil)
    var url: URL?
    @UserDefault(key: UserDefaultsKeys.optional.rawValue, defaultValue: nil)
    var foo: Foo?
}

struct Foo: Codable {
    var name: String
}

struct ContentView: View {
    let service = UserDefaultsService()
    
    var body: some View {
        VStack {
            Button {
                bar()
            } label: {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }
    
    private func bar() {
//        print(service.str)
//        service.str = "gogo"
//        print(service.str)
//        service.str = "yoyo"
//        print(service.str)
//        service.foo = Foo(name: "ma-ta")
//        print(service.foo?.name)
//        service.foo = Foo(name: "masdfsd-ta")
//        print(service.foo?.name)
//        service.foo = Foo(name: "masdfsdf-ta")
//        print(service.foo?.name)
//        service.foo = nil
//        print(service.foo)
//        service.data = UIImage(systemName: "circle")?.pngData()
//        print(service.data)
//        service.data = nil
//        print(service.data)
//        let x = service.foo
        var x: Foo? = nil
        service.foo = x
        print(service.foo)
        service.foo = Foo(name: "mmm")
        print(service.foo)
//        service.bool = false
//        print(service.bool)
//        service.bool = true
//        print(service.bool)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
