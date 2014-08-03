create database db_odk_inventory;

use db_odk_inventory;

create table tbl_health_center(
	id int auto_increment,
	health_center_name varchar(100) not null,
	description text not null,
	primary key(id)
)character set utf8 collate utf8_general_ci;

create table tbl_user(
	id int auto_increment,
	first_name varchar(50) not null,
	middle_name varchar(50) not null,
	last_name varchar(50) not null,
	user_type varchar(50) not null,
	primary key(id)
);

create table tbl_relate_odk_user_with_inventory_user(
	id int auto_increment,
	user_id int not null,
	_URI varchar(80) not null,
	primary key(id)
);

tbl_item_code_lookup(
	id int auto_increment,
	item_code varchar(50) not null,
	primary key(id)
);

create table tbl_health_center_location(
	id int auto_increment,
	woreda varchar(50) not null,
	kebele varchar(50) not null,
	gote varchar(50) not null,
	google_map text not null,
	health_center_id int not null,
	primary key(id),
	foreign key(health_center_id) references tbl_health_center(id)
)character set utf8 collate utf8_general_ci;

create table tbl_health_post(
	id int auto_increment,
	health_post_name varchar(100) not null,
	description text not null,
	health_center_id int not null,
	primary key(id),
	foreign key(health_center_id) references tbl_health_center(id)
)character set utf8 collate utf8_general_ci;

create table tbl_health_post_location(
	id int auto_increment,
	woreda varchar(50) not null,
	kebele varchar(50) not null,
	gote varchar(50) not null,
	google_map text not null,
	health_post_id int not null,
	primary key(id),
	foreign key(health_post_id) references tbl_health_post(id)
)character set utf8 collate utf8_general_ci;

create table tbl_category(
	id int auto_increment,
	category_code varchar(5) not null,
	category_name varchar(100) not null,
	description text not null,
	primary key(id)
)character set utf8 collate utf8_general_ci;

create table tbl_item(
	id int auto_increment,
	item_code varchar(10) not null,
	item_name varchar(100) not null,
	category_id int not null,
	description text not null,
	primary key(id),
	foreign key(category_id) references tbl_category(id)
)character set utf8 collate utf8_general_ci;

create table tbl_hew(
	id int auto_increment,
	first_name varchar(50) not null,
	father_name varchar(50) not null,
	grand_father_name varchar(50) not null,
	mobile_number varchar(50) not null,
	health_post_id int not null,
	primary key(id),
	foreign key(health_post_id) references tbl_health_post(id)
)character set utf8 collate utf8_general_ci;

create table tbl_main_store(
	id bigint auto_increment,
	main_store_name varchar(50) not null,
	health_center_id int not null,	
	primary key(id),
	foreign key(health_center_id) references tbl_health_center(id)	
)character set utf8 collate utf8_general_ci;

create table tbl_main_store_detail(
	id bigint auto_increment,	
	main_store_id bigint not null,
	item_id int not null,
	current_quantity float not null,
	foreign key(item_id) references tbl_item(id),
	foreign key(main_store_id) references tbl_main_store(id)
)character set utf8 collate utf8_general_ci;

create table tbl_stock(
	id bigint auto_increment,
	stock_name varchar(50) not null,
	health_post_id int not null,	
	primary key(id),
	foreign key(health_post_id) references tbl_health_post(id),
	foreign key(item_id) references tbl_item(id)
)character set utf8 collate utf8_general_ci;

create table tbl_stock_detail(
	id bigint auto_increment,
	stock_id bigint not null,
	item_code int not null,
	current_quantity float not null,
	primary key(id),
	foreign key(stock_id) references tbl_stock(id)
)character set utf8 collate utf8_general_ci;

create table tbl_grv(
	id bigint auto_increment,
	grv_date datetime not null,
	hew_id int not null,	
	primary key(id),
	foreign key(hew_id) references tbl_hew(id),
	foreign key(stock_id) references tbl_stock(id)
)character set utf8 collate utf8_general_ci;

create table tbl_grv_detail(
	id bigint auto_increment,
	grv_id bigint not null,
	item_id int not null,
	quantity float not null,
	expiry_date datetime not null,
	primary key(id),
	foreign key(grv_id) references tbl_grv(id),
	foreign key(item_id) references tbl_item(id)
)character set utf8 collate utf8_general_ci;

create table tbl_order(
	id bigint auto_increment,
	health_post_id int not null,
	hew_id int not null,
	order_date datetime not null,
	order_status varchar(20) not null,
	primary key(id),
	foreign key(health_post_id) references tbl_health_post(id),
	foreign key(hew_id) references tbl_hew(id)
)character set utf8 collate utf8_general_ci;

