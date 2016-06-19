--Tasks
--1 Get all customers and their addresses.

SELECT * FROM addresses
	JOIN customers ON customers.id = addresses.customer_id;

  1	1 Main St	Detroit	MI	31111	home	1	1	Lisa	Bonet
  2	555 Some Pl	Chicago	IL	60611	business	1	1	Lisa	Bonet
  3	8900 Linova Ave	Minneapolis	MN	55444	home	2	2	Charles	Darwin
  4	PO Box 999	Minneapolis	MN	55334	business	3	3	George	Foreman
  5	3 Charles Dr	Los Angeles	CA	00000	home	4	4	Lucy	Liu
  6	934 Superstar Ave	Portland	OR	99999	business	4	4	Lucy	Liu

--2 Get all orders and their line items.

SELECT * FROM orders
  JOIN line_items ON orders.id = line_items.order_id;

1	2010-03-05	88	1	2	3.12	4	1	2
1	2010-03-05	88	1	1	5	16	1	1
2	2012-02-08	23.5	2	3	4	2	2	3
4	2011-03-04	4	3	4	7.25	3	4	4
5	2012-09-22	12.99	5	5	6	1	5	7
6	2012-09-23	23	6	6	2.34	6	6	5
7	2013-05-25	39.12	5	7	1.05	9	7	5

--3 Which warehouses have cheetos?

SELECT * FROM warehouse
	JOIN warehouse_product ON warehouse.id = warehouse_product.warehouse_id
	JOIN products ON warehouse_product.product_id = products.id
	WHERE description = 'cheetos';

  3	delta	4	5	3	7	5	cheetos	0.99

--4 Which warehouses have diet pepsi?

SELECT * FROM warehouse
	JOIN warehouse_product ON warehouse.id = warehouse_product.warehouse_id
	JOIN products ON warehouse_product.product_id = products.id
	WHERE description = 'diet pepsi';

1	alpha	2	6	1	1	6	diet pepsi	1.2
3	delta	4	6	3	88	6	diet pepsi	1.2
4	gamma	4	6	4	3	6	diet pepsi	1.2

--5 Get the number of orders for each customer.

--   NOTE: It is OK if those without orders are not included in results.

--6 How many customers do we have?

SELECT MAX(customer_id) FROM addresses; 4
--or
SELECT COUNT(*) FROM customers; 4

--7 How many products do we carry?

SELECT COUNT(*) FROM products; 7

--8 What is the total available on-hand quantity of diet pepsi?

SELECT sum(on_hand) FROM warehouse_product
		JOIN products ON warehouse_product.product_id=products.id
		WHERE products.description = 'diet pepsi';

92
