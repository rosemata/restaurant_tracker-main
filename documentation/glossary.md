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
    
    Description: A person who ccupies seat in the restaurant.
    
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
    
    Attribute: Restaurant_ID    1-1
    
    Attribute: Name             M-1
    
    Attribute: Job_Title        M-1
    
    Attribute: Salary           M-M
    
**Table Name: Restaurant**
    
    Attribute: Zip_Code         1-1
    
    Attribute: State            1-1
    
    Attribute: Num_Of_Employees M-M
 
**Table Name: Location**
    
    Attribute: City_Name        1-1
    
**Table Name: Order**

    Attribute: Customer_ID      1-1
    
    Attribute: Restaurant_ID    M-M
    
    Attribute: Date             M-M
    
    Attribute: Total_Cost       M-M
    
    Attribute: Num_Items        M-M
    
**Table Name: Customer**

    Attribute: Phone_Number     1-M
    
    Attribute: Name             M-1
    
**Table Name: Order_Details**

    Attribute: Order_ID         1-1
    
    Attribute: Item_ID          1-1
    
    Attribute: Quantity         M-M
    
    Attribute: Cost             M-M
    
**Table Name: Item**

    Attribute: Name             M-1
    
    Attribute: Cost             M-M
    
    Attribute: Quantity         M-M

