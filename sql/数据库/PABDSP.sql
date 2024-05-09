/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2024/4/25 15:17:41                           */
/*==============================================================*/


/*==============================================================*/
/* Table: APIKey                                                */
/*==============================================================*/
create table APIKey
(
   keyId                int not null  comment '',
   appId                int not null  comment '',
   apiId                int not null  comment '',
   primary key (keyId)
);

/*==============================================================*/
/* Table: DataSource                                            */
/*==============================================================*/
create table DataSource
(
   dataSourceId         int not null auto_increment  comment '',
   dataSourceName       varchar(254) not null  unique  comment '',
   dataSourceDescription text  comment '',
   dataSourceURL        varchar(254) not null  comment '',
   createTime           datetime  comment '',
   updateTime           datetime  comment '',
   primary key (dataSourceId),
   key AK_Identifier_2 (dataSourceName)
);

/*==============================================================*/
/* Table: appDeveloper                                          */
/*==============================================================*/
create table appDeveloper
(
   userId               int not null  comment '自增',
   appId                int not null  comment '',
   primary key (userId, appId)
);

/*==============================================================*/
/* Table: admin                                                 */
/*==============================================================*/
create table admin
(
   adminId              int not null auto_increment  comment '',
   adminAccount         varchar(254) not null  unique  comment '',
   adminPassword        varchar(254) not null  comment '',
   primary key (adminId),
   key AK_Identifier_2 (adminAccount)
);

/*==============================================================*/
/* Table: api                                                   */
/*==============================================================*/
create table api
(
   apiId                int not null auto_increment  comment '',
   url                  varchar(254) not null  unique  comment '',
   requestContent       varchar(254) not null  comment '',
   responseContent      varchar(254) not null  comment '',
   content              text  comment '',
   times                int not null  comment '',
   primary key (apiId),
   key AK_Identifier_2 (url)
);

/*==============================================================*/
/* Table: app                                                   */
/*==============================================================*/
create table app
(
   appId                int not null auto_increment  comment '',
   appName              varchar(254) not null  unique  comment '',
   appContent           varchar(254)  comment '',
   primary key (appId),
   key AK_Identifier_2 (appName)
);

/*==============================================================*/
/* Table: city                                                  */
/*==============================================================*/
create table city
(
   cityId               int not null auto_increment  comment '',
   cityName             varchar(254) not null  unique  comment '',
   primary key (cityId),
   key AK_Identifier_2 (cityName)
);

/*==============================================================*/
/* Table: company                                               */
/*==============================================================*/
create table company
(
   companyId            int not null auto_increment  comment '自增',
   companyName          varchar(254) not null  unique  comment '',
   minStaffNumber       int not null default 0  comment '',
   maxStaffNumber       int default 0  comment '',
   financingSize        varchar(254)  comment '',
   primary key (companyId),
   key AK_Identifier_2 (companyName)
);

/*==============================================================*/
/* Table: developer                                             */
/*==============================================================*/
create table developer
(
   userId               int not null  comment '自增',
   black                bool not null default false  comment 'true拉黑flase未拉黑',
   primary key (userId)
);

/*==============================================================*/
/* Table: importantData                                         */
/*==============================================================*/
create table importantData
(
   regionId             int not null auto_increment  comment '地区包括我国省、自治区、直辖市、特别行政区为单位。特别注意台湾省 
             自增',
   jobTypeId            int not null  comment '',
   regionName           varchar(254) not null  unique  comment '',
   perSalary            int not null  comment '',
   jobNum               int not null default 0  comment '以万为单位',
   primary key (regionId),
   key AK_Identifier_2 (regionName)
);

/*==============================================================*/
/* Table: job                                                   */
/*==============================================================*/
create table job
(
   jobId                int not null auto_increment  comment '自增',
   jobTypeId            int not null  comment '',
   cityId               int not null  comment '',
   companyId            int not null  comment '自增',
   jobName              varchar(254)  not null  comment '',
   minEd                int not null  comment '1专2本3研究生0无要求',
   salary               int not null default 0  comment '',
   requiredSkills       varchar(254)  comment '',
   url                  varchar(254)  not null  comment '',
   primary key (jobId)
);

