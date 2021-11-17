/*==============================================================*/
/* Table: DIM_DRON                                           */
/*==============================================================*/
create table DIM_DRON
(
   DRON_ID              INT4           not null,
   DRON_FECHAOPERACION  DATE           null,
   DRON_GRAB            INT4           not null,
   primary key (DRON_ID)
);
/*==============================================================*/
/* Table: DIM_TIEMPO                                          */
/*==============================================================*/
Create table DIM_TIEMPO
(
   DRONTIME_ID          INT4          not null,
   DRON_ID              INT4          not null,
   DRONTIME_TIEMPODIA   INT4          null,
   DRONTIME_TIEMPOTOTAL INT4          not null,
   primary key (DRONTIME_ID)
);
/*==============================================================*/
/* Table: DIM_EMPLEADO                                         */
/*==============================================================*/
create table DIM_EMPLEADO (
   EMPLEADO_ID          INT4                 not null,
   EMPLEADO_NOMBRE      CHAR(15)             null,
   EMPLEADO_APELLIDO    CHAR(15)             null,
   EMPLEADO_CI          CHAR(20)             null,
   primary key (EMPLEADO_ID)
);
/*==============================================================*/
/* Table: HEC_OPERACION                                        */
/*==============================================================*/
create table HEC_OPERACION
(
   DRON_ID              INT4           not null,
   DRONTIME_ID          INT4          not null,
   EMPLEADO_ID          INT4                 not null,
   HECHO                smallint,
   primary key (DRON_ID, DRONTIME_ID, EMPLEADO_ID)
);

alter table HEC_OPERACION add constraint FK_DIM_DRON_HEC_OPERACION foreign key (DRON_ID)
      references DIM_DRON (DRON_ID) on delete restrict on update restrict;

alter table HEC_OPERACION add constraint FK_DIM_EMPLEADO_HEC_OPERACION foreign key (EMPLEADO_ID)
      references DIM_EMPLEADO (EMPLEADO_ID) on delete restrict on update restrict;

alter table HEC_OPERACION add constraint FK_DIM_TIEMPO_HEC_OPERACION foreign key (DRONTIME_ID)
      references DIM_TIEMPO (DRONTIME_ID) on delete restrict on update restrict;
