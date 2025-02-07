-- Creació de la taula PERSONA
create table persona (
   dni         varchar2(9) primary key,
   nom         varchar2(50),
   llinatges   varchar2(100),
   adreca      varchar2(150),
   codi_postal varchar2(5) check ( codi_postal != '07430' ),
   telefon     varchar2(15),
   data_alta   date
);

-- Creació de la taula VEHICLE
create table vehicle (
   matricula   varchar2(10) primary key,
   marca       varchar2(50),
   model       varchar2(50) check ( model != 'RB19' ),
   dni_persona varchar2(9),
   constraint fk_dni_persona foreign key ( dni_persona )
      references persona ( dni )
);

-- Creació de la taula MULTA
create table multa (
   codi              number primary key,
   data_hora         timestamp,
   lloc              varchar2(100),
   import            number check ( import >= 100 ),
   matricula_vehicle varchar2(10),
   constraint fk_matricula_vehicle foreign key ( matricula_vehicle )
      references vehicle ( matricula )
);

-- Creació de la taula ACCIDENT
create table accident (
   codi number primary key,
   data date,
   lloc varchar2(100),
   hora timestamp
);

-- Creació de la taula ACCIDENT_VEHICLE
create table accident_vehicle (
   matricula_vehicle    varchar2(10),
   codi_accident        number,
   informe_participacio varchar2(500),
   primary key ( matricula_vehicle,
                 codi_accident ),
   constraint fk_matricula_accident foreign key ( matricula_vehicle )
      references vehicle ( matricula ),
   constraint fk_codi_accident foreign key ( codi_accident )
      references accident ( codi )
);
insert into persona values ( '87493274G',
                             'Francisco',
                             'Gómez',
                             'francisquin@gmail.com',
                             '08324',
                             '667263164',
                             date '2022-10-18' );
insert into persona values ( '34234152H',
                             'Paco',
                             'Cuesta',
                             'PacoC@gmail.com',
                             '09153',
                             '773892716',
                             date '2021-10-14' );
insert into vehicle values ( '3241 GHJ',
                             'Jeep',
                             'Patriot',
                             '87493274G' );
insert into vehicle values ( '5427 HAP',
                             'Toyota',
                             'Corolla',
                             '34234152H' );
insert into vehicle values ( '4222 JKO',
                             'Mazda',
                             'RX7',
                             '34234152H' );
insert into multa values ( '1',
                           timestamp '2024-12-15 18:49:50.124',
                           'Palma',
                           140,
                           '5427 HAP' );
insert into accident values ( '1',
                              date '2024-12-15',
                              'Palma',
                              timestamp '2024-12-15 18:45:50.124' );
insert into accident_vehicle values ( '5427 HAP',
                                      '1',
                                      'Choque lateral con otro vehiculo debido a que se saltó un ceda el paso.' );
insert into accident_vehicle values ( '3241 GHJ',
                                      '1',
                                      'Colisión lateral causada por otro vehículo que incumplió una normativa de prioridad de paso.'
                                      );