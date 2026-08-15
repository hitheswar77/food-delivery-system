-- Insert 4 new restaurants for Yeswanthpur
INSERT INTO Restaurants (name, location) VALUES
('Maharaja Biryani', 'Yeswanthpur'),
('Paneer Express', 'Yeswanthpur'),
('South Indian Cafe', 'Yeswanthpur'),
('Kabab House', 'Yeswanthpur');

-- Insert 3 menu items for Maharaja Biryani (ID 54)
INSERT INTO Menu_Items (restaurant_id, item_name, price) VALUES
(54, 'Hyderabadi Biryani', 320),
(54, 'Chicken Biryani', 280),
(54, 'Vegetable Biryani', 220);

-- Insert 3 menu items for Paneer Express (ID 55)
INSERT INTO Menu_Items (restaurant_id, item_name, price) VALUES
(55, 'Paneer Tikka', 240),
(55, 'Chilli Paneer', 260),
(55, 'Paneer Butter Masala', 280);

-- Insert 3 menu items for South Indian Cafe (ID 56)
INSERT INTO Menu_Items (restaurant_id, item_name, price) VALUES
(56, 'Masala Dosa', 150),
(56, 'Idli Sambar', 120),
(56, 'Vada Pav', 80);

-- Insert 3 menu items for Kabab House (ID 57)
INSERT INTO Menu_Items (restaurant_id, item_name, price) VALUES
(57, 'Sheekh Kabab', 320),
(57, 'Chicken Shami Kabab', 280),
(57, 'Seekh Paratha Roll', 240);
