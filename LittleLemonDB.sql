use littlelemondb;

-- 1. Customers table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(20) UNIQUE,
    email VARCHAR(100) UNIQUE,
    address VARCHAR(255)
);

-- Bookings table
CREATE TABLE Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_date DATE NOT NULL,
    table_number INT NOT NULL,
    customer_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 3. Staff table
CREATE TABLE Staff (
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    role VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL
);

-- 4. Orders table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE NOT NULL,
    quantity INT CHECK (quantity > 0),
    total_cost DECIMAL(10,2) NOT NULL,
    customer_id INT NOT NULL,
    staff_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
);

-- 5. Order Delivery Status table
CREATE TABLE Order_Delivery_Status (
    delivery_id INT AUTO_INCREMENT PRIMARY KEY,
    delivery_date DATE,
    status ENUM('Pending','Preparing','Delivered','Cancelled') NOT NULL,
    order_id INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- 6. Menu table
CREATE TABLE Menu (
    menu_item_id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    category ENUM('Cuisine','Starter','Course','Drink','Dessert') NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

-- 7. Order_Menu junction table
CREATE TABLE Order_Menu (
    order_id INT NOT NULL,
    menu_item_id INT NOT NULL,
    PRIMARY KEY (order_id, menu_item_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (menu_item_id) REFERENCES Menu(menu_item_id)
);
