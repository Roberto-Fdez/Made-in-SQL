create table llibres (
   codi      number
      generated as identity,
   titol     varchar(60) not null,
   autor     varchar(30),
   editorial varchar(15),
   preu      number(5,2),
   primary key ( codi )
);

insert into llibres (
   titol,
   autor,
   editorial,
   preu
) values ( 'El principito',
           'Antonine de Saint',
           'Planeta',
           15 );
insert into llibres (
   titol,
   autor,
   editorial,
   preu
) values ( 'La Cocinera de Castamar',
           'Fernando J. Múñez',
           'Planeta',
           40 );
insert into llibres (
   titol,
   autor,
   editorial,
   preu
) values ( 'Yerma',
           'Federico García Lorca',
           'Planeta',
           40 );
insert into llibres (
   titol,
   autor,
   editorial,
   preu
) values ( 'Cómo hacer que te pasen cosas buenas',
           'Marián Rojas',
           'Espasa',
           18.20 );
insert into llibres (
   titol,
   autor,
   editorial,
   preu
) values ( 'Mecanoscrit del segon origen',
           'Manuel de Pedrolo',
           'Espasa',
           15 );
insert into llibres (
   titol,
   autor,
   editorial,
   preu
) values ( 'Magia y enigma',
           'Henry Kamen',
           'Espasa',
           22.20 );
insert into llibres (
   titol,
   autor,
   editorial,
   preu
) values ( 'Matilda',
           'Roald Dahl',
           'Alfaguara',
           36.40 );
insert into llibres (
   titol,
   autor,
   editorial,
   preu
) values ( 'Momo',
           'Michael Ende',
           'Alfaguara',
           30.80 );
insert into llibres (
   titol,
   autor,
   editorial,
   preu
) values ( 'Mujercitas',
           'Louisa May Alcott',
           'Alfaguara',
           45.00 );
insert into llibres (
   titol,
   autor,
   editorial,
   preu
) values ( 'La historia interminable',
           'Michael Ende',
           'Alfaguara',
           46.00 );
insert into llibres (
   titol,
   autor,
   editorial,
   preu
) values ( 'Peter Pan',
           'J.M. Barrie',
           'Alfaguara',
           null );

select *
  from llibres;
  -- 1. Llistar la quantitat de llibres agrupats per editorial:
select editorial,
       count(*) as quantitat
  from llibres
 group by editorial;

-- 2. Llistar la quantitat de llibres agrupats per editorial, però només els grups editorials que tenen més de quatre llibres:
select editorial,
       count(*) as quantitat
  from llibres
 group by editorial
having count(*) > 4;

-- 3. Llistar la mitjana dels preus dels llibres agrupats per editorial i ordenats per preu descendent:
select editorial,
       round(
          avg(preu),
          2
       ) as mitjana_preu
  from llibres
 group by editorial
 order by mitjana_preu desc;

-- 4. Llistar la mitjana dels preus dels llibres agrupats per editorial, però només aquells la mitjana dels quals superi els 25 euros:
select editorial,
       round(
          avg(preu),
          2
       ) as mitjana_preu
  from llibres
 group by editorial
having avg(preu) > 25;

-- 5. Llistar nombre de llibres agrupats per editorial sense tenir en compte l'editorial "Planeta":
select editorial,
       count(*) as quantitat
  from llibres
 where editorial != 'Planeta'
 group by editorial;

-- 6. Llistar nombre de llibres agrupats per editorial sense tenir en compte l'editorial "Planeta" ni els llibres amb preu nul:
select editorial,
       count(*) as quantitat
  from llibres
 where editorial != 'Planeta'
   and preu is not null
 group by editorial;

-- 7. Llistar mitjana dels preus agrupats per editorial d'aquelles editorials que tenen més de 2 llibres:
select editorial,
       round(
          avg(preu),
          2
       ) as mitjana_preu
  from llibres
 group by editorial
having count(*) > 2;

-- 8. Llistar el preu més gran d'un llibre per editorial i ordenat per preu descendent:
select editorial,
       max(preu) as preu_maxim
  from llibres
 group by editorial
 order by preu_maxim desc;

-- 9. Llistar el preu més gran d'un llibre per editorial d'aquelles que tinguin, almenys, un llibre que superi els 30 euros:
select editorial,
       max(preu) as preu_maxim
  from llibres
 group by editorial
having max(preu) > 30;

-- 10. Llistar el títol i l'autor dels llibres que comencin per la lletra "M" i l'autor dels quals contingui la lletra "h":
select titol,
       autor
  from llibres
 where titol like 'M%'
   and autor like '%h%';

-- 11. Llistar la quantitat de llibres agrupats per autor, ordenat per quantitat descendent:
select autor,
       count(*) as quantitat
  from llibres
 group by autor
 order by quantitat desc;

-- 12. Llista les diferents lletres inicials dels titols dels llibres i el preu promig dels llibres amb un títol que comenci per aquesta lletra. Ordena per preu ascendent:
select substr(
   titol,
   1,
   1
) as lletra_inicial,
       round(
          avg(preu),
          2
       ) as preu_promig
  from llibres
 group by substr(
   titol,
   1,
   1
)
 order by preu_promig asc;