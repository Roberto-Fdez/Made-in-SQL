create table fabricante (
   id     number primary key,
   nombre varchar2(100) not null
);

create table producto (
   id            number primary key,
   nombre        varchar2(100) not null,
   precio        number(10,2) not null,
   id_fabricante number not null,
   foreign key ( id_fabricante )
      references fabricante ( id )
);

insert into fabricante values ( 1,
                                'Asus' );
insert into fabricante values ( 2,
                                'Lenovo' );
insert into fabricante values ( 3,
                                'Hewlett-Packard' );
insert into fabricante values ( 4,
                                'Samsung' );
insert into fabricante values ( 5,
                                'Seagate' );
insert into fabricante values ( 6,
                                'Crucial' );
insert into fabricante values ( 7,
                                'Gigabyte' );
insert into fabricante values ( 8,
                                'Huawei' );
insert into fabricante values ( 9,
                                'Xiaomi' );

insert into producto values ( 1,
                              'Disco duro SATA3 1TB',
                              86.99,
                              5 );
insert into producto values ( 2,
                              'Memoria RAM DDR4 8GB',
                              120,
                              6 );
insert into producto values ( 3,
                              'Disco SSD 1 TB',
                              150.99,
                              4 );
insert into producto values ( 4,
                              'GeForce GTX 1050Ti',
                              185,
                              7 );
insert into producto values ( 5,
                              'GeForce GTX 1080 Xtreme',
                              755,
                              6 );
insert into producto values ( 6,
                              'Monitor 24 LED Full HD',
                              202,
                              1 );
insert into producto values ( 7,
                              'Monitor 27 LED Full HD',
                              245.99,
                              1 );
insert into producto values ( 8,
                              'Portátil Yoga 520',
                              559,
                              2 );
insert into producto values ( 9,
                              'Portátil Ideapd 320',
                              444,
                              2 );
insert into producto values ( 10,
                              'Impresora HP Deskjet 3720',
                              59.99,
                              3 );
insert into producto values ( 11,
                              'Impresora HP Laserjet Pro M26nw',
                              180,
                              3 );

select nombre,
       precio
  from producto
 order by precio asc
offset 1 rows fetch next 3 rows only;
select nombre
  from producto
 order by precio asc
offset 1 rows fetch first 3 rows only;
select nombre
  from producto
 where upper(nombre) like upper('% impresora');
select id_fabricante,
       avg(precio)
  from producto
 group by id_fabricante;
select id_fabricante,
       count(precio)
  from producto
 group by id_fabricante;
select nombre,
       round(
          precio,
          0
       ) as precio_arrodonit
  from producto;
select nombre,
       precio,
       precio * 1.10 as preu_augmentat
  from producto;