                    //// assignment here module-6
// task  one complete below........................................
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255) NOT NULL,
    Email VARCHAR(255),
    Location VARCHAR(255)
);


CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(CustomerID)
);

INSERT INTO `orders`(`order_id`, `customer_id`, `order_date`, `total_amount`) VALUES (03,2,27/04/2023,780.10),(04,3,18/04/2023,980.10),
(05,4,17/07/2023,880.10),
(06,4,29/08/2023,480.10),
(07,5,18/04/2023,280.10);



INSERT INTO `customers`(`CustomerName`, `Email`, `Location`) VALUES ("rasel rana","raselges127@gmail.com","Dhaka"),
("Rubel rana","rubelges129@gmail.com","lalmonirhat"),
("rasel rana","raselranages127@gmail.com","Dhaka"),
("Ruyel rana","ruyelranages127@gmail.com","Nilphamari"),
("Ramel rana","rumelranages127@gmail.com","Rangpur"),
("Masud rana","masudges127@gmail.com","Kurigram");


SELECT c.CustomerID, c.CustomerName, c.Email, c.Location, COUNT(o.customer_id) AS total_orders
FROM customers c
INNER JOIN orders o ON c.CustomerID = o.customer_id
GROUP BY c.CustomerID, c.CustomerName, c.Email, c.Location
ORDER BY total_orders DESC;


// task  two complete below.....................................


CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL
);


INSERT INTO Products (name, description, price)
VALUES
    ('Product A', 'Description of Product A', 19.99),
    ('Product B', 'Description of Product B', 29.99),
    ('Product C', 'Description of Product C', 9.99);


    SELECT o.product_id AS Order_ID,o.name,o.description,o.price 
    FROM  Products o
    ORDER BY Order_ID ASC;
    

    // task  three complete below..............................
    

CREATE TABLE product_sales (
    category_id INT,
    product_name VARCHAR(255),
    quantity INT,
    unit_price DECIMAL(10, 2),
    total_revenue DECIMAL(12, 2)
);


INSERT INTO product_sales (category_id, product_name, quantity, unit_price, total_revenue)
VALUES
    (1, 'Product A', 10, 25.00, 250.00),
    (1, 'Product B', 5, 20.00, 100.00),
    (2, 'Product C', 8, 30.00, 240.00),
    (3, 'Product D', 15, 15.00, 225.00),
    (2, 'Product E', 12, 35.00, 420.00),
    (4, 'Product F', 7, 18.00, 126.00),
    (3, 'Product G', 20, 10.00, 200.00);

SELECT
    category_id,
    SUM(total_revenue) AS total_category_revenue
FROM
    product_sales
GROUP BY
    category_id
ORDER BY
    total_category_revenue DESC;



  // task  four complete below.....................................


CREATE TABLE Order_Items (
    order_item_id INT,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2)
);


INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity, unit_price)
VALUES
    (1, 1, 101, 3, 10.00),
    (2, 1, 102, 2, 15.00),
    (3, 2, 103, 5, 8.00),
    (4, 3, 104, 1, 20.00),
    (5, 3, 105, 4, 12.00),
    (6, 4, 101, 2, 10.00),
    (7, 4, 104, 3, 20.00);


   
CREATE TABLE Customerss (
    customer_id INT,
    customer_name VARCHAR(255)
);


INSERT INTO Customerss (customer_id, customer_name)
VALUES
    (1, 'Customer A'),
    (2, 'Customer B'),
    (3, 'Customer C'),
    (4, 'Customer D');


    SELECT
    c.customer_name,
    SUM(oi.quantity * oi.unit_price) AS total_purchase_amount
FROM
    Customerss c
JOIN
    Order_Items oi ON c.customer_id = (SELECT DISTINCT order_id FROM Order_Items WHERE order_id = c.customer_id)
GROUP BY
    c.customer_name
ORDER BY
    total_purchase_amount DESC
LIMIT 5;


