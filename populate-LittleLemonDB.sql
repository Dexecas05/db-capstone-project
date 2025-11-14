INSERT INTO Customers (first_name, last_name, phone, email, address) VALUES
('Alice','Johnson','555-1001','alice.johnson@example.com','123 Maple Street'),
('Bruno','Silva','555-1002','bruno.silva@example.com','456 Oak Avenue'),
('Carla','Mendes','555-1003','carla.mendes@example.com','789 Pine Road'),
('Diego','Fernandez','555-1004','diego.fernandez@example.com','321 Birch Lane'),
('Eva','Martinez','555-1005','eva.martinez@example.com','654 Cedar Blvd'),
('Felipe','Costa','555-1006','felipe.costa@example.com','987 Walnut Drive'),
('Grace','Lee','555-1007','grace.lee@example.com','741 Cherry Street'),
('Henry','Brown','555-1008','henry.brown@example.com','852 Spruce Court'),
('Isabel','Garcia','555-1009','isabel.garcia@example.com','963 Palm Road'),
('Jack','Wilson','555-1010','jack.wilson@example.com','159 Elm Street'),
('Karen','Lopez','555-1011','karen.lopez@example.com','753 Fir Avenue'),
('Luis','Torres','555-1012','luis.torres@example.com','357 Cypress Lane'),
('Marta','Ramos','555-1013','marta.ramos@example.com','951 Poplar Drive'),
('Nina','Hughes','555-1014','nina.hughes@example.com','258 Willow Street'),
('Oscar','Diaz','555-1015','oscar.diaz@example.com','654 Redwood Blvd'),
('Paula','Santos','555-1016','paula.santos@example.com','852 Magnolia Court'),
('Quentin','Taylor','555-1017','quentin.taylor@example.com','753 Ash Avenue'),
('Rosa','Almeida','555-1018','rosa.almeida@example.com','357 Olive Lane'),
('Samuel','Clark','555-1019','samuel.clark@example.com','951 Palm Drive'),
('Teresa','Nguyen','555-1020','teresa.nguyen@example.com','258 Birch Street');

INSERT INTO Bookings (booking_date, table_number, customer_id) VALUES
('2025-11-01',1,1),('2025-11-02',2,2),('2025-11-03',3,3),('2025-11-04',4,4),
('2025-11-05',5,5),('2025-11-06',6,6),('2025-11-07',7,7),('2025-11-08',8,8),
('2025-11-09',9,9),('2025-11-10',10,10),('2025-11-11',11,11),('2025-11-12',12,12),
('2025-11-13',13,13),('2025-11-14',14,14),('2025-11-15',15,15),('2025-11-16',16,16),
('2025-11-17',17,17),('2025-11-18',18,18),('2025-11-19',19,19),('2025-11-20',20,20);

INSERT INTO Staff (first_name, last_name, role, salary) VALUES
('Maria','Gonzalez','Waiter',2500.00),('John','Smith','Chef',4000.00),
('Laura','Martins','Manager',5000.00),('Pedro','Costa','Waiter',2600.00),
('Sofia','Reyes','Chef',4200.00),('Daniel','Kim','Waiter',2550.00),
('Ana','Silva','Manager',5100.00),('George','White','Chef',4100.00),
('Helena','Brown','Waiter',2450.00),('Igor','Petrov','Chef',4300.00),
('Julia','Torres','Waiter',2500.00),('Kevin','Johnson','Chef',4050.00),
('Lara','Mendes','Manager',5200.00),('Miguel','Santos','Waiter',2600.00),
('Nora','Hughes','Chef',4150.00),('Oliver','Clark','Waiter',2550.00),
('Patricia','Nguyen','Manager',5300.00),('Ricardo','Almeida','Chef',4250.00),
('Sara','Taylor','Waiter',2500.00),('Tom','Lopez','Chef',4000.00);


INSERT INTO Orders (order_date, quantity, total_cost, customer_id, staff_id) VALUES
('2025-11-01',2,30.00,1,1),('2025-11-02',3,45.00,2,2),('2025-11-03',1,15.00,3,3),
('2025-11-04',4,60.00,4,4),('2025-11-05',2,40.00,5,5),('2025-11-06',3,75.00,6,6),
('2025-11-07',1,20.00,7,7),('2025-11-08',2,50.00,8,8),('2025-11-09',3,200.00,9,9),
('2025-11-10',2,35.00,10,10),('2025-11-11',4,220.00,11,11),('2025-11-12',1,25.00,12,12),
('2025-11-13',2,55.00,13,13),('2025-11-14',3,80.00,14,14),('2025-11-15',1,18.00,15,15),
('2025-11-16',2,48.00,16,16),('2025-11-17',3,70.00,17,17),('2025-11-18',1,22.00,18,18),
('2025-11-19',2,60.00,19,19),('2025-11-20',4,155.00,20,20);


INSERT INTO Order_Delivery_Status (delivery_date, status, order_id) VALUES
('2025-11-01','Delivered',1),('2025-11-02','Preparing',2),('2025-11-03','Pending',3),
('2025-11-04','Cancelled',4),('2025-11-05','Delivered',5),('2025-11-06','Preparing',6),
('2025-11-07','Pending',7),('2025-11-08','Delivered',8),('2025-11-09','Cancelled',9),
('2025-11-10','Delivered',10),('2025-11-11','Preparing',11),('2025-11-12','Pending',12),
('2025-11-13','Delivered',13),('2025-11-14','Cancelled',14),('2025-11-15','Delivered',15),
('2025-11-16','Preparing',16),('2025-11-17','Pending',17),('2025-11-18','Delivered',18),
('2025-11-19','Cancelled',19),('2025-11-20','Delivered',20);

INSERT INTO Menu (item_name, category, price) VALUES
('Margherita Pizza','Cuisine',5.00),('Caesar Salad','Starter',18.50),
('Grilled Salmon','Course',220.00),('Red Wine','Drink',120.00),
('Chocolate Cake','Dessert',27.00),('Spaghetti Carbonara','Cuisine',65.00),
('Bruschetta','Starter',6.50),('Beef Steak','Course',75.00),
('White Wine','Drink',110.00),('Tiramisu','Dessert',8.00),
('Lasagna','Cuisine',65.00),('Garlic Bread','Starter',5.00),
('Chicken Curry','Course',80.00),('Beer','Drink',6.00),
('Ice Cream','Dessert',15.50),('Risotto','Cuisine',21.00),
('Soup of the Day','Starter',50.00),('Lamb Chops','Course',250.00),
('Cocktail','Drink',10.00),('Cheesecake','Dessert',7.50);

INSERT INTO Order_Menu (order_id, menu_item_id) VALUES
(1, 1),   -- Margherita Pizza
(2, 3),   -- Grilled Salmon
(3, 2),   -- Caesar Salad
(4, 8),   -- Beef Steak
(5, 6),   -- Spaghetti Carbonara
(6, 11),  -- Lasagna
(7, 4),   -- Red Wine
(8, 9),   -- White Wine
(9, 18),  -- Lamb Chops
(10, 10), -- Tiramisu
(11, 7),  -- Bruschetta
(12, 12), -- Garlic Bread
(13, 16), -- Risotto
(14, 19), -- Cocktail
(15, 15), -- Ice Cream
(16, 3),  -- Grilled Salmon
(17, 5),  -- Chocolate Cake
(18, 20), -- Cheesecake
(19, 13), -- Chicken Curry
(20, 17); -- Soup of the Day