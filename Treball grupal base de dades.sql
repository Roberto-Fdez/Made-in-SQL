-- Taula Moto
create table moto (
   tipo      varchar(50),
   modelo    varchar(50),
   matricula char(10) primary key
);
-- Taula Persona
create table persona (
   dni            char(9) primary key,
   nom            varchar(100),
   conductor      boolean,
   matricula_moto char(10),
   foreign key ( matricula_moto )
      references moto ( matricula ),
   acompanante    char(9),
   foreign key ( acompanante )
      references persona ( dni )
);
-- Taula Viaje
create table viaje (
   id_viaje       int primary key,
   dia_inicio     date,
   dia_final      date,
   donde_va       varchar(100),
   de_donde_viene varchar(100),
   dni_persona    char(9),
   matricula_moto char(10),
   foreign key ( dni_persona )
      references persona ( dni ),
   foreign key ( matricula_moto )
      references moto ( matricula )
);
-- Taula Equipaje
create table equipaje (
   id_equipaje    int primary key,
   peso           decimal(10,2),
   dni_persona    char(9),
   matricula_moto char(10),
   foreign key ( dni_persona )
      references persona ( dni ),
   foreign key ( matricula_moto )
      references moto ( matricula )
);