create table tbl_order_detail(
	id bigint auto_increment,
	order_id bigint not null,
	item_id int not null,
	urgency varchar(20) not null,
	quantity float not null,
	primary key(id),
	foreign key(order_id) references tbl_order(id),
	foreign key(item_id) references tbl_item(id)
)character set utf8 collate utf8_general_ci;

create table tbl_giv(
	id bigint auto_increment,
	giv_date datetime not null,
	hew_id int not null,	
	primary key(id),
	foreign key(hew_id) references tbl_hew(id)

)character set utf8 collate utf8_general_ci;

create table tbl_giv_detail(
	id bigint auto_increment,
	giv_id bigint not null,
	item_id int not null,
	quantity float not null,
	expiry_date datetime not null,
	primary key(id),
	foreign key(giv_id) references tbl_giv(id),
	foreign key(item_id) references tbl_item(id)
)character set utf8 collate utf8_general_ci;

create table tbl_bin_card(
	id bigint auto_increment,
	item_code varchar(50) not null,
	bin_card_date datetime not null,
	transaction_type varchar(50) not null,
	transaction_quantity float not null,
	stock_id bigint not null,
	item_current_balance float not null,
	primary key(id),
	foreign key(item_id) references tbl_item(id),
	foreign key(stock_id) references tbl_stock(id)
)character set utf8 collate utf8_general_ci;

create table tbl_approved_order(
	id bigint auto_increment,
	_uri varchar(80) not null,
	health_post_id int not null,
	approved_on datetime not null,
	approved_by int not null,
	pills_amount float not null,
	condom_amount float not null,
	injectable_amount float not null,
	implant_amount float not null,
	primary key(id),
	foreign key(health_post_id) references tbl_health_post(id),
	foreign key(approved_by) references tbl_user(id)
)character set utf8 collate utf8_general_ci;

create table tbl_hew_manages_health_post(
	id int auto_increment,
	user_id int not null,
	health_post_id int not null,
	primary key(id),
	foreign key(user_id) references tbl_user(id),
	foreign key(health_post_id) references tbl_health_post(id)
);

create table tbl_nurse_manages_health_center(
	id int auto_increment,
	user_id int not null,
	health_center_id int not null,
	primary key(id),
	foreign key(user_id) references tbl_user(id),
	foreign key(health_center_id) references tbl_health_center(id)
);

create table tbl_phone_responsibility(
	id bigint auto_increment,
	full_name varchar(100) not null,
	health_center_id int not null,
	job_description text not null,
	phone_brand varchar(200) not null,
	apparatus_serial_number varchar(200) not null,
	battery_serial_number varchar(200) not null,
	sim_pin_number varchar(100) not null,
	phone_number varchar(70) not null,
	date_given datetime not null,
	description text not null,
	primary key(id),
	foreign key(health_center_id) references tbl_health_center(id)
);

create table tbl_item_reorder_level(
	id int auto_increment,
	stock_id bigint not null,
	item_code varchar(50) not null,
	reorder_level float not null,
	primary key(id),
	foreign key(stock_id) references tbl_stock(id)
);

create table tbl_downloads(
	id bigint auto_increment,
	title varchar(100) not null,
	date_uploaded datetime not null,
	description text not null,
	uploaded_item mediumblob not null,
	primary key(id)
);

create table tbl_item_reorder_reminder(
	id bigint auto_increment,
	stock_id bigint not null,
	item_code varchar(50) not null,
	message text not null,
	date_message_sent datetime not null,
	status varchar(50) not null,
	primary key(id),
	foreign key(stock_id) references tbl_stock(stock_id)
);

create table tbl_mother(
	id int auto_increment,
	mother_full_name varchar(100) not null,
	house_number_gote varchar(100) not null,
	preferred_contraceptive_method varchar(100) not null,
	phone_number varchar(70) not null,
	primary key(id)
);

create table tbl_schedule(
	id bigint auto_increment,
	mother_id int not null,
	last_visit_date datetime not null,
	next_scheduled_date datetime not null,
	actual_visit_date datetime not null,
	primary key(id),
	foreign key(mother_id) references tbl_mother(id)
);

create table tbl_reminder_message(
	id bigint auto_increment,
	schedule_id bigint not null,
	message_content text not null,
	is_message_sent boolean not null,
	sent_date datetime not null,
	is_message_delivered boolean not null,
	delivered_date datetime not null,
	primary key(id),
	foreign key(schedule_id) references tbl_schedule(id)
);
