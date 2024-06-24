
CREATE TABLE items
(
  item_id integer NOT NULL,
  item_name varchar(50),
  item_desc varchar(500),
  item_cat integer,
  item_img varchar(100),
  avg_rating numeric(2,1) DEFAULT 0.0,
  CONSTRAINT items_pkey PRIMARY KEY (item_id)
);

alter table items add column tot_sales integer DEFAULT 0;

select * from items;
select * from ratings where item_id = 51;

CREATE TABLE mas_user(
uname varchar(20) NOT NULL,
upass varchar(20),
access_lvl int,
uid SERIAL
);

CREATE TABLE customers
(
  cus_uid serial NOT NULL,
  cus_name varchar(50),
  email varchar(20),
  ph_no varchar(10),
  gender character(2),
  bdate date,
  address varchar(50),
  uid integer,
  CONSTRAINT pkey_customers PRIMARY KEY (cus_uid)
);

CREATE TABLE employee
(
  emp_id serial NOT NULL,
  emp_name varchar(50),
  uid integer,
  email varchar(20),
  CONSTRAINT employee_pkey PRIMARY KEY (emp_id)
);

CREATE TABLE mas_category
(
  cat_id integer NOT NULL,
  cat_name varchar(20),
  CONSTRAINT mas_category_pkey PRIMARY KEY (cat_id)
);



INSERT INTO mas_user(uname, upass, access_lvl) VALUES('admin', '123', 1);

delete from employee;

delete from customers;
DROP table mas_user;

