-- Create food_delivery database if it doesn't exist
CREATE DATABASE IF NOT EXISTS food_delivery;
USE food_delivery;

-- Create Users table
CREATE TABLE IF NOT EXISTS Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Restaurants table
CREATE TABLE IF NOT EXISTS Restaurants (
    restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Menu Items table
CREATE TABLE IF NOT EXISTS Menu_Items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    description VARCHAR(255),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Orders table
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    item_id INT NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id),
    FOREIGN KEY (item_id) REFERENCES Menu_Items(item_id)
);

-- Create Reviews table
CREATE TABLE IF NOT EXISTS Reviews (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    rating INT NOT NULL,
    review_text VARCHAR(500),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

-- Insert sample data
INSERT INTO Restaurants (name, location) VALUES 
    ('Pizza Palace', 'Downtown'),
    ('Burger Barn', 'Midtown'),
    ('Sushi Spot', 'Uptown');

INSERT INTO Menu_Items (restaurant_id, name, price, description) VALUES 
    (1, 'Margherita Pizza', 250, 'Classic cheese pizza'),
    (1, 'Pepperoni Pizza', 300, 'Pizza with pepperoni'),
    (2, 'Classic Burger', 180, 'Beef burger'),
    (2, 'Cheese Burger', 200, 'Burger with extra cheese'),
    (3, 'California Roll', 350, 'Sushi roll with crab'),
    (3, 'Salmon Roll', 400, 'Fresh salmon sushi');
