# Glossary

# Entity

**Entity Name: Employee**
    
    Synonyms: Staff, Personnel, Associate, Worker
    
    Description: A personel who works for the restaurant. Responsible for restaurant operations.
    
**Entity Name: Restaurant**
    
    Synonyms: Diner
    
    Description: A business that serves food to costumers.
 
**Entity Name: Location**
    
    Synonyms: Place, Venue
    
    Description: Gives the place where the restaurant is located.
    
**Entity Name: Order**

    Synonyms: Reservation, Booking, Request
    
    Description: List of customer orders.
    
**Entity Name: Customer**

    Synonyms: Buyer, Client, Consumer
    
    Description: A person who occupies seat in the restaurant.
    
**Entity Name: Order_Details**

    Synonyms: Receipt, Check, Bill, Charges
    
    Description: Gives the total description of a customer's order.
    
**Entity Name: Item**

    Synonyms: Product, Food
    
    Description: The food that can be purchased under restaurant's menu.

# Relationship

**Relationship: Employee-WorksAt-Restaurant**

    Minima: zero-zero
    
    Maxima: one-one

**Relationship: Restaurant-ResidesIn-Location**

    Minima: one-one
    
    Maxima:  one-many

**Relationship: Order-PurchasedAt-Restaurant**

    Minima: many-one
    
    Maxima: many-many

**Relationship: Order-PurchasedBy-Customer**

    Minima: many-one
    
    Maxima: many-many

**Relationship: Order_Details-Contains-Order**

    Minima: many-one
    
    Maxima: many-many

**Relationship: Order_Details-Has-Item**

    Minima: many:one
    
    Maxima: many-many

# Attribute
    
**Table Name: Employee**
    
    Attribute: Customer_ID      1-1(1)  PRIMARY KEY
    
    Attribute: Restaurant_ID    1-1(1)  FOREIGN KEY
    
    Attribute: Name             M-1(1)  NOT NULL
    
    Attribute: Job_Title        M-1(1)  NOT NULL
    
    Attribute: Salary           M-M(1)  NOT NULL
    
**Table Name: Restaurant**

    Attribute: Restaurant_ID    M-M(1)  PRIMARY KEY
    
    Attribute: Zip_Code         1-1(1)  FOREIGN KEY
    
    Attribute: State            1-1(1)  NOT NULL
    
    Attribute: Num_Of_Employees M-M(1)  NOT NULL
 
**Table Name: Location**

    Attribute: Zip_Code         M-M(1)  PRIMARY KEY
    
    Attribute: City_Name        1-1(1)  NOT NULL
    
**Table Name: Order**

    Attribute: Order_ID         1-1(1)  PRIMARY KEY

    Attribute: Customer_ID      1-1(1)  FOREIGN KEY
    
    Attribute: Restaurant_ID    M-M(1)  FOREIGN KEY
    
    Attribute: Date             M-M(0)  NOT NULL
    
    Attribute: Total_Cost       M-M(0)  NOT NULL
    
    Attribute: Num_Items        M-M(0)  NOT NULL
    
**Table Name: Customer**

    Attribute: Customer_ID      1-1(1)  PRIMARY KEY

    Attribute: Phone_Number     1-M(0)  NOT NULL
    
    Attribute: Name             M-1(1)  NOT NULL
    
    Attribute: Email            M-1(1)  NOT NULL
    
**Table Name: Order_Details**

    Attribute: ID               1-1(1)  PRIMARY KEY

    Attribute: Order_ID         1-1(1)  NOT NULL
    
    Attribute: Item_ID          1-1(1)  NOT NULL
    
    Attribute: Quantity         M-M(0)  NOT NULL
    
    Attribute: Cost             M-M(0)  NOT NULL
    
**Table Name: Item**

    Attribute: Item_ID          1-1(1)  PRIMARY KEY

    Attribute: Name             M-1(1)  NOT NULL
    
    Attribute: Cost             M-M(0)  NOT NULL
    
    Attribute: Quantity         M-M(0)  NOT NULL
    
  
**Dependent entities and dependency relationships

    Employee - dependent
    
    Restaurant - dependent
    
    Location - independent
    
    Order - dependent
    
    Customer - independent
    
    Order_Details - dependent
    
    Item - independent

**Supertypes, Subtypes and Partitions

    Employee has Restaurant,  
    
    Location, Order, Customer
    
    Order_Details, Item


**Cascade and Restrict on Foreign Keys that Implement Dependency Relationships

    employee unique, required
    
    restaurant unique, required
    
    location simple, required
    
    order unique, simple
    
    customer unique, required
    
    order_details simple
    
    item simple


