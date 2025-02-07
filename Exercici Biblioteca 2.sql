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

-- Alterar les dades
-- El llibre amb dos autors ara només en tindrà un
delete from autor_llibre
 where id_autor = 3
   and id_llibre = 2;

-- Canviar un llibre d’editorial, deixant una editorial sense llibres
update llibre
   set
   id_editorial = 1
 where id = 2;

-- Eliminar l’editorial sense llibres
delete from editorial
 where id = 2;

-- Un llibre s’ha esgotat: posar exemplars a 0
update llibre
   set
   exemplars = 0
 where id = 1;

-- Crear una taula nova LLIBRES_ESGOTATS amb la mateixa estructura que LLIBRE
create table llibres_esgotats
   as
      select *
        from llibre
       where 1 = 0;

-- Copiar els llibres amb exemplars == 0 a la nova taula
insert into llibres_esgotats
   select *
     from llibre
    where exemplars = 0;

-- Eliminar els llibres sense exemplars de la taula LLIBRE
-- Primer eliminar registres de AUTOR_LLIBRE que hi facin referència
delete from autor_llibre
 where id_llibre in (
   select id
     from llibre
    where exemplars = 0
);

-- Després eliminar els llibres
delete from llibre
 where exemplars = 0;

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

-- Llibres esgotats
select *
  from llibres_esgotats;
