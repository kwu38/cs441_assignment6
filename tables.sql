create table if not exists kwu38_food.users (
	id int(11) not null auto_increment,
	fn varchar(32),
	ln varchar(32),
	email varchar(32),
	passcode varchar(64),
	PRIMARY KEY (userID)
);

