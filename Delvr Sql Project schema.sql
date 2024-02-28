-- Table for Employees
CREATE TABLE employees (
    id INT AUTO_INCREMENT,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    email VARCHAR(40) NOT NULL,
    phone_number BIGINT,
    birth_date DATE,
    salary INT,
    job_id INT,
    super_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (super_id) REFERENCES employees (id) ON DELETE SET NULL
);

-- Table for Department
CREATE TABLE department (
    id INT AUTO_INCREMENT,
    job_class VARCHAR(40) NOT NULL,
    mgr_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (mgr_id) REFERENCES employees (id) ON DELETE SET NULL
);

-- Table for Customers
CREATE TABLE customers (
    id INT AUTO_INCREMENT,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    email VARCHAR(40) NOT NULL,
    phone_number BIGINT,
    address VARCHAR(100),
    PRIMARY KEY (id)
);

-- Table for Meals
CREATE TABLE meals (
    id INT AUTO_INCREMENT,
    meal VARCHAR(100),
    meal_price DECIMAL(8,2),
    PRIMARY KEY (id)
);

-- Table for Promotions
CREATE TABLE promotions (
    id INT AUTO_INCREMENT,
    promotion_name VARCHAR(50) NOT NULL,
    discount DECIMAL(5,2),
    start_date DATE,
    end_date DATE,
    PRIMARY KEY (id)
);

-- Table for Meal Promotions
CREATE TABLE meal_promotions (
    meal_id INT,
    promotion_id INT,
    discount DECIMAL(5,2),
    discounted_price DECIMAL(8,2), -- Adding discounted_price column
    PRIMARY KEY (meal_id, promotion_id),
    FOREIGN KEY (meal_id) REFERENCES meals (id) ON DELETE CASCADE,
    FOREIGN KEY (promotion_id) REFERENCES promotions (id) ON DELETE CASCADE
);


-- Table for Orders
CREATE TABLE orders (
    id INT AUTO_INCREMENT,
    order_date DATE,
    customer_id INT,
    meal_id INT,
    meal_quantity INT,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE SET NULL,
    FOREIGN KEY (meal_id) REFERENCES meals (id) ON DELETE SET NULL
);


-- Table for Reviews
CREATE TABLE reviews (
    customer_id INT,
    order_id INT,
    rating INT,
    review_text TEXT,
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (customer_id, order_id),
    FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE CASCADE,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE
);

-- Table for Deliveries
CREATE TABLE deliveries (
    id INT AUTO_INCREMENT,
    order_id INT,
    delivery_date DATE,
    delivery_person_id INT,
    delivery_status VARCHAR(20),
    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES orders (id) ON DELETE SET NULL,
    FOREIGN KEY (delivery_person_id) REFERENCES employees (id) ON DELETE SET NULL
);

'''
-- Table for Customer Loyalty Program
CREATE TABLE loyalty_program (
    customer_id INT,
    points INT,
    PRIMARY KEY (customer_id),
    FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE CASCADE
);

'''

-- Table for Stock
CREATE TABLE stock (
	id INT,
	stock_name VARCHAR(40),
	stocked_quantity INT,
    stocking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (stock_id)
);

-- Table for stock Suppliers
CREATE TABLE stock_suppliers (
    id INT AUTO_INCREMENT,
    supplier_name VARCHAR(50) NOT NULL,
    contact_number BIGINT,
    email VARCHAR(40),
    stock_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (stock_id) REFERENCES stock (id)
);


'''
--VISUALIZATION
-- Table for Date Dimension
CREATE TABLE date_dimension (
    date_id INT AUTO_INCREMENT,
    date DATE,
    day_of_week INT,
    month INT,
    year INT,
    PRIMARY KEY (date_id)
);

'''


--trigger to automatically update meal prices and discounted prices
DELIMITER //

CREATE TRIGGER update_meal_promotion
AFTER INSERT ON meal_promotions
FOR EACH ROW
BEGIN
    DECLARE meal_price DECIMAL(8,2);
    
    -- Retrieves the meal price based on the meal_id
    SELECT meal_price INTO meal_price
    FROM meals
    WHERE id = NEW.meal_id;
    
    -- Calculates the discounted price based on the meal price and promotion discount
    SET NEW.discounted_price = meal_price - (meal_price * (NEW.discount / 100));
    
    -- Updates the meal price in the meals table
    UPDATE meals
    SET meal_price = NEW.discounted_price
    WHERE id = NEW.meal_id;
END //

DELIMITER ;