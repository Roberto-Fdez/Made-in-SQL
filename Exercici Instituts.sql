create table alumne (
   n_exp_alumne number(9) primary key,
   nom          varchar2(50),
   llinatge1    varchar2(50),
   llinatge2    varchar2(50),
   data_naix    date
);
create table professor (
   dni     varchar2(9) primary key,
   nom     varchar2(50),
   telefon number(9)
);
create table matricula (
   n_exp_alumne  number(9),
   num_matricula number(9) primary key,
   foreign key ( n_exp_alumne )
      references alumne ( n_exp_alumne ),
   year          date
);
create table assignatura (
   codi          number(9) primary key,
   nom           varchar2(50),
   dni_professor varchar2(9),
   foreign key ( dni_professor )
      references professor ( dni )
);
create table assig_matr (
   num_matricula    number(9) primary key,
   foreign key ( num_matricula )
      references matricula ( num_matricula ),
   codi_assignatura number(9),
   foreign key ( codi_assignatura )
      references assignatura ( codi )
);
insert into alumne (
   n_exp_alumne,
   nom,
   llinatge1,
   llinatge2
) values ( '9283',
           'Ricardo',
           'Mendoza',
           'Marin' );
insert into matricula (
   n_exp_alumne,
   num_matricula
) values ( '9283',
           '12' );
insert into matricula (
   n_exp_alumne,
   num_matricula
) values ( '9183',
           '23' );
insert into assignatura ( codi ) values ( '24' );
insert into assig_matr ( codi_assignatura ) values ( '24' );