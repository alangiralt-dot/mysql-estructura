CREATE TABLE dark_kitchens(
  dark_kitchen_id INT NOT NULL AUTO_INCREMENT,
  phone VARCHAR(20) NOT NULL,
  street VARCHAR(50) NOT NULL,
  address_number VARCHAR(10) NOT NULL,
  address_floor VARCHAR(10) DEFAULT NULL,
  door VARCHAR(10) DEFAULT NULL,
  city_id INT NOT NULL,
  postal_code VARCHAR(10) NOT NULL,
  PRIMARY KEY(dark_kitchen_id),
  CONSTRAINT fk_dark_kitchens_cities FOREIGN KEY(city_id) REFERENCES cities(city_id)
);
CREATE TABLE cities(
  city_id INT NOT NULL AUTO_INCREMENT,
  city VARCHAR(50) NOT NULL,
  province_id INT NOT NULL,
  PRIMARY KEY(city_id),
  CONSTRAINT fk_cities_provinces FOREIGN KEY(province_id) REFERENCES provinces(province_id)
);
CREATE TABLE provinces(
  province_id INT NOT NULL AUTO_INCREMENT,
  province VARCHAR(50) NOT NULL,
  PRIMARY KEY(province_id)
);
CREATE TABLE customers(
  customer_id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  street VARCHAR(50) NOT NULL,
  address_number VARCHAR(10) NOT NULL,
  address_floor VARCHAR(10) DEFAULT NULL,
  door VARCHAR(10) DEFAULT NULL,
  city_id INT NOT NULL,
  postal_code VARCHAR(10) NOT NULL,
  PRIMARY KEY(customer_id),
  CONSTRAINT fk_customers_cities FOREIGN KEY(city_id) REFERENCES cities(city_id)
);
CREATE TABLE employees(
  employee_id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  national_id VARCHAR(15) UNIQUE NOT NULL,
  phone VARCHAR(20) NOT NULL,
  role ENUM('delivery person', 'cook'),
  dark_kitchen_id INT NOT NULL,
  PRIMARY KEY(employee_id),
  CONSTRAINT fk_employees_dark_kitchens FOREIGN KEY(dark_kitchen_id) REFERENCES dark_kitchens(dark_kitchen_id)
);
CREATE TABLE orders(
  order_id INT NOT NULL AUTO_INCREMENT,
  ordered_at DATETIME NOT NULL,
  customer_id INT NOT NULL,
  dark_kitchen_id INT NOT NULL,
  PRIMARY KEY(order_id),
  CONSTRAINT fk_orders_customers FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
  CONSTRAINT fk_orders_dark_kitchens FOREIGN KEY(dark_kitchen_id) REFERENCES dark_kitchens(dark_kitchen_id)
);
CREATE TABLE deliveries(
  delivery_id INT NOT NULL AUTO_INCREMENT,
  delivered_at DATETIME NOT NULL,
  order_id INT UNIQUE NOT NULL,
  employee_id INT NOT NULL,
  PRIMARY KEY(delivery_id),
  CONSTRAINT fk_deliveries_orders FOREIGN KEY(order_id) REFERENCES orders(order_id),
  CONSTRAINT fk_deliveries_employees FOREIGN KEY(employee_id) REFERENCES employees(employee_id)
);
CREATE TABLE details(
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  sale_unit_price DECIMAL(7,4) NOT NULL,
  PRIMARY KEY(order_id, product_id),
  CONSTRAINT fk_details_orders FOREIGN KEY(order_id) REFERENCES orders(order_id),
  CONSTRAINT fk_details_products FOREIGN KEY(product_id) REFERENCES products(product_id)
);
CREATE TABLE categories(
  category_id INT NOT NULL AUTO_INCREMENT,
  category VARCHAR(50) NOT NULL,
  PRIMARY KEY(category_id)
);
CREATE TABLE products(
  product_id INT NOT NULL AUTO_INCREMENT,
  category_id INT NOT NULL,
  cost_unit_price DECIMAL(7,4) NOT NULL,
  name VARCHAR(50) NOT NULL,
  description VARCHAR(255) NOT NULL,
  image_path VARCHAR(255) NOT NULL,
  PRIMARY KEY(product_id),
  CONSTRAINT fk_products_categories FOREIGN KEY(category_id) REFERENCES categories(category_id)
);
CREATE TABLE tags(
  tag_id INT NOT NULL AUTO_INCREMENT,
  tag VARCHAR(50) NOT NULL,
  PRIMARY KEY(tag_id)
);
CREATE TABLE products_tags(
  product_id INT NOT NULL,
  tag_id INT NOT NULL,
  PRIMARY KEY(product_id, tag_id),
  CONSTRAINT fk_products_tags_products FOREIGN KEY(product_id) REFERENCES products(product_id),
  CONSTRAINT fk_products_tags_tags FOREIGN KEY(tag_id) REFERENCES tags(tag_id)
);