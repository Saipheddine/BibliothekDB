create database bibliothek;

drop table if exists leser;
create table leser
(
	leser_id     int unsigned auto_increment primary key,
	vorname      varchar(30) not null,
    nachname     varchar(30) not null
);

insert into leser (vorname, nachname) values ("a", "b"), ("c","d"), ("e","f"),("g","h");
select * from leser;


drop table if exists buecher;
create table buecher
(
    buch_id         int unsigned auto_increment primary key,
    title           varchar(70) not null,
    autor           varchar(100) not null,
	kategorie       enum('K', 'W', 'U'),
    ausleihanzahl   int unsigned default 0,
    ausleihbar     	bool default false
);

insert into buecher (autor, title, kategorie, ausleihanzahl, ausleihbar)
values ("chekspear", 'Love', 'K', 2, true), ('Seif', 'SQL Basics','W', 0, false), ("Steven Hawking", "Black Holes", 'W', 4, true), ("Victor Hugo", "Les amis", "U", 1, true);
select * from buecher;

drop table if exists verleihen;
create table verleihen
(
	id          int unsigned auto_increment primary key,
	leser_id    int unsigned not null,
    buch_id     int unsigned not null,
	foreign key (leser_id) references leser(leser_id) on update restrict on delete restrict,
    foreign key (buch_id)  references buecher(buch_id) on update restrict on delete restrict
);

