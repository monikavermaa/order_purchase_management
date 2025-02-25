Order Management System
This application provides a comprehensive order management system, allowing users to create orders, manage order items, and calculate total amounts and taxes. The system is built using Ruby on Rails and follows best practices for model relationships, validations, and callbacks.

Features
Order Creation: Users can create new orders with associated order items.
Order Item Management: Each order can have multiple items, each with a SKU code, quantity, and price.
Total Amount Calculation: The system automatically calculates the total amount for each order based on its items.
Tax Calculation: An 8% tax is applied to the total amount of each order.
Requirements
Ruby Version: 3.4.1
Rails Version: 8.0.1
Database: mysql
Setup
Clone the Repository:

git clone https://github.com/monikavermaa/company_tasks_management

cd order_management_system
Install Dependencies:

bundle install
Set Up the Database:
rails db:create
rails db:migrate
rails db:seed

rails server
