// я подумал что это отличный кейс для `Strong ID Type`, который делается с помощью фантомных типов
// и тут снова горячо рекомендую Point-Free 😃 с их библиотекой [Tagged](https://github.com/pointfreeco/swift-tagged) (с нее, кстати, началось мое знакомство с ними)
// используя фантомные типы мы никогда не смешаем id разных сущностей просто потому что это совершенно разные типы

import Tagged

protocol Parameter<ID, Value> {
    
    associatedtype ID
    associatedtype Value
    
    var id: Tagged<Value, ID> { get }
    var value: Value { get }
}

struct InfoParameter: Parameter {
    
    let id: Tagged<Info, String>
    let value: Info
    
    struct Info {
        
        let title: String
        let icon: Icon
    }
}

struct Icon {
    
    //...
}

struct ProductParameter: Parameter {
    
    let id: Tagged<Product, String>
    let value: Product
    
    struct Product {
        
        let type: ProductType
        
        enum ProductType {
            
            case card
            case account
            // ...
        }
    }
}

struct ButtonParameter: Parameter {
    
    let id: Tagged<Button, String>
    let value: Button
    
    struct Button {
        
        let title: String
        let style: ButtonStyle
        
        enum ButtonStyle {
            
            case primary
            case secondary
        }
    }
}
