create database bibliothek;

drop table if exists leser;
create table leser
(
	leser_id     int unsigned auto_increment primary key,
	vorname      varchar(30) not null,
    nachname     varchar(30) not null
);

drop table if exists buecher;
create table buecher
(
    buch_id         int unsigned auto_increment primary key,
    autor           varchar(100) not null,
	kategorie       enum('K', 'W', 'U'),
    ausleihanzahl   int unsigned default 0,
    ausleihbar     	bool default false
);

drop table if exists verleihen;
create table verleihen
(
	id          int unsigned auto_increment primary key,
	leser_id    int unsigned not null,
    buch_id     int unsigned not null,
	foreign key (leser_id) references leser(leser_id) on update restrict on delete restrict,
    foreign key (buch_id)  references buecher(buch_id) on update restrict on delete restrict
);

