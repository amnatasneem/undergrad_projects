DROP SCHEMA if exists bumper2burger;
CREATE SCHEMA bumper2burger;
USE bumper2burger;

CREATE TABLE employee (
	emp_server_id varchar(25) NOT NULL PRIMARY KEY,
	first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    date_of_birth date NOT NULL,
    date_of_hire date NOT NULL,
    hourly_rate double NOT NULL,
    roles tinytext NOT NULL,
    phone_number bigint NOT NULL,
    address tinytext NOT NULL
);
INSERT INTO employee
VALUES ("Amna T", "Amna", "Tasneem", '2000-05-10', '2021-08-10', 13.00, "Customer Service Representative", 6304923517, "7451 Stonewater Drive, Bolingbrook, IL, 60490");
INSERT INTO employee
VALUES ("Gabe C", "Gabe", "Collins", '1999-04-05', '2021-11-19', 15.00, "Customer Service Representative, Frier", 6301234567, "2849 Glendale Drive, Naperville, IL, 60564");
INSERT INTO employee
VALUES ("Chris H", "Chris", "Huston", '1973-08-30', '2021-07-05', 22.00, "Assistant Manager, Chef", 6309876543, "1801 N Eola Rd, Aurora, IL 60502");

CREATE TABLE menu_item (
	menu_item_id tinytext NOT NULL,
    price double NOT NULL,
    ingredient longtext NOT NULL,
    container_type tinytext NOT NULL
);
-- -----------------------------------------------------------------------

INSERT INTO menu_item
VALUES ("Bumper 2 Burger", 6.73, "Potato Roll", "Burger Box");
INSERT INTO menu_item
VALUES ("Bumper 2 Burger", 6.73, "Quarter Pound Beef Patty", "Burger Box");
INSERT INTO menu_item
VALUES ("Bumper 2 Burger", 6.73, "Lettuce", "Burger Box");
INSERT INTO menu_item
VALUES ("Bumper 2 Burger", 6.73, "Tomatoes", "Burger Box");
INSERT INTO menu_item
VALUES ("Bumper 2 Burger", 6.73, "Onions", "Burger Box");
INSERT INTO menu_item
VALUES ("Bumper 2 Burger", 6.73, "Pickles", "Burger Box");
INSERT INTO menu_item
VALUES ("Bumper 2 Burger", 6.73, "American Cheese", "Burger Box");
INSERT INTO menu_item
VALUES ("Bumper 2 Burger", 6.73, "Bumper Sauce", "Burger Box");
INSERT INTO menu_item
VALUES ("Philly Steak Sandwich", 11.94, "8-Inch Hinged Sub Bread", "99HT1R Boxes");
INSERT INTO menu_item
VALUES ("Philly Steak Sandwich", 11.94, "Rib Eye Steak", "99HT1R Boxes");
INSERT INTO menu_item
VALUES ("Philly Steak Sandwich", 11.94, "Onions", "99HT1R Boxes");
INSERT INTO menu_item
VALUES ("Philly Steak Sandwich", 11.94, "Green Peppers", "99HT1R Boxes");
INSERT INTO menu_item
VALUES ("Philly Steak Sandwich", 11.94, "Mushrooms", "99HT1R Boxes");
INSERT INTO menu_item
VALUES ("Philly Steak Sandwich", 11.94, "Provolone Cheese", "99HT1R Boxes");
INSERT INTO menu_item
VALUES ("Chicago Bumper", 3.34, "Hot Dog Bun", "Hot Dog Box");
INSERT INTO menu_item
VALUES ("Chicago Bumper", 3.34, "Beef Dog", "Hot Dog Box");
INSERT INTO menu_item
VALUES ("Chicago Bumper", 3.34, "Mustard", "Hot Dog Box");
INSERT INTO menu_item
VALUES ("Chicago Bumper", 3.34, "Onions", "Hot Dog Box");
INSERT INTO menu_item
VALUES ("Chicago Bumper", 3.34, "Tomatoes", "Hot Dog Box");
INSERT INTO menu_item
VALUES ("Chicago Bumper", 3.34, "Relish", "Hot Dog Box");
INSERT INTO menu_item
VALUES ("Chicago Bumper", 3.34, "Sport Peppers", "Hot Dog Box");
INSERT INTO menu_item
VALUES ("Chicago Bumper", 3.34, "Celery Salt", "Hot Dog Box");
INSERT INTO menu_item
VALUES ("Plain, Seasoned, or Salted Fries", 2.99, "Potato", "12 or 16 Ounce Fry Cup");

-- -----------------------------------------------------------------------

CREATE TABLE ingredient (
	ingredient_id tinytext NOT NULL, 
	storing_requirement tinytext NOT NULL,
	preparation boolean NOT NULL, 
	supplier tinytext NOT NULL, 
    food_group_type tinytext
);

INSERT INTO ingredient
VALUES ("8-Inch Hinged Sub Bread", "Room Temperature", false, "Martin's Famous Potato Rolls and Bread", "Bread");
INSERT INTO ingredient
VALUES("Tomato", "Cooler", true, "U.S. Foods", "Vegetable");
INSERT INTO ingredient
VALUES("Corfu Medium Gyro Cone", "Freezer", true, "Corfu Foods", "Meat");
INSERT INTO ingredient
VALUES("Potato", "Room Temperature", true, "U.S. Foods", "Vegetable");
-- -----------------------------------------------------------------------

