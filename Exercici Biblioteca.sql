drop table autor_llibre;
drop table llibre_genere;
drop table llibre;
drop table editorial;
drop table autor;
drop table genere;

create table editorial (
   id  number
      generated as identity
   primary key,
   nom varchar2(50)
);

create table llibre (
   id            number
      generated as identity
   primary key,
   titol         varchar2(50),
   an            number,
   exemplars     number,
   id_editorial  number not null,
   id_sequela_de number,
   foreign key ( id_editorial )
      references editorial ( id ),
   foreign key ( id_sequela_de )
      references llibre ( id )
);

create table autor (
   id           number
      generated as identity
   primary key,
   nom          varchar2(50),
   cognoms      varchar2(50),
   data_naix    date,
   nacionalitat varchar2(3)
);

create table autor_llibre (
   id_autor  number,
   id_llibre number,
   primary key ( id_autor,
                 id_llibre ),
   foreign key ( id_autor )
      references autor ( id ),
   foreign key ( id_llibre )
      references llibre ( id )
);

create table genere (
   nom varchar2(50) primary key
);

create table llibre_genere (
   id_llibre  number,
   nom_genere varchar2(50),
   foreign key ( id_llibre )
      references llibre ( id ),
   foreign key ( nom_genere )
      references genere ( nom ),
   primary key ( id_llibre,
                 nom_genere )
);

insert into editorial ( nom ) values ( 'LaButxaca' );
insert into editorial ( nom ) values ( 'Letras hispánicas' );
insert into editorial ( nom ) values ( 'Planeta' );
insert into editorial ( nom ) values ( 'Anaya' );

insert into genere values ( 'Misteri' );
insert into genere values ( 'Poesia' );
insert into genere values ( 'Fantasia' );
insert into genere values ( 'Aventura' );
insert into genere values ( 'Filosofia' );

insert into autor (
   nom,
   cognoms,
   data_naix,
   nacionalitat
) values ( 'Federico',
           'García Lorca',
           date '1898-06-05',
           'ESP' );
insert into autor (
   nom,
   cognoms,
   data_naix,
   nacionalitat
) values ( 'Manuel',
           'de Pedrolo i Molina',
           date '1918-04-01',
           'ESP' );
insert into autor (
   nom,
   cognoms,
   data_naix,
   nacionalitat
) values ( 'Joanne',
           'Rowling',
           date '1965-07-31',
           'GBR' );
insert into autor (
   nom,
   cognoms,
   data_naix,
   nacionalitat
) values ( 'Stephen',
           'King',
           date '1947-09-21',
           'USA' );
insert into autor (
   nom,
   cognoms,
   data_naix,
   nacionalitat
) values ( 'Owen',
           'King',
           date '1977-02-21',
           'USA' );
insert into autor (
   nom,
   cognoms,
   data_naix,
   nacionalitat
) values ( 'Shigeru',
           'Miyamoto',
           date '1952-09-16',
           'JPN' );
insert into autor (
   nom,
   cognoms,
   data_naix,
   nacionalitat
) values ( 'Hidetaka',
           'Miyazaki',
           date '1974-09-19',
           'JPN' );

--INSERT INTO LLIBRE(titol, an, exemplars, id_editorial) VALUES (nomLlibre, any, nombreExemplars, (SELECT ID FROM EDITORIAL WHERE NOM = 'Letras hispánicas'));
insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial
) values ( 'Bodas de sangre',
           1933,
           10,
           (
              select id
                from editorial
               where nom = 'Letras hispánicas'
           ) );
insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial
) values ( 'Yerma',
           1934,
           0,
           (
              select id
                from editorial
               where nom = 'Letras hispánicas'
           ) );
insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial
) values ( 'La casa de Bernarda Alba',
           1936,
           12,
           (
              select id
                from editorial
               where nom = 'Letras hispánicas'
           ) );
insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial
) values ( 'Poeta en Nueva York',
           1940,
           5,
           (
              select id
                from editorial
               where nom = 'Letras hispánicas'
           ) );
insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial
) values ( 'Romancero gitano',
           1928,
           1,
           (
              select id
                from editorial
               where nom = 'Letras hispánicas'
           ) );
insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial
) values ( 'El Lazarillo de Tormes',
           1554,
           2,
           (
              select id
                from editorial
               where nom = 'Letras hispánicas'
           ) );

insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial
) values ( 'Mecanoscrit del segon origen',
           1974,
           1,
           (
              select id
                from editorial
               where nom = 'LaButxaca'
           ) );
insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial
) values ( 'Totes les bèsties de càrrega',
           1965,
           5,
           (
              select id
                from editorial
               where nom = 'LaButxaca'
           ) );
insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial
) values ( 'Joc brut',
           1965,
           2,
           (
              select id
                from editorial
               where nom = 'LaButxaca'
           ) );
insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial
) values ( 'Trajecte final',
           1981,
           6,
           (
              select id
                from editorial
               where nom = 'LaButxaca'
           ) );
insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial
) values ( 'Es vessa una sang fàcil',
           1954,
           5,
           (
              select id
                from editorial
               where nom = 'LaButxaca'
           ) );

insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial
) values ( 'Harry Potter i la pedra filosofal',
           1997,
           0,
           (
              select id
                from editorial
               where nom = 'Planeta'
           ) );
insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial,
   id_sequela_de
) values ( 'Harry Potter i la cambra secreta',
           1998,
           7,
           (
              select id
                from editorial
               where nom = 'Planeta'
           ),
           (
              select id
                from llibre
               where titol = 'Harry Potter i la pedra filosofal'
           ) );
insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial,
   id_sequela_de
) values ( 'Harry Potter i el pres d''Azkaban',
           1999,
           6,
           (
              select id
                from editorial
               where nom = 'Planeta'
           ),
           (
              select id
                from llibre
               where titol = 'Harry Potter i la cambra secreta'
           ) );
insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial,
   id_sequela_de
) values ( 'Harry Potter i el calze de foc',
           2000,
           5,
           (
              select id
                from editorial
               where nom = 'Planeta'
           ),
           (
              select id
                from llibre
               where titol = 'Harry Potter i el pres d''Azkaban'
           ) );
insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial,
   id_sequela_de
) values ( 'Harry Potter i l''orde del Fènix',
           2003,
           4,
           (
              select id
                from editorial
               where nom = 'Planeta'
           ),
           (
              select id
                from llibre
               where titol = 'Harry Potter i el calze de foc'
           ) );
insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial
) values ( 'Bellas durmientes',
           2017,
           3,
           (
              select id
                from editorial
               where nom = 'Planeta'
           ) );

insert into autor_llibre
   select (
      select id
        from autor
       where nom = 'Federico'
   ),
          id
     from llibre
    where id_editorial = (
         select id
           from editorial
          where nom = 'Letras hispánicas'
      )
      and titol != 'El Lazarillo de Tormes';
insert into autor_llibre
   select (
      select id
        from autor
       where nom = 'Manuel'
   ),
          id
     from llibre
    where id_editorial = (
      select id
        from editorial
       where nom = 'LaButxaca'
   );
insert into autor_llibre
   select (
      select id
        from autor
       where nom = 'Joanne'
   ),
          id
     from llibre
    where id_editorial = (
         select id
           from editorial
          where nom = 'Planeta'
      )
      and titol like 'Harry%';
insert into autor_llibre
   select (
      select id
        from autor
       where nom = 'Stephen'
   ),
          id
     from llibre
    where id_editorial = (
         select id
           from editorial
          where nom = 'Planeta'
      )
      and titol not like 'Harry%';
insert into autor_llibre
   select (
      select id
        from autor
       where nom = 'Owen'
   ),
          id
     from llibre
    where id_editorial = (
         select id
           from editorial
          where nom = 'Planeta'
      )
      and titol not like 'Harry%';

insert into llibre_genere
   select id_llibre,
          'Poesia'
     from autor_llibre
    where id_autor = (
      select id
        from autor
       where nom = 'Federico'
   );
