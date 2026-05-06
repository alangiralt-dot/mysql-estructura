CREATE TABLE suppliers(
  supplier_id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  fax VARCHAR(20) NULL DEFAULT NULL,
  nif CHAR(9) UNIQUE NOT NULL,
  PRIMARY KEY(supplier_id)
);
-- one-to-many
CREATE TABLE brands(
  brand_id INT NOT NULL AUTO_INCREMENT,
  supplier_id INT NOT NULL,
  name VARCHAR(50) UNIQUE,
  PRIMARY KEY(brand_id),
  CONSTRAINT fk_brands_supplier FOREIGN KEY(supplier_id) REFERENCES suppliers(supplier_id)
);
-- one-to-many
CREATE TABLE glasses(
  glass_id INT NOT NULL AUTO_INCREMENT,
  brand_id INT NOT NULL,
  model VARCHAR(50) NOT NULL,
  prescription_left DECIMAL(4,2) NOT NULL,
  prescription_right DECIMAL(4,2) NOT NULL,
  frame_type ENUM('Frameless', 'Acetate', 'Metallic'),
  frame_color VARCHAR(20) NOT NULL,
  left_lens_color VARCHAR(20) NOT NULL,
  right_lens_color VARCHAR(20) NOT NULL,
  cost_unit_price DECIMAL(8,4) NOT NULL,
  stock TINYINT NOT NULL,
  PRIMARY KEY(glass_id),
  CONSTRAINT fk_glasses_brands FOREIGN KEY(brand_id) REFERENCES brands(brand_id)
);
-- one-to-one
CREATE TABLE addresses(
  address_id INT NOT NULL AUTO_INCREMENT,
  supplier_id INT UNIQUE NOT NULL,
  street VARCHAR(50) NOT NULL,
  address_number VARCHAR(10) NOT NULL,
  address_floor VARCHAR(10) NULL,
  door VARCHAR(10) NULL,
  city VARCHAR(50) NOT NULL,
  postal_code VARCHAR(10) NOT NULL,
  country CHAR(2) NOT NULL,
  PRIMARY KEY(address_id),
  CONSTRAINT fk_addresses_suppliers FOREIGN KEY(supplier_id) REFERENCES suppliers(supplier_id)
);
-- self-referencing
CREATE TABLE customers(
  customer_id INT NOT NULL AUTO_INCREMENT,
  recommended_by_id INT NULL,
  is_active BOOLEAN NOT NULL,
  name VARCHAR(50) NOT NULL,
  postal_code VARCHAR(10) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  registered_at DATE NOT NULL,
  PRIMARY KEY(customer_id),
  CONSTRAINT fk_customers_customers FOREIGN KEY(recommended_by_id) REFERENCES customers(customer_id)
);
CREATE TABLE employees(
  employee_id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  PRIMARY KEY(employee_id)
);
-- many-to-many
CREATE TABLE orders(
  order_id INT NOT NULL AUTO_INCREMENT,
  employee_id INT NOT NULL,
  customer_id INT NOT NULL,
  ordered_at DATETIME NOT NULL,
  PRIMARY KEY(order_id),
  CONSTRAINT fk_orders_employees FOREIGN KEY(employee_id) REFERENCES employees(employee_id),
  CONSTRAINT fk_orders_customers FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);
-- many-to-many
CREATE TABLE details(
  order_id INT NOT NULL,
  glass_id INT NOT NULL,
  quantity INT NOT NULL,
  sale_unit_price DECIMAL(8,4) NOT NULL,
  PRIMARY KEY(order_id, glass_id),
  CONSTRAINT fk_details_orders FOREIGN KEY(order_id) REFERENCES orders(order_id),
  CONSTRAINT fk_details_glasses FOREIGN KEY(glass_id) REFERENCES glasses(glass_id)
);
