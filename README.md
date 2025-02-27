**Order Purchase Management** 

Created A application which could be easily setup on linux and also on windows with the help of docker.
 
In this project, I have integrated a third-party API to retrieve location information based on postal codes and display it on the user interface. I have written RSpec tests to ensure the functionality works as expected. 

Additionally, I have created seed data for the PrefectureCode and SoukoZaiko models.
A dashboard has been implemented to display PrefectureCode, SoukoZaiko, and the user's orders. Devise authentication has been integrated, and corresponding RSpec tests have been written to verify the authentication process.

The SoukoZaiko is displayed in a dropdown when creating an order, but only for items with a quantity greater than zero.
The total price of an order is calculated based on the quantities of the order items and the tax rate. Currently, the tax rate is set to zero, but it can be adjusted as needed.

**Order Management System**

This application provides a comprehensive order management system, allowing users to create orders, manage order items, and calculate total amounts and taxes.
The system is built using Ruby on Rails and follows best practices for model relationships, validations, and callbacks.

**Features**

**Order Creation**: Users can create new orders with associated order items.

**Order Item Management**: Each order can have multiple items, each with a SKU code, quantity, and price.

**Total Amount Calculation**: The system automatically calculates the total amount for each order based on its items.

**Tax Calculation**: An 8% tax is applied to the total amount of each order.


**Requirement**

Ruby Version: **3.4.1**

Rails Version: **8.0.1**

Database: **mysql**

Setup

Clone the Repository:

**git clone https://github.com/monikavermaa/company_tasks_management**

**cd order_management_system**

Install Dependencies:

**bundle install**

Set Up the Database:
**rails db:create**

**rails db:migrate**

**rails db:seed**

**rails server**
