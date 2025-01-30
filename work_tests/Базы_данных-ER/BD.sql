CREATE TABLE customers (
	customer_id int4 NOT NULL,
	login varchar NOT NULL,
	email varchar NOT NULL,
	CONSTRAINT users_email_unique UNIQUE (email),
	CONSTRAINT users_login_unique UNIQUE (login),
	CONSTRAINT customer_pkey PRIMARY KEY (customer_id)
);

CREATE TABLE orders (
	order_id int4 NOT NULL,
	town varchar NOT NULL,
	order_name varchar NOT NULL,
	price int4 NOT NULL,
	customer_id int4 NOT NULL,
	CONSTRAINT pk_orders PRIMARY KEY (order_id),
	CONSTRAINT fk_orders_customer_id FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE items (
	item_id int4 NOT NULL,
	item_name varchar NOT NULL,
	price int4 NOT NULL,
	description varchar NOT NULL,
	CONSTRAINT items_pkey PRIMARY KEY (item_id)
);

CREATE TABLE towns (
	town_name varchar NOT NULL,
	address varchar NOT NULL,
	postal_code int4 NOT NULL,
	customer_id int4 NOT NULL,
	CONSTRAINT fk_customer_towns FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
	order_id int4 NOT NULL,
	item_id int4 NOT NULL,
	CONSTRAINT order_item PRIMARY KEY (order_id, item_id),
	CONSTRAINT fk_order_order_items FOREIGN KEY (order_id) REFERENCES orders(order_id),
	CONSTRAINT fk_item_order_items FOREIGN KEY (item_id) REFERENCES items(item_id)
);