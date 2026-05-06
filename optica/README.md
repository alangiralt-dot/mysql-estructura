# Optics Database - "Cul d'Ampolla"

This project contains the relational data model for an optics shop, developed as part of the IT Academy MySQL Data Structure task (S2.01).

## Business Logic & Features

The database is designed to manage the complex relationships of an eyewear retail business:

- **Supplier & Brand Management**: Implements a One-to-Many relationship where each supplier can provide multiple brands, but each brand belongs to a single supplier.
- **Granular Addresses**: Supplier addresses are normalized into a dedicated table to handle specific attributes (Street, Number, Floor, Door, City, Postal Code, and Country).
- **Product Specifications**: The `glasses` table stores technical details including prescriptions (using `DECIMAL(4,2)` for precision), frame types (using `ENUM`), and lens colors.
- **Financial Precision**: Uses `DECIMAL(8,4)` for both wholesale costs and retail sale prices to ensure calculation accuracy and prevent rounding errors.
- **Customer Recommendations**: Implements a **Self-Referencing Relationship** (Recursive) to track which customer recommended a new client to the shop.
- **Soft Delete Pattern**: The `customers` table includes an `is_active` boolean to preserve historical recommendation data even if a customer is no longer active.
- **Sales Tracking**: Links Employees, Customers, and Products through an `orders` and `details` structure, allowing for many-to-many sales transactions.

## Database Schema

The schema consists of the following entities:
- `suppliers` & `addresses` (1:1)
- `suppliers` & `brands` (1:N)
- `brands` & `glasses` (1:N)
- `customers` (Self-referencing 1:N)
- `employees`
- `orders` & `details` (N:M via Junction Table)

## Instructions

To set up the database:
1. Ensure you have a MySQL/MariaDB server running.
2. Run the `optics.sql` script to create the schema and load the sample data.