CREATE TABLE customer_order (
	order_id smallint NOT NULL,
    server varchar(25) NOT NULL,
    total double NOT NULL,
    special_request tinytext,
    discount_percentage tinyint,
    menu_items longtext NOT NULL
);
INSERT INTO customer_order
VALUES (16, "Amna T", 12.34, "Cut in Half", null, "Bumper Burger with Everything, Regular Combo with Coke and Seasoned Fries");
INSERT INTO customer_order
VALUES (89, "Gabe C", 9.73, null, null, "Bumper 2 Burger with Everything and Grilled Onions and Grilled Jalapenos");
INSERT INTO customer_order
VALUES (57, "Amna T", 4.39, null, 50, "Philly Chicken Sandwich with Everything");
-- -----------------------------------------------------------------------

CREATE TABLE phone_order (
	order_id tinyint NOT NULL,
    payment_method tinytext NOT NULL,
    customer_name varchar(50), 
    phone_number bigint
);
INSERT INTO phone_order
VALUES (16, "Over Phone", "Chris Rock", 3319638521);
INSERT INTO phone_order
VALUES (90, "In Person", "Will Smith", 8968527410);
INSERT INTO phone_order
VALUES (68, "Over Phone", "George Washington", 6317894561);
-- -----------------------------------------------------------------------
CREATE TABLE container (
	container_id varchar(40) not null unique,
    can_contain tinytext,
    supplier tinytext,
    kitchen_placement_location tinytext);
INSERT INTO container
VALUES ("205 Box", "Grilled Cheese Sandwiches and Gyro Sandwiches", "Genpak", "End of Sandwich Line");
INSERT INTO container
VALUES ("#8 Bag", "Fries in 12 or 16 Ounce Fry Cup", "Genpak", "Fry Station");
INSERT INTO container
VALUES ("10-Inch X 7-Inch X 12-Inch Bag", "Various Combinations of Orders", "Genpak", "End of Sandwich Line");
INSERT INTO container
VALUES ("12 or 16 Ounce Fry Cup", "Fries", "Genpak", "Fry Station");

-----------------------------------------------------------------------
-- JOIN 
-- displays orders taken by various employees
SELECT customer_order.server, customer_order.order_id
FROM employee
JOIN customer_order ON employee.emp_server_id = customer_order.server;

-- JOIN
-- shows which employees took phone orders 
SELECT customer_order.order_id, customer_order.server
FROM phone_order
JOIN customer_order ON customer_order.order_id = phone_order.order_id;

-- JOIN
-- shows the suppliers of the menu items' ingredients
SELECT ingredient.supplier, ingredient.ingredient_id
FROM ingredient
JOIN menu_item ON menu_item.ingredient = ingredient.ingredient_id;

-- JOIN
-- shows the ingredients which are always on the menu items which need to be prepared before being used
-- (i.e. grilled jalapenos are an optional additional topping so it is not used as often as the standard ingredients)
SELECT menu_item.ingredient
FROM ingredient
JOIN menu_item ON menu_item.ingredient = ingredient.ingredient_id
WHERE ingredient.preparation = true;

-- JOIN
-- shows where the containers for specific menu items are located in the kitchen
SELECT container.kitchen_placement_location, menu_item.menu_item_id
FROM container
JOIN  menu_item ON menu_item.container_type = container.container_id
WHERE menu_item.menu_item_id = "Plain, Seasoned, or Salted Fries";

-- AGGREGATE FUNCTION
-- shows largest order in terms of monetary value
SELECT max(total)
FROM customer_order;

-- AGGREGATE FUNCTION
-- shows how much a specific server/ cashier brought in 
SELECT sum(total)
FROM customer_order
WHERE customer_order.server = "Amna T";

-- AGGREGATE FUNCTION
-- shows who is giving away large discounts to customers
SELECT count(discount_percentage), customer_order.server
FROM customer_order
WHERE discount_percentage = 50
AND customer_order.server = "Amna T";

-- SUBQUERY
-- shows which menu items cost below the average price of menu items
SELECT DISTINCT menu_item.menu_item_id
FROM menu_item
WHERE price < (
    SELECT avg(price)
    FROM menu_item
);

-- SUBQUERY
-- shows employees who earn more than the average
SELECT employee.emp_server_id, employee.hourly_rate
FROM employee
WHERE hourly_rate > (
    SELECT avg(hourly_rate)
    FROM employee
);

-- SUBQUERY
-- shows menu items with maximum cost
SELECT DISTINCT menu_item.menu_item_id, menu_item.price
FROM menu_item
WHERE price = (SELECT max(price) FROM menu_item);

-- MISC
-- shows the range of hourly rates of employees hired in 2021
SELECT max(hourly_rate), min(hourly_rate)
FROM employee
WHERE year(employee.date_of_hire) = 2021;

-- MISC
-- displays contact information for all of the employees
SELECT employee.emp_server_id, employee.phone_number
FROM employee;

-- MISC
-- returns the number of employees at the restaurant
SELECT count(employee.emp_server_id)
FROM employee;

-- MISC
-- shows the payment method preference of customers who have phone orders
SELECT payment_method, count(payment_method)
FROM phone_order GROUP BY payment_method;

-- MISC
-- shows which ingredients need to be stored away as soon as possible
SELECT ingredient.ingredient_id
FROM ingredient
WHERE ingredient.storing_requirement != "Room Temperature";