CREATE TABLE ratings
(
  rating_id serial NOT NULL,
  item_id integer,
  site_name varchar(50),
  rating_value numeric(2,1),
  price numeric(10,2),
  sales integer DEFAULT 1,
  url varchar(250),
  CONSTRAINT ratings_pkey PRIMARY KEY (rating_id),
  CONSTRAINT ratings_item_id_fkey FOREIGN KEY (item_id)
      REFERENCES items (item_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT ratings_rating_value_check CHECK (rating_value >= 1 AND rating_value <= 5)
);

alter table ratings modify column url varchar(500);



INSERT INTO mas_user (uname, upass, access_lvl, uid) VALUES ('admin', '123', 1, 100);
INSERT INTO mas_user (uname, upass, access_lvl, uid) VALUES ('roshni', '123', 2, 101);
INSERT INTO mas_user (uname, upass, access_lvl, uid) VALUES ('ritik s', '789', 2, 234);
INSERT INTO mas_user (uname, upass, access_lvl, uid) VALUES ('shraddha j', '567', 2, 123);
INSERT INTO mas_user (uname, upass, access_lvl, uid) VALUES ('raj k', '1234', 2, 345);
INSERT INTO mas_user (uname, upass, access_lvl, uid) VALUES ('sanju s', '890', 2, 456);
INSERT INTO mas_user (uname, upass, access_lvl, uid) VALUES ('gita sen', '567', 3, 567);
INSERT INTO mas_user (uname, upass, access_lvl, uid) VALUES ('raj p', '567', 3, 678);
INSERT INTO mas_user (uname, upass, access_lvl, uid) VALUES ('sanjay singh', '7890', 3, 789);
INSERT INTO mas_user (uname, upass, access_lvl, uid) VALUES ('william s', '4567', 3, 901);
INSERT INTO mas_user (uname, upass, access_lvl, uid) VALUES ('veer k', '345', 3, 902);
INSERT INTO mas_user (uname, upass, access_lvl, uid) VALUES ('rahul roy', '6789', 3, 987);
INSERT INTO mas_user (uname, upass, access_lvl, uid) VALUES ('sanju singh', '4567', 3, 897);
INSERT INTO mas_user (uname, upass, access_lvl, uid) VALUES ('shraddha', '234', 3, 102);
select * from mas_user;

INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (1, 'The Great Gatsby', 'Classic novel by F. Scott Fitzgerald', 1, '', 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (2, 'To Kill a Mockingbird', 'Harper Lees timeless exploration of racial injustice', 1, '', 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (4, 'The Catcher in the Rye', 'J.D. Salingers influential coming-of-age novel', 1, '', 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (5, 'Pride and Prejudice', 'Jane Austens classic romantic novel', 1, '', 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (6, 'Samsung Galaxy S21', 'Flagship smartphone with advanced features', 2, '', 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (7, 'iPhone 13', 'Latest iPhone model with powerful performance', 2, '', 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (8, 'Xiaomi Mi 11', 'Affordable flagship with impressive specifications', 2, '', 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (9, 'Google Pixel 6', 'High-quality camera and pure Android experience', 2, '', 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (10, 'OnePlus 9 Pro', 'Premium Android device with fast charging', 2, '', 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (11, 'Cotton Shirt', 'Comfortable cotton shirt for daily wear', 3, '', 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (12, 'Denim Jeans', 'Classic denim jeans for a casual look', 3, '', 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (13, 'Silk Dress', 'Elegant silk dress for special occasions', 3, '', 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (14, 'Wool Sweater', 'Warm wool sweater for chilly days', 3, '', 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (15, 'Athletic Shorts', 'Breathable athletic shorts for sports and exercise', 3, '', 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (16, 'LG AC', 'Highly efficient air conditioner with advanced cooling technology', 4, '', 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (17, 'Samsung AC', 'Energy-efficient AC with smart features', 4, '', 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (18, 'Daikin AC', 'Japanese brand known for reliable and durable air conditioners', 4, '', 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (19, 'Carrier AC', 'Trusted brand with a focus on performance and innovation', 4, '', 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (20, 'Hitachi AC', 'Innovative air conditioning solutions for home and business', 4, '', 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (21, 'Sony TV', 'High-quality televisions with cutting-edge display technology', 5, '', 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (22, 'Samsung TV', 'Smart TVs with vibrant colors and immersive viewing experience', 5, '', 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (23, 'LG TV', 'Innovative TVs known for sleek design and superior picture quality', 5, '', 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (24, 'TCL TV', 'Affordable smart TVs with Roku integration for streaming', 5, '', 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (25, 'Panasonic TV', 'Japanese brand offering a range of televisions with great features', 5, '', 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (26, 'Louis Vuitton', 'Luxury bags with iconic monogram and elegant design', 6, '', 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (27, 'Gucci', 'Fashion-forward bags known for their quality and style', 6, '', 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (28, 'Michael Kors', 'Designer bags with a blend of fashion and functionality', 6, '', 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (29, 'Herschel', 'Casual and trendy bags suitable for everyday use', 6, '', 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (30, 'Samsonite', 'Durable and reliable bags, especially for travel', 6, '', 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (31, 'abcd', '  efg                  ', 1, NULL, 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (32, 'oneplus', '       new phone             ', 2, NULL, 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (33, 'baggit', '             nice bag       ', 6, NULL, 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (34, 'the secret garden', '            Enter the enchanting world of Frances Hodgson Burnett''s timeless classic, The Secret Garden. Follow young Mary Lennox as she discovers a hidden paradise, filled with wonders and secrets waiting to be unlocked. This edition captures the magic and beauty of the garden''s transformative power.        ', 1, NULL, 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (35, 'the secret garden', '            Enter the enchanting world of Frances Hodgson Burnett''s timeless classic, The Secret Garden. Follow young Mary Lennox as she discovers a hidden paradise, filled with wonders and secrets waiting to be unlocked. This edition captures the magic and beauty of the garden''s transformative power.        ', 1, NULL, 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (36, 'the secret garden', '        Enter the enchanting world of Frances Hodgson Burnett''s timeless classic, The Secret Garden. Follow young Mary Lennox as she discovers a hidden paradise, filled with wonders and secrets waiting to be unlocked. This edition captures the magic and beauty of the garden''s transformative power.            ', 1, NULL, 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (37, 'the secret garden', '        Enter the enchanting world of Frances Hodgson Burnett''s timeless classic, The Secret Garden. Follow young Mary Lennox as she discovers a hidden paradise, filled with wonders and secrets waiting to be unlocked. This edition captures the magic and beauty of the garden''s transformative power.            ', 1, NULL, 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (38, 'the secret garden', '        Enter the enchanting world of Frances Hodgson Burnett''s timeless classic, The Secret Garden. Follow young Mary Lennox as she discovers a hidden paradise, filled with wonders and secrets waiting to be unlocked. This edition captures the magic and beauty of the garden''s transformative power.            ', 1, NULL, 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (39, 'the secret garden', '        Enter the enchanting world of Frances Hodgson Burnett''s timeless classic, The Secret Garden. Follow young Mary Lennox as she discovers a hidden paradise, filled with wonders and secrets waiting to be unlocked. This edition captures the magic and beauty of the garden''s transformative power.            ', 1, NULL, 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (40, 'the secret garden', '                    abcfd', 1, NULL, 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (41, 'as you like it', 'book by william shakespeare           ', 1, NULL, 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (42, 'gucci dress', 'very expensive', 3, NULL, 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (43, 'gucci dress', 'very expensive', 3, NULL, 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (44, 'gucci dress', 'very expensive', 3, NULL, 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (45, 'samsung a22', 'good phone', 2, NULL, 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (46, 'samsung a22', 'good phone', 2, NULL, 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (47, 'samsung a22', 'good phone', 2, NULL, 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (48, 'abc', 'def', 2, NULL, 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (49, 'abc', 'def', 2, NULL, 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (50, 'abc', 'def', 2, NULL, 0.0);
INSERT INTO items (item_id, item_name, item_desc, item_cat, item_img, avg_rating) VALUES (3, 'you', 'Dystopian novel by George Orwell', 1, '', 0.0);
-- select * from items;

INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (29, 15, 'Meesho', 3.5, 500.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (67, 37, 'Amazon', 4.4, 139.00, 19980, 'https://www.amazon.in/Secret-Garden-Frances-Hodgson-Burnett/dp/9386538997/ref=sr_1_1_sspa?crid=3GKCY4SJAYD1K&keywords=the+secret+garden&qid=1704381053&sprefix=the+secret+garde%2Caps%2C400&sr=8-1-spons&sp_csd=d2lkZ2V0TmFtZT1zcF9hdGY&psc=1');
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (71, 40, 'Amazon', 4.4, 139.00, 19980, 'https://www.amazon.in/Secret-Garden-Frances-Hodgson-Burnett/dp/9386538997/');
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (72, 40, 'Flipkart', 4.4, 191.00, 1877, 'https://www.flipkart.com/the-secret-garden/p/itmfbtgnqyu97mtz?');
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (73, 41, 'amazon', 3.3, 200.00, 100, 'www.amazon.in');
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (74, 41, 'flipkart', 2.8, 150.00, 200, 'www.fliipkart.in');
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (78, 46, 'amazon', 3.3, 200.00, 560, 'www.amazon.in');
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (81, 49, 'amazon', 3.3, 200.00, 560, 'www.amazon.in');
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (12, 6, 'Amazon', 3.2, 14400.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (26, 13, 'Myntra', 2.3, 2400.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (32, 16, 'Flipkart', 4.0, 42576.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (36, 18, 'Flipkart', 3.8, 35000.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (25, 13, 'Meesho', 3.5, 1800.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (11, 6, 'Croma', 4.5, 12600.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (22, 11, 'Myntra', 4.8, 1200.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (16, 8, 'Amazon', 3.5, 12800.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (23, 12, 'Meesho', 4.0, 1100.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (14, 7, 'Amazon', 4.8, 11250.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (35, 18, 'Croma', 3.2, 36500.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (24, 12, 'Myntra', 3.5, 2000.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (34, 17, 'Flipkart', 3.8, 27740.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (13, 7, 'Croma', 4.9, 11260.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (15, 8, 'Croma', 4.0, 13430.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (17, 9, 'Croma', 3.0, 13460.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (18, 9, 'Amazon', 4.0, 12540.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (19, 10, 'Croma', 4.2, 12280.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (68, 38, 'Amazon', 4.4, 139.00, 19980, 'https://www.amazon.in/Secret-Garden-Frances-Hodgson-Burnett/dp/9386538997/ref=sr_1_1_sspa?crid=3GKCY4SJAYD1K&keywords=the+secret+garden&qid=1704381053&sprefix=the+secret+garde%2Caps%2C400&sr=8-1-spons&sp_csd=d2lkZ2V0TmFtZT1zcF9hdGY&psc=1');
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (75, 44, 'amazon', 3.5, 500.00, 560, 'www.amazon.in');
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (76, 44, 'flipkart', 2.8, 150.00, 200, 'www.fliipkart.in');
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (79, 47, 'amazon', 3.3, 200.00, 560, 'www.amazon.in');
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (82, 50, 'amazon', 3.3, 200.00, 560, 'www.amazon.in');
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (20, 10, 'Amazon', 4.7, 18300.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (21, 11, 'Meesho', 4.3, 540.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (27, 14, 'Meesho', 3.2, 600.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (28, 14, 'Myntra', 3.0, 700.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (30, 15, 'Myntra', 3.8, 450.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (31, 16, 'Croma', 4.2, 35450.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (33, 17, 'Croma', 3.5, 28800.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (37, 19, 'Croma', 4.3, 37500.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (47, 24, 'Flipkart', 4.3, 15000.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (42, 21, 'Amazon', 5.0, 21999.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (41, 21, 'Flipkart', 4.8, 23000.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (45, 23, 'Flipkart', 4.0, 28450.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (46, 23, 'Amazon', 4.5, 24999.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (38, 19, 'Flipkart', 3.7, 46000.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (39, 20, 'Croma', 5.0, 28500.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (40, 20, 'Flipkart', 3.6, 35000.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (43, 22, 'Flipkart', 4.3, 16500.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (44, 22, 'Amazon', 3.6, 18499.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (48, 24, 'Amazon', 3.4, 11999.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (2, 1, 'Amazon', 4.0, 400.00, 5, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (69, 39, 'Amazon', 4.4, 139.00, 19980, 'https://www.amazon.in/Secret-Garden-Frances-Hodgson-Burnett/dp/9386538997/');
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (70, 39, 'Flipkart', 4.4, 191.00, 1877, 'https://www.flipkart.com/the-secret-garden/p/itmfbtgnqyu97mtz?');
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (6, 3, 'Amazon', 3.5, 800.00, 12, 'https://www.amazon.in/1984-Signet-Classics-George-Orwell/dp/0451524934');
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (5, 3, 'Flipkart', 4.0, 430.00, 10, 'https://www.flipkart.com/1984/p/itmfbsy8zb7twxpg');
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (77, 44, 'amazon', 3.3, 200.00, 560, 'www.amazon.in');
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (80, 48, 'amazon', 3.3, 200.00, 560, 'www.amazon.in');
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (57, 29, 'Nykaa', 3.8, 1400.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (49, 25, 'Flipkart', 4.0, 43000.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (50, 25, 'Amazon', 2.8, 49000.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (53, 27, 'Nykaa', 3.7, 3400.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (54, 27, 'Myntra', 4.0, 3200.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (55, 28, 'Nykaa', 3.4, 1800.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (63, 32, 'amazon', 3.8, 25000.00, 120, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (64, 32, 'flipkart', 4.2, 32000.00, 340, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (66, 33, 'flipkart', 3.0, 2800.00, 180, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (3, 2, 'Flipkart', 2.9, 260.00, 20, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (7, 4, 'Flipkart', 3.0, 460.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (9, 5, 'Flipkart', 3.7, 280.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (10, 5, 'Amazon', 4.2, 300.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (61, 31, 'fg', 2.5, 2500.00, 200, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (62, 31, 'hj', 3.0, 3200.00, 120, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (4, 2, 'Amazon', 3.8, 250.00, 60, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (1, 1, 'Flipkart', 3.5, 600.00, 2, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (8, 4, 'Amazon', 4.5, 540.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (51, 26, 'Nykaa', 3.8, 1500.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (56, 28, 'Myntra', 4.6, 2300.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (52, 26, 'Myntra', 4.2, 1250.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (60, 30, 'Myntra', 4.7, 4300.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (59, 30, 'Nykaa', 4.5, 3500.00, 1, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (65, 33, 'myntra', 3.5, 3400.00, 200, NULL);
INSERT INTO ratings (rating_id, item_id, site_name, rating_value, price, sales, url) VALUES (58, 29, 'Myntra', 4.5, 1630.00, 1, NULL);

select * from ratings;

INSERT INTO mas_category (cat_id, cat_name) VALUES (1, 'Books');
INSERT INTO mas_category (cat_id, cat_name) VALUES (2, 'Mobiles');
INSERT INTO mas_category (cat_id, cat_name) VALUES (3, 'Clothes');
INSERT INTO mas_category (cat_id, cat_name) VALUES (4, 'AC');
INSERT INTO mas_category (cat_id, cat_name) VALUES (5, 'TV');
INSERT INTO mas_category (cat_id, cat_name) VALUES (6, 'Bag');

select * from mas_category;

INSERT INTO customers (cus_uid, cus_name, email, ph_no, gender, bdate, address, uid) VALUES (1, 'kajal S', 'kj@email.com', '1234567890', 'F ', '2023-04-12', '       agartala             ', 102);
INSERT INTO customers (cus_uid, cus_name, email, ph_no, gender, bdate, address, uid) VALUES (3, 'gita sen', 'gita@gmail.com', '123456', 'F ', '1988-06-10', '                    delhi,india', 567);
INSERT INTO customers (cus_uid, cus_name, email, ph_no, gender, bdate, address, uid) VALUES (5, 'raj p', 'r@p.com', '3456', 'M ', '2000-03-10', 'agartala', 678);
INSERT INTO customers (cus_uid, cus_name, email, ph_no, gender, bdate, address, uid) VALUES (2, 'veer k', 'v@k.com', '9087654321', 'M ', '2023-10-12', '        inkj            ', 902);
INSERT INTO customers (cus_uid, cus_name, email, ph_no, gender, bdate, address, uid) VALUES (4, 'william s', 'will@gmail.com', '45678', 'M ', '2023-04-12', '        england            ', 901);
INSERT INTO customers (cus_uid, cus_name, email, ph_no, gender, bdate, address, uid) VALUES (6, 'sanju singh', 'sanju@gmail.com', '34567', 'M ', '2023-04-12', '            kerala        ', NULL);
select * from customers;


INSERT INTO employee (emp_id, emp_name, uid, email) VALUES (1, 'roshni', 101, 'roshni@email.com');
INSERT INTO employee (emp_id, emp_name, uid, email) VALUES (2, 'shraddha j', 123, 'sj@gmail.com');
INSERT INTO employee (emp_id, emp_name, uid, email) VALUES (3, 'ritik s', 234, 'r@s.com');
INSERT INTO employee (emp_id, emp_name, uid, email) VALUES (5, 'raj k', 345, 'raj@gmail.com');
INSERT INTO employee (emp_id, emp_name, uid, email) VALUES (4, 'sanju sen', 456, 'san@s.com');
select * from employee;

select * from mas_user;


 -- ====================================================
DELIMITER $$
CREATE PROCEDURE save_item_details(in_item_name varchar(50), in_item_desc varchar(500), in_item_cat int, site_name1 varchar(50), rating_value1 numeric, price1 numeric, sales1 int,
 url1 varchar(500), site_name2 varchar(50), rating_value2 numeric, price2 numeric, sales2 int, url2 varchar(500), imgpath varchar(100))
begin
	DECLARE nxt_itemid integer;
	DECLARE avgRating numeric(2, 1);
	
    -- find the next item id
     select coalesce(max(item_id), 0)+1 INTO nxt_itemid from items;
     -- calculate average rating
     SET avgRating = ((rating_value1 * sales1) + (rating_value2 * sales2))/(sales1 + sales2);

     insert into items(item_id,item_name,item_desc,item_cat, avg_rating, tot_sales,item_img) values(nxt_itemid, in_item_name, in_item_desc, in_item_cat, avgRating, (sales1 + sales2),imgpath);
     
     insert into ratings(item_id, site_name, rating_value, price, sales, url) values(nxt_itemid, site_name1, rating_value1,price1, sales1, url1);

     insert into ratings(item_id, site_name, rating_value, price, sales, url) values(nxt_itemid, site_name2, rating_value2,price2, sales2, url2);
end $$
DELIMITER $$


/*
select * from mas_user;
select * from employee;
select * from customers;

select uname, upass, mu.uid, emp_name,access_lvl from mas_user mu inner join employee emp ON mu.uid=emp.uid where uname= 'shraddha' and upass='1234';

*/
-- Function: edit_item_details(integer, character varying, character varying, integer, character varying, numeric, numeric, integer, character varying, character varying, numeric, numeric, integer, character varying, character varying)

-- DROP FUNCTION edit_item_details(integer, character varying, character varying, integer, character varying, numeric, numeric, integer, character varying, character varying, numeric, numeric, integer, character varying, character varying);

DELIMITER $$
CREATE PROCEDURE edit_item_details(in_item_id int, in_item_name varchar(50), in_item_desc varchar(500), in_item_cat int, site_name1 varchar(50), rating_value1 numeric, price1 numeric,
 sales1 int, url1 varchar(500), site_name2 varchar(50), rating_value2 numeric, price2 numeric, sales2 int, url2 varchar(500), imgpath varchar(100))
  
BEGIN
    DECLARE avgRating numeric(2, 1);

     -- find the next item id
     -- select coalesce(max(item_id), 0)+1 INTO nxt_itemid from items;
     -- calculate average rating
     SET avgRating = ((rating_value1 * sales1) + (rating_value2 * sales2))/(sales1 + sales2);

     UPDATE items SET item_name = in_item_name, item_desc = in_item_desc,item_cat = in_item_cat, avg_rating = avgRating, tot_sales = (sales1 + sales2), item_img=imgpath  WHERE item_id = in_item_id;
     DELETE from ratings WHERE item_id = in_item_id;
     insert into ratings(item_id, site_name, rating_value, price, sales, url) values(in_item_id, site_name1, rating_value1,price1, sales1, url1);
     insert into ratings(item_id, site_name, rating_value, price, sales, url) values(in_item_id, site_name2, rating_value2,price2, sales2, url2);

end $$
DELIMITER $$