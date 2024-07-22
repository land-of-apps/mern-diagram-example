This project is a fork of the [MERN Ecommerce](https://github.com/mohamedsamara/mern-ecommerce) project. You can view the original [README here](OLD_README.md). 
This an ideal MERN (Mongo, Express, React, Node) project to use with the [AppMap Navie](https://appmap.io/navie/) AI Architect.

You can use this project to ask various questions of AppMap Navie using the `@diagram` command prefix.  
This will generate Mermaid diagrams that you can use within GitHub Issues & Pull Requests, or otherwise share 
with members of your team. 

## Example Diagrams
  - [Entity Relationship](#entity-relationship)
  - [Sequence Diagram](#sequence-diagram)
  - [Flow Chart](#flow-chart)
  - [Class Map](#class-map)

### Entity Relationship

```
@diagram the entitiy relationships between products, categories, and brands
```

```mermaid
erDiagram
  PRODUCT {
    string _id
    string name
    text description
    float price
    int quantity
    string category_id
    string brand_id
  }
  CATEGORY {
    string _id
    string name
    text description
  }
  BRAND {
    string _id
    string name
    text description
  }

  PRODUCT ||--o{ CATEGORY : belongs_to
  PRODUCT ||--o{ BRAND : belongs_to
  CATEGORY ||--o{ PRODUCT : has_many
  BRAND ||--o{ PRODUCT : has_many
```

![Navie Entity Relationship Example](mern-entity-relationship.png)

### Sequence Diagram
```
@diagram the process where a user adds items to their cart to complete a purchase.
```


```mermaid
sequenceDiagram
  participant User as User
  participant Browser as Browser
  participant App as Application
  participant CartAPI as "Cart API"
  participant ProductAPI as "Product API"

  User->>Browser: Add items to cart
  Browser->>App: Send add-to-cart request
  App->>CartAPI: POST /api/cart/add
  activate CartAPI

  CartAPI->>ProductAPI: Validate product details
  activate ProductAPI
  ProductAPI-->>CartAPI: Return product details
  deactivate ProductAPI
  
  alt Product available
    CartAPI-->>App: Add item to cart and return cart details
  else Product not available
    CartAPI-->>App: Return error message
  end
  deactivate CartAPI
  
  App-->>Browser: Update cart UI with new items or show error
  Browser-->>User: Show updated cart or error message
```

![Navie Sequence Diagram](mern-sequence-diagram.png)

### Flow Chart

```
@diagram a flow chart of the user product purchase experience from adding items to a cart through checkout.
```

```mermaid
flowchart TD
    A["User browses products"]
    A --> B["User adds item to cart"]
    B --> C["Check availability of product"]
    C --> D{"Is product available?"}
    D -->|No| E["Show out-of-stock message"]
    D -->|Yes| F["Update cart in localStorage"]
    F --> G["Show updated cart"]
    G --> H["User proceeds to checkout"]

    H --> I["Check user login status"]
    I --> J{"Is user logged in?"}
    J -->|No| K["Redirect to login page"]
    J -->|Yes| L["Get cart items from localStorage"]
    L --> M["Calculate total price"]

    M --> N["Create cart ID if not exists"]
    N --> O["Get cart items from store"]
    O --> P["Proceed to payment"]
    P --> Q["Process payment"]
    Q --> R{"Payment successful?"}
    R -->|No| S["Show payment error message"]
    R -->|Yes| T["Show order confirmation page"]
```

![Navie Flow Chart](mern-flow-chart.png)

### Class Map

```
@diagram a class map focusing on products, categories, brands, and the user cart
```

```mermaid
classDiagram
  direction LR

  class Product {
      +String sku
      +String name
      +String description
      +Decimal price
      +int quantity
      +String image
      +Boolean isActive
      +Boolean taxable
  }

  class Category {
      +String name
  }

  class Brand {
      +String name
  }

  class Cart {
      +int id
      +Decimal total
  }

  class CartItem {
      +int quantity
      +Decimal price
  }

  class User {
      +String username
      +String email
      +String password
  }

  Product "1" -- "*" CartItem : Contains
  Cart "1" -- "*" CartItem : Contains
  Category "1" -- "*" Product : Contains
  Brand "1" -- "*" Product : Manufactures
  User "1" -- "1..*" Cart : Owns
```

![Navie Class Map](mern-class-map.png)