/*==============================================================*/
/* Table: jobType                                               */
/*==============================================================*/
create table jobType
(
   jobTypeId            int not null auto_increment  comment '',
   typeName             varchar(254) not null  comment '',
   primary key (jobTypeId)
);

/*==============================================================*/
/* Table: log                                                   */
/*==============================================================*/
create table log
(
   logId                int not null auto_increment  comment '',
   taskId               int not null  comment '',
   startTime            datetime not null  comment '',
   endTime              datetime not null  comment '',
   status               enum('0', '1') not null  comment '1成功0失败',
   errorMessage         text not null  comment '',
   createTime           datetime  comment '',
   updateTime           datetime  comment '',
   primary key (logId)
);

/*==============================================================*/
/* Table: major                                                 */
/*==============================================================*/
create table major
(
   majorId              int not null auto_increment  comment '',
   majorName            varchar(254) not null  comment '',
   primary key (majorId)
);

/*==============================================================*/
/* Table: task                                                  */
/*==============================================================*/
create table task
(
   taskId               int not null auto_increment  comment '',
   dataSourceId         int not null  comment '',
   taskName             varchar(254) not null  unique  comment '',
   taskType             enum('0', '1')  not null  comment '0定时1手动',
   cronExperssion       int not null  comment '',
   startTime            datetime not null  comment '',
   endTime              datetime not null  comment '',
   createTime           datetime  comment '',
   updateTime           datetime  comment '',
   primary key (taskId),
   key AK_Identifier_2 (taskName)
);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   userId               int not null auto_increment  comment '自增',
   majorId              int not null  comment '',
   account              varchar(254) not null  unique  comment '',
   password             varchar(254) not null  comment '',
   name                 varchar(254)  comment '',
   gender               enum('0', '1')  not null default '0'  comment '0男1女',
   age                  int default 0  comment '',
   educationalQualification int default 1  comment '1专科2本科3研究生0以下',
   email                varchar(254) not null  comment '',
   question             varchar(254) not null  comment '密保问题',
   answer               varchar(254) not null  comment '',
   primary key (userId),
   key AK_Identifier_2 (account)
);

/*==============================================================*/
/* Table: reapikeycontrol                                       */
/*==============================================================*/
create table reapikeycontrol
(
keyId                  BIGINT  not null  comment '',
appId                  BIGINT  comment '',
apikey                 varchar(254)  comment '',
userId                 BIGINT  comment '',
datetime               TIMESTAMP  comment '',
times                  BIGINT  comment '',
primary key (keyId)
);

alter table APIKey add constraint FK_APIKEY_RELATIONS_APP foreign key (appId)
      references app (appId) on delete restrict on update restrict;

alter table APIKey add constraint FK_APIKEY_RELATIONS_API foreign key (apiId)
      references api (apiId) on delete restrict on update restrict;

alter table appDeveloper add constraint FK_RELATION_RELATIONS_DEVELOPE foreign key (userId)
      references developer (userId) on delete restrict on update restrict;

alter table appDeveloper add constraint FK_RELATION_RELATIONS_APP foreign key (appId)
      references app (appId) on delete restrict on update restrict;

alter table developer add constraint FK_DEVELOPE_RELATIONS_USER foreign key (userId)
      references user (userId) on delete restrict on update restrict;

alter table importantData add constraint FK_IMPORTAN_RELATIONS_JOBTYPE foreign key (jobTypeId)
      references jobType (jobTypeId) on delete restrict on update restrict;

alter table job add constraint FK_JOB_RELATIONS_JOBTYPE foreign key (jobTypeId)
      references jobType (jobTypeId) on delete restrict on update restrict;

alter table job add constraint FK_JOB_RELATIONS_CITY foreign key (cityId)
      references city (cityId) on delete restrict on update restrict;

alter table job add constraint FK_JOB_POSITION__COMPANY foreign key (companyId)
      references company (companyId) on delete restrict on update restrict;

alter table log add constraint FK_LOG_RELATIONS_TASK foreign key (taskId)
      references task (taskId) on delete restrict on update restrict;

alter table task add constraint FK_TASK_RELATIONS_DATASOUR foreign key (dataSourceId)
      references DataSource (dataSourceId) on delete restrict on update restrict;

alter table user add constraint FK_USER_ASSOCIATI_MAJOR foreign key (majorId)
      references major (majorId) on delete restrict on update restrict;