insert into llibre_genere
   select id_llibre,
          'Fantasia'
     from autor_llibre
    where id_autor = (
      select id
        from autor
       where nom = 'Joanne'
   );
insert into llibre_genere
   select id_llibre,
          'Aventura'
     from autor_llibre
    where id_autor = (
         select id
           from autor
          where nom = 'Manuel'
      )
      and rownum < 3;
insert into llibre_genere
   select id_llibre,
          'Misteri'
     from autor_llibre
    where id_autor = (
         select id
           from autor
          where nom = 'Manuel'
      )
      and id_llibre not in (
      select id_llibre
        from llibre_genere
   );

delete from llibre_genere
 where id_llibre = (
   select id
     from llibre
    where titol = 'Totes les bèsties de càrrega'
);
delete from llibre_genere
 where id_llibre = (
   select id
     from llibre
    where titol = 'Harry Potter i el calze de foc'
);
delete from llibre_genere
 where id_llibre = (
   select id
     from llibre
    where titol = 'Bellas durmientes'
);
-- 1. Inserir 2 editorials
insert into editorial ( nom ) values ( 'Editorial Alpha' );
insert into editorial ( nom ) values ( 'Editorial Beta' );

-- 2. Inserir 2 llibres, cada un d’una editorial diferent
insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial,
   id_sequela
) values ( 'Llibre A',
           2022,
           5,
           1,
           null );

insert into llibre (
   titol,
   an,
   exemplars,
   id_editorial,
   id_sequela
) values ( 'Llibre B',
           2023,
           3,
           2,
           null );

-- 3. Inserir 3 autors
insert into autor (
   nom,
   cognoms,
   data_naix,
   nacionalitat
) values ( 'Autor1',
           'Cognoms1',
           to_date('1980-01-01','YYYY-MM-DD'),
           'ESP' );

insert into autor (
   nom,
   cognoms,
   data_naix,
   nacionalitat
) values ( 'Autor2',
           'Cognoms2',
           to_date('1990-06-15','YYYY-MM-DD'),
           'FRA' );

insert into autor (
   nom,
   cognoms,
   data_naix,
   nacionalitat
) values ( 'Autor3',
           'Cognoms3',
           to_date('1985-09-23','YYYY-MM-DD'),
           'USA' );

-- 4. Vincular llibres i autors
-- Un llibre amb un autor
insert into autor_llibre (
   id_autor,
   id_llibre
) values ( 1,
           1 );

-- L’altre llibre amb dos autors
insert into autor_llibre (
   id_autor,
   id_llibre
) values ( 2,
           2 );
insert into autor_llibre (
   id_autor,
   id_llibre
) values ( 3,
           2 );

-- Verificar les dades amb SELECT
-- Editorials
select *
  from editorial;

-- Llibres
select *
  from llibre;

-- Autors
select *
  from autor;

-- Relació autor-llibre
select *
  from autor_llibre;
-- 1. Consulta els noms dels llibres i el nom de la seva editorial
select llibre.titol,
       editorial.nom
  from llibre
  join editorial
on llibre.id_editorial = editorial.id;
-- 2. Repeteix la consulta anterior excloent l’editorial "Planeta"
select llibre.titol,
       editorial.nom
  from llibre
  join editorial
on llibre.id_editorial = editorial.id
 where editorial.nom <> 'Planeta';

-- 3. Consulta els noms dels llibres i el nom del seu autor
select llibre.titol,
       autor.nom,
       autor.cognoms
  from llibre
  join llibre_autor
on llibre.id = llibre_autor.id_llibre
  join autor
on llibre_autor.id_autor = autor.id;

-- 4. Repeteix la consulta anterior, però només mostrant aquells llibres d’un any anterior a 1950
select llibre.titol,
       autor.nom,
       autor.cognoms
  from llibre
  join llibre_autor
on llibre.id = llibre_autor.id_llibre
  join autor
on llibre_autor.id_autor = autor.id
 where llibre.an < 1950;