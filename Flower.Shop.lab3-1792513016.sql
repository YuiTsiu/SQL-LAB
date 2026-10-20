CREATE TABLE IF NOT EXISTS `Store` (
	`store_id` int AUTO_INCREMENT NOT NULL,
	`store_name` varchar(40) NOT NULL,
	`store_type` varchar(10) NOT NULL,
	`city` varchar(30) NOT NULL,
	`street` varchar(40) NOT NULL,
	`building_no` varchar(10),
	PRIMARY KEY (`store_id`)
);
CREATE TABLE IF NOT EXISTS `category` (
	`category_id` int AUTO_INCREMENT NOT NULL,
	`category_name` varchar(30) NOT NULL UNIQUE,
	`category_description` varchar(150),
	PRIMARY KEY (`category_id`)
);
CREATE TABLE IF NOT EXISTS `supplier` (
	`supplier_id` int AUTO_INCREMENT NOT NULL,
	`supplier_name` varchar(50) NOT NULL,
	`country` varchar(30) NOT NULL,
	`phone_number` varchar(15) NOT NULL,
	`email` varchar(50) NOT NULL,
	PRIMARY KEY (`supplier_id`)
);
CREATE TABLE IF NOT EXISTS `customer` (
	`customer_id` int AUTO_INCREMENT NOT NULL,
	`first_name` varchar(30) NOT NULL,
	`last_name` varchar(30) NOT NULL,
	`gender` varchar(1) NOT NULL,
	`birth_date` date NOT NULL,
	`phone_number` varchar(15) NOT NULL,
	`email` varchar(50) NOT NULL UNIQUE,
	`city` varchar(30) NOT NULL,
	`discount` int,
	PRIMARY KEY (`customer_id`)
);
CREATE TABLE IF NOT EXISTS `employee` (
	`employee_id` int AUTO_INCREMENT NOT NULL,
	`user_name` varchar(30) NOT NULL UNIQUE,
	`first_name` varchar(30) NOT NULL,
	`last_name` varchar(30) NOT NULL,
	`position` varchar(20) NOT NULL,
	`employment_date` date NOT NULL,
	`store_id` int NOT NULL,
	`manager_id` int,
	`rate` float NOT NULL,
	`bonus` float,
	PRIMARY KEY (`employee_id`)
);
CREATE TABLE IF NOT EXISTS `product` (
	`product_id` int AUTO_INCREMENT NOT NULL,
	`product_name` varchar(40) NOT NULL,
	`product_description` varchar(150) NOT NULL,
	`category_id` int NOT NULL,
	`supplier_id` int NOT NULL,
	`unit` varchar(10) NOT NULL,
	`amount` int NOT NULL,
	`price` float NOT NULL,
	PRIMARY KEY (`product_id`)
);
CREATE TABLE IF NOT EXISTS `orders` (
	`orders_id` int AUTO_INCREMENT NOT NULL,
	`customer_id` int NOT NULL,
	`employee_id` int,
	`store_id` int NOT NULL,
	`order_channel` varchar(10) NOT NULL,
	`order_moment` datetime NOT NULL,
	`order_status` varchar(15) NOT NULL,
	`payment_type` varchar(15) NOT NULL,
	`delivery_type` varchar(10) NOT NULL,
	`delivery_address` varchar(100),
	`delivery_date` date,
	PRIMARY KEY (`orders_id`)
);
CREATE TABLE IF NOT EXISTS `order_item` (
	`orders_id` int NOT NULL,
	`product_id` int NOT NULL,
	`amount` int NOT NULL,
	`unit_price` float NOT NULL,
	PRIMARY KEY (`orders_id`)
);
ALTER TABLE `employee` ADD CONSTRAINT `employee_fk6` FOREIGN KEY (`store_id`) REFERENCES `Store`(`store_id`);
ALTER TABLE `employee` ADD CONSTRAINT `employee_fk7` FOREIGN KEY (`manager_id`) REFERENCES `employee`(`employee_id`);
ALTER TABLE `product` ADD CONSTRAINT `product_fk3` FOREIGN KEY (`category_id`) REFERENCES `category`(`category_id`);
ALTER TABLE `product` ADD CONSTRAINT `product_fk4` FOREIGN KEY (`supplier_id`) REFERENCES `supplier`(`supplier_id`);
ALTER TABLE `orders` ADD CONSTRAINT `orders_fk1` FOREIGN KEY (`customer_id`) REFERENCES `customer`(`customer_id`);
ALTER TABLE `orders` ADD CONSTRAINT `orders_fk2` FOREIGN KEY (`employee_id`) REFERENCES `employee`(`employee_id`);
ALTER TABLE `orders` ADD CONSTRAINT `orders_fk3` FOREIGN KEY (`store_id`) REFERENCES `Store`(`store_id`);
ALTER TABLE `order_item` ADD CONSTRAINT `order_item_fk0` FOREIGN KEY (`orders_id`) REFERENCES `orders`(`orders_id`);
ALTER TABLE `order_item` ADD CONSTRAINT `order_item_fk1` FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`);