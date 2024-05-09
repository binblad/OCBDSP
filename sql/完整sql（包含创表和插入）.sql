create database ocbdsp;
use ocbdsp;

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

/****************/

INSERT INTO city (cityName) VALUES
                                ('北京'),('天津'),('上海'),('重庆'),
                                ('石家庄'),('唐山'),('秦皇岛'),('邯郸'),('邢台'),('保定'),('张家口'),('承德'),('沧州'),('廊坊'),('衡水'),
                                ('太原'),('大同'),('阳泉'),('长治'),('晋城'),('朔州'),('晋中'),('运城'),('忻州'),('临汾'),('吕梁'),
                                ('呼和浩特'),('包头'),('乌海'),('赤峰'),('通辽'), ('鄂尔多斯'),('呼伦贝尔'),('巴彦淖尔'),('乌兰察布'),('兴安盟'), ('锡林郭勒盟'),('阿拉善盟'),
                                ('沈阳'),('大连'),('鞍山'),('抚顺'),('本溪'),('丹东'),('锦州'),('营口'),('阜新'),('辽阳'),('盘锦'),('铁岭'),('朝阳'),('葫芦岛'),
                                ('长春'),('吉林'),('四平'),('辽源'),('通化'),('白山'),('松原'),('白城'),('延边朝鲜族自治州'),
                                ('哈尔滨'),('齐齐哈尔'),('鸡西'),('鹤岗'),('双鸭山'),('大庆'), ('伊春'),('佳木斯'),('七台河'),('牡丹江'),('黑河'), ('绥化'),('大兴安岭地区'),
                                ('南京'),('无锡'),('徐州'),('常州'),('苏州'),('南通'), ('连云港'),('淮安'),('盐城'),('扬州'),('镇江'),('泰州'), ('宿迁'),
                                ('杭州'),('宁波'),('温州'),('嘉兴'),('湖州'),('绍兴'), ('金华'),('衢州'),('舟山'),('台州'),('丽水'),
                                ('合肥'),('芜湖'),('蚌埠'),('淮南'),('马鞍山'), ('淮北'),('铜陵'),('安庆'),('黄山'),('滁州'),('阜阳'),('宿州'), ('六安'),('亳州'),('池州'),('宣城'),
                                ('福州'),('厦门'),('莆田'),('三明'),('泉州'), ('漳州'),('南平'),('龙岩'),('宁德'),
                                ('南昌'),('景德镇'),('萍乡'),('九江'),('新余'), ('鹰潭'),('赣州'),('吉安'),('宜春'),('抚州'),('上饶'),
                                ('济南'),('青岛'),('淄博'),('枣庄'),('东营'), ('烟台'),('潍坊'),('济宁'),('泰安'),('威海'),('日照'),('莱芜'), ('临沂'),('德州'),('聊城'),('滨州'),('菏泽'),
                                ('郑州'),('开封'),('洛阳'),('平顶山'),('安阳'), ('鹤壁'),('新乡'),('焦作'),('济源'),('濮阳'),('许昌'), ('漯河'),('三门峡'),('商丘'),('周口'),('驻马店'), ('南阳'),
                                ('武汉'),('黄石'),('十堰'),('宜昌'),('襄阳'), ('鄂州'),('荆门'),('孝感'),('荆州'),('黄冈'),('咸宁'), ('随州'),('恩施土家族苗族自治州'),('仙桃'), ('潜江'),('天门'),('神农架林区'),
                                ('长沙'),('株洲'),('湘潭'),('衡阳'),('邵阳'), ('岳阳'),('常德'),('张家界'),('益阳'),('郴州'),('永州'), ('怀化'),('娄底'),('湘西土家族苗族自治州'),
                                ('广州'),('深圳'),('珠海'),('汕头'), ('韶关'),('河源'),('梅州'),('惠州'),('汕尾'),('东莞'), ('中山'),('江门'),('佛山'),('云浮'),('潮州'), ('揭阳'),('茂名'),('肇庆'),
                                ('南宁'),('柳州'),('桂林'),('梧州'),('北海'), ('防城港'),('钦州'),('贵港'),('玉林'),('百色'), ('贺州'),('河池'),('来宾'),('崇左'),
                                ('海口'),('三亚'),('三沙'),('儋州'),('五指山'), ('文昌'),('琼海'),('万宁'),('东方'),('定安'), ('屯昌'),('澄迈'),('临高'),('白沙黎族自治县'), ('昌江黎族自治县'),('乐东黎族自治县'),('陵水黎族自治县'), ('保亭黎族苗族自治县'),('琼中黎族苗族自治县'),
                                ('成都'),('自贡'),('攀枝花'),('泸州'),('德阳'), ('绵阳'),('广元'),('遂宁'),('内江'),('乐山'), ('南充'),('眉山'),('宜宾'),('广安'),('达州'), ('雅安'),('巴中'),('资阳'),('阿坝藏族羌族自治州'), ('甘孜藏族自治州'),('凉山彝族自治州'),
                                ('贵阳'),('遵义'),('安顺'),('毕节'),('六盘水'), ('铜仁'),('黔西南布依族苗族自治州'),('黔东南苗族侗族自治州'), ('黔南布依族苗族自治州'),
                                ('昆明'),('曲靖'),('玉溪'),('保山'),('昭通'), ('丽江'),('普洱'),('临沧'),('楚雄彝族自治州'), ('红河哈尼族彝族自治州'),('文山壮族苗族自治州'), ('西双版纳傣族自治州'),('大理白族自治州'), ('德宏傣族景颇族自治州'),('怒江傈僳族自治州'), ('迪庆藏族自治州'),
                                ('拉萨'),('日喀则'),('昌都'),('林芝'), ('山南'),('那曲'),('阿里'),
                                ('西宁'),('海东'),('海北藏族自治州'), ('黄南藏族自治州'),('海南藏族自治州'), ('果洛藏族自治州'),('玉树藏族自治州'), ('海西蒙古族藏族自治州'),
                                ('银川'),('石嘴山'),('吴忠'), ('固原'),('中卫'),
                                ('乌鲁木齐'),('克拉玛依'),
('西安'),('咸阳'),('铜川'),
('宝鸡'),
('渭南'),
('延安'),
('汉中'),
('榆林'),
('安康'),
('商洛');

/******************/

INSERT INTO company (companyName, minStaffNumber, maxStaffNumber, financingSize)
VALUES
('南通电信', 1000, 9999, NULL),
('新时代智云', 20, 99, '未融资'),
('润辉投资', 20, 99, NULL),
('阿里巴巴集团', 10000, NULL, '已上市'),
('影核医疗', 100, 499, 'B轮'),
('数狐科技', 0, 20, '未融资'),
('华为', 10000, NULL, '不需要融资'),
('招联消费金融', 1000, 9999, '不需要融资'),
('诸云科技', 100, 499, '不需要融资'),
('兀几视界', 0, 20, '不需要融资'),
('涂鸦智能', 1000, 9999, '已上市'),
('协达科技', 20, 99, '未融资'),
('飞沿技术', 0, 20, NULL),
('易同云网', 20, 99, '未融资'),
('芝麻开享', 20, 99, '未融资'),
('华境清治', 20, 99, '不需要融资'),
('蓝高信息', 0, 20, NULL),
('广州睿泰智能', 20, 99, '未融资'),
('华为终端有限公司', 10000, NULL, '不需要融资'),
('奇虎360', 1000, 9999, '已上市'),
('迈越软件', 100, 499, '未融资'),
('今日头条', 10000, NULL, '未融资'),
('北京骏德卓越科技', 20, 99, '天使轮'),
('天阳科技', 1000, 9999, '已上市'),
('博蓝科技', 20, 99, '未融资'),
('永好科技', 20, 99, NULL),
('奇点网络', 0, 20, '未融资'),
('魔方互联', 20, 99, '未融资'),
('杭州一秒达', 20, 99, '未融资'),
('西安华为', 10000, NULL, '未融资'),
('易客创新(泉州)', 100, 499, '未融资'),
('浙江量世', 20, 99, '未融资'),
('上海咖贝', 20, 99, NULL),
('硒栖源商贸', 100, 499, NULL),
('新博科技', 20, 99, '未融资'),
('海南宜萌网络科技', 20, 99, NULL),
('中琪华安', 0, 20, '天使轮'),
('数灵达信息技术', 0, 20, NULL),
('比飞科技', 20, 99, NULL),
('哈啰普惠', 1000, 9999, 'D轮及以上'),
('成都开放大学', 100, 499, 'D轮及以上'),
('云诺荣智', 0, 20, NULL),
('高诚科技', 100, 499, NULL),
('长策信息', 20, 99, '未融资'),
('邦睿科技', 100, 499, 'C轮'),
('亿众互动', 20, 99, '天使轮'),
('山东氢软网络科技', 20, 99, NULL),
('思捷软件', 20, 99, '未融资'),
('澜澈科技', 0, 20, '不需要融资'),
('华泰证券', 10000, NULL, '已上市'),
('沃瑞特科技有限公司', 20, 99, '未融资'),
('慧影', 0, 20, '未融资'),
('超级通网络', 20, 99, '天使轮'),
('趣点科技', 20, 99, '不需要融资'),
('西安晶云智行软件', 20, 99, NULL),
('梅沙科技', 20, 99, '不需要融资'),
('聚晟', 20, 99, NULL),
('辽宁瑞丰', 20, 99, NULL),
('北京字节跳动', 10000, NULL, '不需要融资'),
('惠州徕霆英诺电子', 20, 99, NULL),
('蚂蚁集团', 10000, NULL, 'D轮及以上'),
('智网科技', 100, 499, '未融资'),
('中国电信北京研究院', 100, 499, NULL),
('艾科技术', 100, 499, '未融资'),
('汉克时代', 1000, 9999, '不需要融资'),
('易签链', 20, 99, '不需要融资'),
('卓尔信科', 20, 99, '未融资'),
('容智信息', 100, 499, 'B轮'),
('山西云盾', 0, 20, '未融资'),
('超豪', 20, 99, NULL),
('百助', 100, 499, '未融资'),
('上海类星', 20, 99, NULL),
('众趣科技', 100, 499, 'B轮'),
('模态跃迁', 20, 99, NULL),
('数信智能(南阳)', 0, 20, '未融资'),
('锐骐', 0, 20, NULL),
('中电金信', 10000, NULL, 'B轮'),
('滴滴出行', 1000, 9999, 'D轮及以上'),
('鸣阳伟业', 0, 20, NULL),
('北京思迈特', 20, 99, '不需要融资'),
('腾讯', 10000, NULL, '不需要融资'),
('原始人科技', 20, 99, '未融资'),
('新东方', 10000, NULL, '已上市'),
('羲牛智能', 20, 99, '未融资'),
('引元', 20, 99, '不需要融资'),
('夜行侠网络', 0, 20, NULL),
('马蜂窝', 1000, 9999, 'D轮及以上'),
('图南电子', 100, 499, 'D轮及以上'),
('大牛认知', 20, 99, NULL),
('微众银行', 1000, 9999, '不需要融资'),
('武汉紫枫叶科技', 0, 20, '未融资'),
('有赞', 1000, 9999, '已上市'),
('胜赛', 0, 20, NULL),
('登马', 0, 20, NULL),
('八九科技', 20, 99, NULL),
('融信惠科技有限公司', 0, 20, '未融资'),
('普树咖啡', 20, 99, '未融资'),
('顺丰速运', 10000, NULL, '已上市'),
('添翼行科技', 20, 99, NULL),
('快医科技', 20, 99, '不需要融资'),
('萨普莱斯', 20, 99, '未融资'),
('碧桂园集团物业公司', 10000, NULL, NULL),
('辰友科技', 20, 99, NULL),
('妆中集品', 20, 99, '未融资'),
('山东威高讯通信息科技', 20, 99, '不需要融资'),
('华夏数智', 100, 499, '未融资'),
('简联', 20, 99, NULL),
('上海瑞应人才科技', 500, 999, NULL),
('山进', 0, 20, '未融资'),
('广州融大', 20, 99, '未融资'),
('伊元科技', 0, 20, '天使轮'),
('安克创新', 1000, 9999, NULL),
('亿联科技', 20, 99, '未融资'),
('武汉咔芒科技有限公司', 20, 99, NULL),
('杭州今日头条科技', 10000, NULL, NULL),
('零壹比特', 100, 499, '不需要融资'),
('广东世寰智能科技', 100, 499, NULL),
('荣耀终端有限公司', 10000, NULL, '不需要融资'),
('鲸鸣科技', 20, 99, '不需要融资'),
('启明星辰', 1000, 9999, '已上市'),
('陆海统筹研究院', 0, 20, '不需要融资'),
('互创联合', 100, 499, 'D轮及以上'),
('源象科技', 100, 499, '天使轮'),
('朗新科技', 1000, 9999, '已上市'),
('成都银事达', 100, 499, '不需要融资'),
('武汉博瀚鸿', 0, 20, NULL),
('忒亚', 20, 99, '未融资'),
('智源新能', 20, 99, '不需要融资'),
('北京云车探索', 20, 99, 'A轮'),
('先导智能', 10000, NULL, '已上市'),
('百度', 10000, NULL, '已上市'),
('Pacvue 泊客电商', 100, 499, '不需要融资'),
('紧商科技股份有限公司', 100, 499, '不需要融资'),
('智库智能', 100, 499, 'A轮'),
('优优慕课科技有限公司', 0, 20, '未融资'),
('古丽智能', 0, 20, NULL),
('融合', 500, 999, NULL),
('天达智能', 20, 99, 'A轮'),
('德州昭望科技有限公司', 0, 20, NULL),
('铸山煮海', 0, 20, '未融资'),
('医旭云', 20, 99, '未融资'),
('浙江大学工研院普适', 0, 20, '未融资'),
('科大讯飞', 10000, NULL, '已上市'),
('福睿泽', 0, 20, NULL),
('武汉拓智', 0, 20, '未融资'),
('择壹科技', 0, 20, '未融资'),
('上海稳多睿文化传播', 20, 99, 'A轮'),
('阿里云', 10000, NULL, '不需要融资'),
('大神科技', 20, 99, '不需要融资'),
('协通天下', 20, 99, '天使轮'),
('思沃科技', 0, 20, '不需要融资'),
('谷川联行', 500, 999, '不需要融资'),
('百牛网络', 20, 99, '未融资'),
('中软国际', 10000, NULL, '已上市'),
('金钱草', 20, 99, NULL),
('菜鸟网络', 10000, NULL, 'B轮'),
('平熙信息', 100, 499, '未融资'),
('妙同', 20, 99, '天使轮'),
('企泰信息', 20, 99, '不需要融资'),
('伯乐科技', 0, 20, '未融资'),
('北京联合智唯科技', 0, 20, '不需要融资'),
('泉州拓科信息', 20, 99, '未融资'),
('字节跳动', 10000, NULL, 'D轮及以上'),
('德森科技', 20, 99, '不需要融资'),
('首联新阳', 100, 499, '不需要融资'),
('常通软件', 0, 20, '未融资'),
('智道合创', 0, 20, '天使轮'),
('万莎传媒', 20, 99, '未融资'),
('卡歌科技', 20, 99, '未融资'),
('悉望数智', 20, 99, '未融资'),
('江中耀华', 20, 99, '不需要融资'),
('圣大奥维', 20, 99, '未融资'),
('建广数科', 1000, 9999, '未融资'),
('助梦空间', 0, 20, '天使轮'),
('华荣信宁科技有限公司', 20, 99, '未融资'),
('软通动力', 10000, NULL, '已上市'),
('物波', 0, 20, '未融资'),
('精实测控', 500, 999, 'D轮及以上'),
('祥鹏科技公司', 100, 499, NULL),
('湖北中控普惠', 20, 99, '未融资'),
('嘿哟', 0, 20, '天使轮'),
('诚镌', 0, 20, 'A轮'),
('迪锐天成', 0, 20, NULL),
('伍柒必乐', 100, 499, '未融资'),
('华睿科技', 100, 499, NULL),
('上太科技', 20, 99, '不需要融资'),
('神玥软件', 1000, 9999, '已上市'),
('文远知行', 1000, 9999, 'D轮及以上'),
('武汉闻风多奇', 20, 99, 'A轮'),
('迪爱斯', 500, 999, '不需要融资'),
('畅动科技', 20, 99, '未融资'),
('壹场', 20, 99, 'A轮'),
('娄底谙倪信息科技', 0, 20, '不需要融资'),
('好未来', 10000, NULL, '已上市'),
('觅熵科技', 20, 99, NULL),
('联轮科技武汉', 100, 499, 'A轮'),
('远望数字科技', 20, 99, '不需要融资'),
('星屹技术', 20, 99, '未融资'),
('北京龙软', 100, 499, '已上市'),
('仟传', 500, 999, 'B轮'),
('加号科技', 100, 499, '天使轮'),
('封面新闻', 100, 499, '天使轮'),
('山西紫光', 0, 20, NULL),
('凯恩德软件', 20, 99, '未融资'),
('米可世界', 500, 999, '不需要融资'),
('世窗信息', 100, 499, '未融资'),
('哈尔滨沐知其生物科技', 100, 499, '未融资'),
('玖卓科技', 20, 99, '不需要融资'),
('京东集团', 10000, NULL, '已上市'),
('珠海原子', 20, 99, '未融资'),
('创柯添域', 20, 99, '未融资'),
('慈云网络', 0, 20, NULL),
('北京恒华伟业科技', 1000, 9999, '已上市'),
('青谷信息', 100, 499, '未融资'),
('湖南天承信息技术', 20, 99, NULL),
('炎帝生物', 500, 999, '不需要融资'),
('怡图信息', 20, 99, '不需要融资'),
('优迪', 0, 20, '未融资'),
('智慧蜀通', 100, 499, '未融资'),
('鑫品诚', 20, 99, NULL),
('北京艾信', 20, 99, '未融资'),
('高弗特科技', 20, 99, '不需要融资'),
('微策略', 1000, 9999, '已上市'),
('不妄', 0, 20, '天使轮'),
('杭州路威科技有限公司', 20, 99, '不需要融资'),
('中建西部建设', 10000, NULL, '未融资'),
('鸿游科技', 100, 499, '不需要融资'),
('锐捷网络', 1000, 9999, '已上市'),
('应辉智能', 20, 99, '未融资'),
('无忧达', 100, 499, 'A轮'),
('蓝针智能', 20, 99, '天使轮'),
('非凡无限', 20, 99, '未融资'),
('力弘新能源科技', 20, 99, '未融资'),
('浙江大华', 1000, 9999, '已上市'),
('纬横数据', 20, 99, '未融资'),
('金兆智能', 20, 99, '未融资'),
('美云智数', 1000, 9999, '不需要融资'),
('盈力科技', 100, 499, 'A轮'),
('骁海科技', 20, 99, '不需要融资'),
('银信科技', 1000, 9999, '已上市'),
('数乐科技', 0, 20, NULL),
('蜻蜓眼科技', 0, 20, NULL),
('辅辰科技', 20, 99, '天使轮'),
('陕西万德信息', 500, 999, '已上市'),
('瑞呈物联', 20, 99, '未融资'),
('数宇道科技', 0, 20, '不需要融资'),
('颜铺科技', 20, 99, 'A轮'),
('务新科技', 20, 99, '不需要融资'),
('环信恒辉科技', 20, 99, '未融资'),
('海云天智', 20, 99, '未融资'),
('福富公司', 1000, 9999, '不需要融资'),
('扬州北联', 20, 99, NULL),
('杰霖科技', 0, 20, NULL),
('医惠科技', 1000, 9999, '已上市'),
('方片互娱', 100, 499, NULL),
('深圳市中车信息科技', 100, 499, '未融资'),
('北京小科粒', 20, 99, NULL),
('一龄博士俱乐部', 1000, 9999, '不需要融资'),
('侠客互娱', 0, 20, '天使轮'),
('Bitkernel', 500, 999, '不需要融资'),
('昆仑数智', 1000, 9999, '不需要融资'),
('曼孚科技', 100, 499, 'B轮'),
('深圳智乾坤科技', 20, 99, '天使轮'),
('酷软网络', 20, 99, '不需要融资'),
('天琴科技', 0, 20, '不需要融资'),
('行知方舟', 20, 99, NULL),
('云图睿视', 20, 99, NULL),
('鼎新电能', 20, 99, '未融资'),
('互彩通科技', 20, 99, NULL),
('中迪联创', 0, 20, '不需要融资'),
('珠海辉腾软件', 0, 20, '未融资'),
('宁夏新家乐商贸', 0, 20, NULL),
('成都远石', 20, 99, NULL),
('上海超捷', 100, 499, '不需要融资'),
('博思软件', 100, 499, '不需要融资'),
('君诺信达', 20, 99, '未融资'),
('杭州炎魂网络', 100, 499, '不需要融资'),
('华航环境发展', 100, 499, '不需要融资'),
('柯莱特集团', 1000, 9999, '已上市'),
('网易杭州', 10000, NULL, '已上市'),
('富途', 1000, 9999, '已上市'),
('北京大学武汉人工', 20, 99, '不需要融资'),
('滴滴', 1000, 9999, 'D轮及以上'),
('vivo', 10000, NULL, '不需要融资'),
('Passcard', 20, 99, NULL),
('浙江秉尚贸易有限公司', 20, 99, NULL),
('汇平通科技', 20, 99, '不需要融资'),
('SenseTime', 1000, 9999, '已上市'),
('广通', 100, 499, '未融资');

/*****************/

INSERT INTO jobType values (1,'前端'),(2,'后端'),(3,'算法'),(4,'产品经理');

/*******************/

INSERT INTO job (jobTypeId, companyId, jobName, minEd, salary, requiredSkills, cityId, url) VALUES
(3, 7, '算法工程师', 2, 50000, 'Python C/C++ Shell 计算机相关专业', (SELECT cityId FROM city WHERE cityName = '北京'), 'https://img.bosszhipin.com/beijin/upload/com/logo/20200429/8f64c9d0b30a53c434b26799ca78966cec9b49ecaf1604cb263748f03d5c2b0f.png'),
(3, 78, '算法工程师', 2, 60000, '深度学习算法 Python Go 分布式技术 数据挖掘 数据仓库 数据分析 Hadoop', (SELECT cityId FROM city WHERE cityName = '北京'), 'https://img.bosszhipin.com/beijin/mcs/chatphoto/20190408/c23f08b24983fffa26a3a8ba19a463523cc05a6873981b80bf124ddd6c45f629_s.jpg'),
(3, 131, '算法工程师', 3, 25000, '业务导向 Python Shell C/C++ 发表算法相关优秀论文 参加算法相关竞赛/获奖', (SELECT cityId FROM city WHERE cityName = '北京'), 'https://img.bosszhipin.com/beijin/mcs/banner/00c9c1238ae2c986f3e7741be97a9669cfcd208495d565ef66e7dff9f98764da.jpg'),
(3, 4, '算法工程师', 2, 30000, '深度学习算法 C++ Java 分布式技术 音视频编解码 TensorFlow Hadoop', (SELECT cityId FROM city WHERE cityName = '北京'), 'https://img.bosszhipin.com/beijin/upload/com/workfeel/20220316/7bf6f160950405e9282fe33181a1523803562870c4e2cc4a242ac4eb7bbd10d1694083156ab76fdb.jpg'),
(3, 131, '算法工程师', 3, 30000, 'C++ 算法基础 机器学习算法 Boosting', (SELECT cityId FROM city WHERE cityName = '北京'), 'https://img.bosszhipin.com/beijin/mcs/banner/00c9c1238ae2c986f3e7741be97a9669cfcd208495d565ef66e7dff9f98764da.jpg'),
(3, 283, '高级算法工程师', 2, 25000, '智能营销/广告 搜索/推荐', (SELECT cityId FROM city WHERE cityName = '北京'), 'https://img.bosszhipin.com/beijin/mcs/bar/20201205/25965fbe2c0440e760df2b6a6b81d7c2be1bd4a3bd2a63f070bdbdada9aad826.png'),
(3, 59, '算法工程师【北京】', 2, 41606, 'Python', (SELECT cityId FROM city WHERE cityName = '北京'), 'https://img.bosszhipin.com/beijin/upload/com/workfeel/20230811/7bf6f160950405e993d5441fb36ed39b6e0ceee2dc5889061408317c856c491f5c0c40aafab8d582.png.webp'),
(3, 188, '决策算法工程师', 2, 50000, '决策算法 机器学习 深度学习 数据挖掘', (SELECT cityId FROM city WHERE cityName = '北京'), 'https://img.bosszhipin.com/beijin/upload/com/workfeel/20210518/ba817712fe126c2d6c9f96a853a94c46eac9df40130f3171b717994563034012.jpg'),
(3, 4, '大模型算法工程师', 2, 26000, '大模型算法 推荐算法 搜索算法 模型加速/性能优化 C/C++ Python Java 算法工程化经验 发表算法相关优秀论文 优秀开源项目经历', (SELECT cityId FROM city WHERE cityName = '北京'), 'https://img.bosszhipin.com/beijin/upload/com/workfeel/20220316/7bf6f160950405e9282fe33181a1523803562870c4e2cc4a242ac4eb7bbd10d1694083156ab76fdb.jpg'),
(3, 78, '策略中台高级算法工程师', 2, 33303, '深度学习算法 供需预测模型 机器学习算法 强化学习 模仿学习', (SELECT cityId FROM city WHERE cityName = '北京'), 'https://img.bosszhipin.com/beijin/mcs/chatphoto/20190408/c23f08b24983fffa26a3a8ba19a463523cc05a6873981b80bf124ddd6c45f629_s.jpg'),
(3, 118, '多模态内容理解算法工程师', 3, 30000, '计算机相关专业 有国际期刊/会议论文发表 机器学习算法/工程化经验', (SELECT cityId FROM city WHERE cityName = '北京'), 'https://c-res.zhipin.com/jrs/3097d0c6a750681194958b5b6379d32b.jpg'),
(3, 61, '算法工程师', 3, 45000, '深度学习算法', (SELECT cityId FROM city WHERE cityName = '杭州'), 'https://img.bosszhipin.com/beijin/mcs/banner/b10345f203d9c0270a26df28e9c00429cfcd208495d565ef66e7dff9f98764da.jpg'),
(3, 81, '数据算法工程师', 3, 50000, '推荐算法 深度学习算法 机器学习算法 Spark Python Scala', (SELECT cityId FROM city WHERE cityName = '北京'), 'https://img.bosszhipin.com/beijin/mcs/bar/20200430/4204e9c9f200b00b77fb59d093acd281be1bd4a3bd2a63f070bdbdada9aad826.jpg'),
(3, 163, '搜索推荐算法工程师', 2, 30000, '推荐算法经验 搜索/信息检索算法经验', (SELECT cityId FROM city WHERE cityName = '北京'), 'https://img.bosszhipin.com/beijin/upload/com/logo/20210323/aab1b65662224a865a9b6ba9aceaab02babfa420ecc134d2606b05aa8114130d.png'),
(3, 131, '定位算法工程师', 2, 30000, 'IMU C++ 惯性导航 定位 GPS VIO 业务导向', (SELECT cityId FROM city WHERE cityName = '北京'), 'https://img.bosszhipin.com/beijin/mcs/banner/00c9c1238ae2c986f3e7741be97a9669cfcd208495d565ef66e7dff9f98764da.jpg'),
(3, 234, '算法移植优化工程师', 3, 20000, '业务导向 语音/图像识别 TensorFlow/PyTorch C/C++ Python 计算机相关专业 数学/统计相关专业 机器学习算法/工程化经验', (SELECT cityId FROM city WHERE cityName = '杭州'), 'https://img.bosszhipin.com/beijin/mcs/banner/2c58f03d8309365e12ed525cc327ed7fcfcd208495d565ef66e7dff9f98764da.jpg');

/****************/
INSERT INTO job (jobTypeId, companyId, jobName, minEd, salary, requiredSkills, cityId, url) VALUES

(2, 92, 'java Architect', 2, 25000, 'Java', (SELECT cityId FROM city WHERE cityName = '杭州'), 'https://img.bosszhipin.com/beijin/mcs/banner/4b9ed908354df6770318281a3660fdcfcfcd208495d565ef66e7dff9f98764da.jpg'),
(2, 275, 'Java 工程师', 2, 1083, '计算机软件 Spring SpringMVC Oracle 后端开发 全栈开发 Linux 软件工程师', (SELECT cityId FROM city WHERE cityName = '呼和浩特'), 'https://img.bosszhipin.com/beijin/mcs/banner/edb8e3365e6dd65be8c89d9ddcb08510cfcd208495d565ef66e7dff9f98764da.jpg'),
(2, 283, 'Java 专家工程师', 2, 30000, 'Java Spring SpringCloud MyBatis MySQL 音视频经验 架构设计经验 分布式经验', (SELECT cityId FROM city WHERE cityName = '北京'), 'https://img.bosszhipin.com/beijin/mcs/bar/20201205/25965fbe2c0440e760df2b6a6b81d7c2be1bd4a3bd2a63f070bdbdada9aad826.png'),
(2, 61, 'java 后端开发', 0, 8200, '后端工程师 Java', (SELECT cityId FROM city WHERE cityName = '杭州'), 'https://img.bosszhipin.com/beijin/mcs/banner/b10345f203d9c0270a26df28e9c00429cfcd208495d565ef66e7dff9f98764da.jpg'),
(2, 176, 'java 开发工程师', 2, 14000, '分布式技术 数据结构 Spring Dubbo SpringBoot Redis MySQL 架构师', (SELECT cityId FROM city WHERE cityName = '海口'), 'https://img.bosszhipin.com/beijin/upload/com/logo/20210830/7b5b554d84f9729cb81dae6da87b9eddbf6e3e481ce34ae8c7421cffdbdea8d6f11cda4aeefd5586.jpg'),
(2, 4, 'java 技术专家', 2, 35000, 'Java', (SELECT cityId FROM city WHERE cityName = '杭州'), 'https://img.bosszhipin.com/beijin/upload/com/workfeel/20220316/7bf6f160950405e9282fe33181a1523803562870c4e2cc4a242ac4eb7bbd10d1694083156ab76fdb.jpg'),
(2, 7, 'Java Python开发工程师', 2, 20000, '分布式技术 Dubbo Python 软件工程师 后端开发 WEB开发 Linux', (SELECT cityId FROM city WHERE cityName = '深圳'), 'https://img.bosszhipin.com/beijin/upload/com/logo/20200429/8f64c9d0b30a53c434b26799ca78966cec9b49ecaf1604cb263748f03d5c2b0f.png'),
(2, 78, 'JAVA 资深/专家工程师', 2, 30000, '多线程 Spring Dubbo Redis NoSQL MySQL Linux', (SELECT cityId FROM city WHERE cityName = '北京'), 'https://img.bosszhipin.com/beijin/mcs/chatphoto/20190408/c23f08b24983fffa26a3a8ba19a463523cc05a6873981b80bf124ddd6c45f629_s.jpg'),
(2, 7, 'Java 开发工程师', 2, 12500, '分布式技术 服务器配置 微服务架构 容器技术 Spring Oracle SpringCloud 后端开发', (SELECT cityId FROM city WHERE cityName = '深圳'), 'https://img.bosszhipin.com/beijin/upload/com/logo/20200429/8f64c9d0b30a53c434b26799ca78966cec9b49ecaf1604cb263748f03d5c2b0f.png'),
(2, 156, 'JAVA 高级开发/架构师-急招', 2, 16667, 'Java 分布式技术 多线程 消息队列 Spring Mybatis MySQL Redis', (SELECT cityId FROM city WHERE cityName = '杭州'), 'https://img.bosszhipin.com/beijin/logo/9a78a57a7671568532763f6913143c85be1bd4a3bd2a63f070bdbdada9aad826.jpg'),
(2, 7, 'Java 软件开发工程师', 2, 10714, '分布式技术 服务器配置 微服务架构 消息队列 Spring Dubbo 后端开发 Linux', (SELECT cityId FROM city WHERE cityName = '深圳'), 'https://img.bosszhipin.com/beijin/upload/com/logo/20200429/8f64c9d0b30a53c434b26799ca78966cec9b49ecaf1604cb263748f03d5c2b0f.png'),
(2, 61, 'Java', 2, 15833, 'Java 后端开发 数据库', (SELECT cityId FROM city WHERE cityName = '杭州'), 'https://img.bosszhipin.com/beijin/mcs/banner/b10345f203d9c0270a26df28e9c00429cfcd208495d565ef66e7dff9f98764da.jpg'),
(2, 154, 'java', 2, 13333, 'Java SpringCloud Redis', (SELECT cityId FROM city WHERE cityName = '武汉'), 'https://img.bosszhipin.com/beijin/mcs/banner/5ceba8561d592ff6849e8a0525aacbfecfcd208495d565ef66e7dff9f98764da.jpg'),
(2, 234, 'Java', 2, 12500, 'Java 团队管理经验 SSH MVC开发 后端工程师 SSM Spring 大数据 云计算', (SELECT cityId FROM city WHERE cityName = '杭州'), 'https://img.bosszhipin.com/beijin/mcs/banner/2c58f03d8309365e12ed525cc327ed7fcfcd208495d565ef66e7dff9f98764da.jpg'),
(2, 4, 'Java', 2, 25000, 'Java 后端开发 Linux', (SELECT cityId FROM city WHERE cityName = '杭州'), 'https://img.bosszhipin.com/beijin/upload/com/workfeel/20220316/7bf6f160950405e9282fe33181a1523803562870c4e2cc4a242ac4eb7bbd10d1694083156ab76fdb.jpg'),
(2, 19, 'Java', 2, 21428, 'Java 计算机/软件工程相关经验 Java开发经验', (SELECT cityId FROM city WHERE cityName = '武汉'), 'https://img.bosszhipin.com/beijin/upload/com/logo/20210316/73ea6807f43915a26ed9cc2674429bae3e8741717a4ad566bdbc95a3b8d77bcb.png'),
(2, 148, 'Java', 2, 16667, 'Java 分布式技术 多线程 Spring MySQL Linux 云计算 NoSQL', (SELECT cityId FROM city WHERE cityName = '杭州'), 'https://img.bosszhipin.com/beijin/upload/com/workfeel/20230707/7bf6f160950405e94f96793d8508cdc1b01fafbca4af603ab33a0da269092f718e83480322bc9596.png'),
(2, 4, 'Java', 2, 50000, 'Java 分布式技术 Spring 支付 Linux MySQL', (SELECT cityId FROM city WHERE cityName = '深圳'), 'https://img.bosszhipin.com/beijin/upload/com/workfeel/20220316/7bf6f160950405e9282fe33181a1523803562870c4e2cc4a242ac4eb7bbd10d1694083156ab76fdb.jpg'),
(2, 4, 'Java', 2, 38333, '微服务架构 高级软件工程师 架构师 多线程 Spring MySQL Redis 软件工程师', (SELECT cityId FROM city WHERE cityName = '广州'), 'https://img.bosszhipin.com/beijin/upload/com/workfeel/20220316/7bf6f160950405e9282fe33181a1523803562870c4e2cc4a242ac4eb7bbd10d1694083156ab76fdb.jpg'),
(2, 4, 'java', 0, 13667, '后端开发 云计算 SaaS', (SELECT cityId FROM city WHERE cityName = '武汉'), 'https://img.bosszhipin.com/beijin/upload/com/workfeel/20220316/7bf6f160950405e9282fe33181a1523803562870c4e2cc4a242ac4eb7bbd10d1694083156ab76fdb.jpg'),
(2, 61, 'Java', 2, 15833, '后端开发 系统架构 数据挖掘 分布式技术 负载均衡技术 支付 大数据 消费金融', (SELECT cityId FROM city WHERE cityName = '杭州'), 'https://img.bosszhipin.com/beijin/mcs/banner/b10345f203d9c0270a26df28e9c00429cfcd208495d565ef66e7dff9f98764da.jpg'),
(2, 7, 'Java', 2, 12500, '多线程 MVC开发 微服务架构 Spring 企业级应用开发 Linux MySQL 中级软件工程师', (SELECT cityId FROM city WHERE cityName = '南京'), 'https://img.bosszhipin.com/beijin/upload/com/logo/20200429/8f64c9d0b30a53c434b26799ca78966cec9b49ecaf1604cb263748f03d5c2b0f.png'),
(2, 30, 'Java', 2, 1428, 'Java Python Spring MyBatis MySQL Redis', (SELECT cityId FROM city WHERE cityName = '西安'), 'https://img.bosszhipin.com/beijin/mcs/chatphoto/20180315/bd89a07c42e66e6ad270e3a5317c2b5ffaa3a410030cb71b0566e9dd7d5ab56c.jpg'),
(2, 61, 'Java', 2, 15000, 'Spring MySQL 后端开发 Maven', (SELECT cityId FROM city WHERE cityName = '成都'), 'https://img.bosszhipin.com/beijin/mcs/banner/b10345f203d9c0270a26df28e9c00429cfcd208495d565ef66e7dff9f98764da.jpg'),
(2, 22, 'Java', 2, 16667, '软件工程师 后端开发 Linux SpringBoot MySQL', (SELECT cityId FROM city WHERE cityName = '深圳'), 'https://img.bosszhipin.com/beijin/upload/com/workfeel/20231220/7bf6f160950405e993d5441fb36ed39b6e0ceee2dc588906180d77ff8d8c2e0a1cfd08ecf22f82f2.png.webp'),
(2, 156, 'Java', 2, 16667, 'Java SQL 分布式技术 Spring Struts MySQL 架构师', (SELECT cityId FROM city WHERE cityName = '杭州'), 'https://img.bosszhipin.com/beijin/logo/9a78a57a7671568532763f6913143c85be1bd4a3bd2a63f070bdbdada9aad826.jpg'),
(2, 8, 'Java', 2, 12500, '分布式技术 SpringMVC 微服务架构 高级软件工程师 后端开发', (SELECT cityId FROM city WHERE cityName = '武汉'), 'https://img.bosszhipin.com/beijin/upload/com/workfeel/20240304/7bf6f160950405e904493fd1333b25c73a1c9b95e8e282a1150a7b72c6921f314900e4ccac62b163.png.webp'),
(2, 209, 'Java', 2, 16667, 'Java 分布式技术 微服务架构 消息队列 Spring', (SELECT cityId FROM city WHERE cityName = '苏州'), 'https://img.bosszhipin.com/beijin/mcs/bar/20191129/3cdf5ba2149e309b38868b62ae9c22cabe1bd4a3bd2a63f070bdbdada9aad826.jpg'),
(2, 11, 'Java', 2, 18333, '分布式技术 消息队列 Spring', (SELECT cityId FROM city WHERE cityName = '杭州'), 'https://img.bosszhipin.com/beijin/mcs/banner/9b5648d30a60576a9ebce5af1ec0f70bcfcd208495d565ef66e7dff9f98764da.jpg'),
(2, 163, 'Java', 2, 12500, '多线程 消息队列 Spring Redis MongoDB 后端开发 软件工程师', (SELECT cityId FROM city WHERE cityName = '广州'), 'https://img.bosszhipin.com/beijin/mcs/chatphoto/20190425/e493c5d9fd1b21d89151158efcf77ba2425544e7f79c97fcd071c363272ce70a.jpg');


/******************/
INSERT INTO job (jobTypeId, companyId, jobName, minEd, salary, requiredSkills, cityId, url) VALUES

(4, 206, '产品经理', 2, 12000, '用户产品 中台/后台产品', (SELECT cityId FROM city WHERE cityName = '沧州'), 'https://img.bosszhipin.com/beijin/upload/com/workfeel/20220816/7bf6f160950405e98a220361cbfa7de277436b725edc0673546ca3c230c8d912a7bc5c94b7ab6ef7.jpg'),
(4, 209, '产品经理', 2, 33333, '中台产品 TO B 电子商务 平台产品 功能产品 SAAS产品 云计算 云计算产品', (SELECT cityId FROM city WHERE cityName = '北京'), 'https://img.bosszhipin.com/beijin/mcs/bar/20191129/3cdf5ba2149e309b38868b62ae9c22cabe1bd4a3bd2a63f070bdbdada9aad826.jpg'),
(4, 283, '产品经理', 2, 29167, '策略产品 交通安全', (SELECT cityId FROM city WHERE cityName = '北京'), 'https://img.bosszhipin.com/beijin/mcs/bar/20201205/25965fbe2c0440e760df2b6a6b81d7c2be1bd4a3bd2a63f070bdbdada9aad826.png'),
(4, 152, '产品经理', 2, 200, 'B端产品 SAAS产品 需求分析 市场调研 Axure TO B 用户研究 产品设计', (SELECT cityId FROM city WHERE cityName = '北京'), 'https://img.bosszhipin.com/beijin/mcs/banner/b17ae0399cb0df3556938acced524265cfcd208495d565ef66e7dff9f98764da.jpg'),
(4, 209, '产品经理', 2, 40000, '产品设计 产品规划 用户增长 策略产品 电商产品 Axure', (SELECT cityId FROM city WHERE cityName = '北京'), 'https://img.bosszhipin.com/beijin/mcs/bar/20191129/3cdf5ba2149e309b38868b62ae9c22cabe1bd4a3bd2a63f070bdbdada9aad826.jpg'),
(4, 209, '产品经理', 2, 290, '产品设计 数据分析 需求分析 功能产品 数据产品 电商产品 CRM产品 风控产品', (SELECT cityId FROM city WHERE cityName = '北京'), 'https://img.bosszhipin.com/beijin/mcs/bar/20191129/3cdf5ba2149e309b38868b62ae9c22cabe1bd4a3bd2a63f070bdbdada9aad826.jpg'),
(4, 281, '产品经理', 0, 18667, '产品设计 需求分析 项目管理 功能产品 C端产品 Axure TO C 金融', (SELECT cityId FROM city WHERE cityName = '深圳'), 'https://img.bosszhipin.com/beijin/mcs/chatphoto/20180517/d5beb59a817180506f310a7e110e169ccfcd208495d565ef66e7dff9f98764da.jpg'),
(4, 81, '产品经理', 2, 22500, '产品运营 产品设计 需求分析 产品规划 平台产品', (SELECT cityId FROM city WHERE cityName = '深圳'), 'https://img.bosszhipin.com/beijin/mcs/bar/20200430/4204e9c9f200b00b77fb59d093acd281be1bd4a3bd2a63f070bdbdada9aad826.jpg'),
(4, 61, '产品经理', 2, 25000, '数据分析 产品经理 项目管理', (SELECT cityId FROM city WHERE cityName = '杭州'), 'https://img.bosszhipin.com/beijin/upload/com/logo/20240407/7b5b554d84f9729cdf49b3b80c1afbe718ee0c7923bf6a74448fdc16e80830ea50631da01c15930d.jpg.webp'),
(4, 66, '政务产品经理', 2, 10000, '墨刀 功能产品 需求分析 产品规划 Visio 产品设计 市场调研', (SELECT cityId FROM city WHERE cityName = '南宁'), 'https://img.bosszhipin.com/beijin/mcs/chatphoto/20200925/981c7de96e46f790be7edaf06498237c898c5f36ff763bcff8d9ee61c7377416_s.jpg'),
(4, 4, '广告产品经理', 2, 29167, '策略产品 商业产品 增长产品', (SELECT cityId FROM city WHERE cityName = '杭州'), 'https://img.bosszhipin.com/beijin/upload/com/workfeel/20220316/7bf6f160950405e9282fe33181a1523803562870c4e2cc4a242ac4eb7bbd10d1694083156ab76fdb.jpg'),
(4, 163, '商业产品经理', 2, 23077, '数据分析 产品经理 商业产品 TO B', (SELECT cityId FROM city WHERE cityName = '北京'), 'https://img.bosszhipin.com/beijin/upload/com/logo/20210323/aab1b65662224a865a9b6ba9aceaab02babfa420ecc134d2606b05aa8114130d.png'),
(4, 131, '网络产品经理', 2, 33333, 'B端产品 高级产品经理 成本分析 经营分析 网络产品', (SELECT cityId FROM city WHERE cityName = '北京'), 'https://img.bosszhipin.com/beijin/mcs/banner/00c9c1238ae2c986f3e7741be97a9669cfcd208495d565ef66e7dff9f98764da.jpg'),
(4, 90, '呼叫系统产品经理', 2, 13077, 'B端产品 中台/后台产品 电销外呼系统 客服系统', (SELECT cityId FROM city WHERE cityName = '深圳'), 'https://img.bosszhipin.com/beijin/mcs/banner/8b65e40c527484300d97fe10e1a745a1cfcd208495d565ef66e7dff9f98764da.png'),
(4, 131, '业务风控产品经理', 2, 30000, '产品设计 需求分析 产品规划 风控产品 TOB 反作弊 业务风控 账号安全', (SELECT cityId FROM city WHERE cityName = '北京'), 'https://img.bosszhipin.com/beijin/mcs/banner/00c9c1238ae2c986f3e7741be97a9669cfcd208495d565ef66e7dff9f98764da.jpg'),
(4, 61, '产品专家/高级产品经理', 2, 25000, '产品经理 CRM 数据分析 支付产品 CRM产品 金融', (SELECT cityId FROM city WHERE cityName = '杭州'), 'https://img.bosszhipin.com/beijin/mcs/banner/b10345f203d9c0270a26df28e9c00429cfcd208495d565ef66e7dff9f98764da.jpg'),
(4, 260, '高级产品经理（VoD方向）', 2, 29167, '流媒体 平台架构 OTT', (SELECT cityId FROM city WHERE cityName = '深圳'), 'https://img.bosszhipin.com/beijin/upload/com/workfeel/20240418/7bf6f160950405e9aa40982e30bdda439eb32164eaccc3679f1d74dc2335a154259cc2123fa23d3f.png.webp'),
(4, 22, '商业化产品经理-生活服务', 2, 33333, '商业产品 策略产品', (SELECT cityId FROM city WHERE cityName = '北京'), 'https://img.bosszhipin.com/beijin/upload/com/workfeel/20231220/7bf6f160950405e993d5441fb36ed39b6e0ceee2dc588906180d77ff8d8c2e0a1cfd08ecf22f82f2.png.webp'),
(4, 61, '高级产品经理/产品专家-资金业务方向', 2, 47115, '需求分析 产品设计 数据分析 产品规划 项目管理 平台产品 支付 资金网络', (SELECT cityId FROM city WHERE cityName = '杭州'), 'https://img.bosszhipin.com/beijin/mcs/banner/b10345f203d9c0270a26df28e9c00429cfcd208495d565ef66e7dff9f98764da.jpg'),
(4, 81, '21309-企鹅辅导高级产品策划经理', 2, 30000, '产品经理 在线教育 数据分析', (SELECT cityId FROM city WHERE cityName = '深圳'), 'https://img.bosszhipin.com/beijin/mcs/bar/20200430/4204e9c9f200b00b77fb59d093acd281be1bd4a3bd2a63f070bdbdada9aad826.jpg'),
(4, 131, '智能汽车事业部-高精地图产品经理', 2, 52500, '测绘 熟悉地图数据 数据分析决策', (SELECT cityId FROM city WHERE cityName = '北京'), 'https://img.bosszhipin.com/beijin/mcs/banner/00c9c1238ae2c986f3e7741be97a9669cfcd208495d565ef66e7dff9f98764da.jpg'),
(4, 163, '用户服务产品经理（ IM、虚拟号等方向 ）', 0, 30000, '用户/功能产品', (SELECT cityId FROM city WHERE cityName = '北京'), 'https://img.bosszhipin.com/beijin/upload/com/logo/20210314/40431a563e843e1590d1f7d82652d53a0c6262faac2d042da229926610f4b0b6.png'),
(4, 4, '互联网广告销售', 2, 46154, '五险一金', (SELECT cityId FROM city WHERE cityName = '漳州'), 'https://img.bosszhipin.com/beijin/upload/com/workfeel/20220316/7bf6f160950405e9282fe33181a1523803562870c4e2cc4a242ac4eb7bbd10d1694083156ab76fdb.jpg');



/****************/


INSERT INTO job (jobTypeId, companyId, jobName, minEd, salary, requiredSkills, cityId, url) VALUES
                                                                                                (1, 1, '前端开发工程师', 2, 13500, 'Vue.js CSS Web端 Vue ES6 小程序 Less AJAX', (SELECT cityId FROM city WHERE cityName = '南通'), 'https://img.bosszhipin.com/beijin/icon/894ce6fa7e58d64d57e7f22d2f3a9d18afa7fcceaa24b8ea28f56f1bb14732c0.png'),
                                                                                                (1, 2, '前端开发工程师', 2, 10500, '前端开发 后端开发 Angular 小程序 计算机软件', (SELECT cityId FROM city WHERE cityName = '北京'), 'https://img.bosszhipin.com/beijin/mcs/chatphoto/20180720/c7f2f9078280a19f255cb5255ae1b171e8dd8efaf22021a81fd07f81ab7a36c6.jpg'),
                                                                                                (1, 7, '前端开发工程师', 2, 21000, 'JavaScript HTML CSS CSS3 HTML5 ES6 网络协议 AJAX', (SELECT cityId FROM city WHERE cityName = '西安'), 'https://img.bosszhipin.com/beijin/upload/com/logo/20200429/8f64c9d0b30a53c434b26799ca78966cec9b49ecaf1604cb263748f03d5c2b0f.png'),
                                                                                                (1, 8, '前端开发工程师', 2, 18000, '前端开发 CSS React Vue Web端 小程序 PC端 WEB开发', (SELECT cityId FROM city WHERE cityName = '深圳'), 'https://img.bosszhipin.com/beijin/upload/com/workfeel/20240304/7bf6f160950405e904493fd1333b25c73a1c9b95e8e282a1150a7b72c6921f314900e4ccac62b163.png.webp'),
                                                                                                (1, 9, '前端开发工程师', 2, 30000, 'HTML5 CSS Vue 前端开发经验 计算机/软件工程相关专业 移动端 小程序 Javascript', (SELECT cityId FROM city WHERE cityName = '厦门'), 'https://img.bosszhipin.com/beijin/upload/com/workfeel/20220721/7bf6f160950405e965724666d3121d6d573e7d582bb80b77f61db96755870f1a33efd86808f286f1.jpg'),
                                                                                                (1, 10, '前端开发工程师', 3, 9500, '前端开发 移动端 小程序 流媒体技术 商业智能 管理系统 地图导航 视频', (SELECT cityId FROM city WHERE cityName = '成都'), 'https://img.bosszhipin.com/beijin/mcs/chatphoto/20200518/c1eebaa980b85c61dd0a3c22152019c7bb5cf81091aa4b704b91adfa7aca01a5_s.jpg'),
                                                                                                (1, 11, '前端开发工程师', 2, 19000, '前端开发 CSS JavaScript React Vue Vue.js React.JS 移动端', (SELECT cityId FROM city WHERE cityName = '杭州'), 'https://img.bosszhipin.com/beijin/mcs/banner/9b5648d30a60576a9ebce5af1ec0f70bcfcd208495d565ef66e7dff9f98764da.jpg'),
                                                                                                (1, 12, '前端开发工程师', 2, 11500, 'Vue HTML5 计算机/软件工程相关专业 前端开发经验', (SELECT cityId FROM city WHERE cityName = '南昌'), 'https://img.bosszhipin.com/beijin/mcs/chatphoto/20210225/8436b192b9d25d50c7ac51c3d38dcf469a5ec6bd819264954b7a6c35418caea6_s.jpg'),
                                                                                                (1, 13, '前端开发工程师', 2, 10500, '前端开发 HTML CSS JavaScript CSS3 React Web端 网络协议', (SELECT cityId FROM city WHERE cityName = '武汉'), 'https://img.bosszhipin.com/beijin/app/mobile/normal-0e3f1e4441a21d4874cece3a3d81f0fe.png'),
                                                                                                (1, 14, '前端开发工程师', 1, 6000, '前端开发 jsp HTML HTML5 JavaScript Ajax DOM WEB前端 Node.js CSS Java Vue JQuery', (SELECT cityId FROM city WHERE cityName = '哈尔滨'), 'https://img.bosszhipin.com/beijin/upload/com/workfeel/20211222/7bf6f160950405e94c6126f11107a320fbec539af56415fc710ea1921198e4920de26e42a114e1fb.jpg'),
                                                                                                (1, 15, '前端开发工程师', 2, 10500, 'HTML JavaScript WEB开发 Vue', (SELECT cityId FROM city WHERE cityName = '杭州'), 'https://img.bosszhipin.com/beijin/upload/com/logo/20200222/8523b3cfea6abb573a36395457873ac10194ddb99ebcbc94d8e53a7e24631e02.jpg'),
                                                                                                (1, 16, '前端开发工程师', 2, 6500, 'HTML CSS CSS3 HTML5 前端开发 JQuery Vue Vue.js', (SELECT cityId FROM city WHERE cityName = '长治'), 'https://img.bosszhipin.com/beijin/app/mobile/normal-0e3f1e4441a21d4874cece3a3d81f0fe.png'),
                                                                                                (1, 17, '前端开发工程师', 1, 14500, 'HTML CSS CSS3 HTML5 MVC开发 前端开发 Web端 移动端', (SELECT cityId FROM city WHERE cityName = '杭州'), 'https://img.bosszhipin.com/beijin/mcs/banner/20180310/0f2ef5140160425fd989d87ead17cc9d33d208e8d6fc287973c46e5cb5346f06.png'),
                                                                                                (1, 18, '前端开发工程师', 1, 16000, 'HTML5 React Vue 前端开发经验', (SELECT cityId FROM city WHERE cityName = '江门'), 'https://img.bosszhipin.com/beijin/upload/com/workfeel/20211129/7bf6f160950405e96c1326d3fbad070c8afa4865e681aadd37dc3c877d95b168d3b2acda41806c8b.jpg'),
                                                                                                (1, 19, '前端开发工程师', 2, 22500, 'JavaScript Node.js Vue', (SELECT cityId FROM city WHERE cityName = '深圳'), 'https://img.bosszhipin.com/beijin/upload/com/logo/20210316/73ea6807f43915a26ed9cc2674429bae3e8741717a4ad566bdbc95a3b8d77bcb.png'),
                                                                                                (1, 20, '前端开发工程师', 2, 22500, '前端开发 CSS Web端 JavaScript Vue HTML Node.js React', (SELECT cityId FROM city WHERE cityName = '北京'), 'https://img2.bosszhipin.com/mcs/chatphoto/20160220/f4fb427f70b72c5fb8ed503c63a47f69bdcefcf58db937e3d68ddd5d56e615eb.jpg'),
                                                                                                (1, 21, '前端开发工程师', 1, 10500, 'JavaScript TypeScript HTML CSS CSS3 HTML5 ES6 前端开发', (SELECT cityId FROM city WHERE cityName = '南宁'), 'https://img.bosszhipin.com/beijin/mcs/chatphoto/20190301/fc6fb003cf6b3360abc063f9cc27be560a3889f553b169c36aa81b469d9f4009_s.jpg'),
                                                                                                (1, 22, '前端开发工程师', 2, 35000, '前端开发 JavaScript Web端 React', (SELECT cityId FROM city WHERE cityName = '杭州'), 'https://img.bosszhipin.com/beijin/upload/com/workfeel/20231220/7bf6f160950405e993d5441fb36ed39b6e0ceee2dc588906180d77ff8d8c2e0a1cfd08ecf22f82f2.png.webp'),
                                                                                                (1, 23, '前端开发工程师', 2, 16000, 'Vue JavaScript 前端开发 Linux', (SELECT cityId FROM city WHERE cityName = '北京'), 'https://img.bosszhipin.com/beijin/upload/com/workfeel/20220221/7bf6f160950405e9887f3d34b42dd3f83eabbd4d32b2e22ecf09fe8997a5fb93a53ba6c97d8e56da.png'),
                                                                                                (1, 24, '前端开发工程师', 2, 10500, 'HTML5 CSS3 Bootstrap JavaScript JQuery Vue 前端开发', (SELECT cityId FROM city WHERE cityName = '合肥'), 'https://img.bosszhipin.com/beijin/mcs/chatphoto/20200518/c1eebaa980b85c61dd0a3c22152019c7bb5cf81091aa4b704b91adfa7aca01a5_s.jpg'),
                                                                                                (1, 25, '前端开发工程师', 2, 12000, '前端开发 HTML5 CSS3 JavaScript', (SELECT cityId FROM city WHERE cityName = '厦门'), 'https://img.bosszhipin.com/beijin/mcs/banner/20220527/7bf6f160950405e9b588f0442dd6b918f48747c5869b42bf0fd67deeb3f68b5ff5681d7320b25d7b.jpg'),
                                                                                                (1, 26, '前端开发工程师', 2, 10500, '前端开发 HTML5 CSS3 JavaScript', (SELECT cityId FROM city WHERE cityName = '苏州'), 'https://img.bosszhipin.com/beijin/upload/com/workfeel/20211116/7bf6f160950405e9261bcab0c363dd8d6208a55b88f6820e4bbf0d40544a1d9f1561189965b4d265.jpg'),
                                                                                                (1, 27, '前端开发工程师', 2, 10500, '前端开发 HTML5 CSS3 JavaScript', (SELECT cityId FROM city WHERE cityName = '广州'), 'https://img.bosszhipin.com/beijin/upload/com/workfeel/20220910/7bf6f160950405e983250fe089529b35d99ff9b33f10d98bb73d93ac84cfb869fef1eb27e7eb5018.jpg'),
                                                                                                (1, 28, '前端开发工程师', 1, 15000, 'HTML5 CSS3 Bootstrap JavaScript JQuery Vue.js', (SELECT cityId FROM city WHERE cityName = '南京'), 'https://img.bosszhipin.com/beijin/upload/com/logo/20210311/22d30bc2d6598e7d2c15f6e856038106f8e59001324d1259b30e68c5e5fbcd24.png'),
                                                                                                (1, 29, '前端开发工程师', 2, 17000, '前端开发 React', (SELECT cityId FROM city WHERE cityName = '南京'), 'https://img.bosszhipin.com/beijin/mcs/banner/20181022/0f2ef5140160425fd989d87ead17cc9d33d208e8d6fc287973c46e5cb5346f06.png'),
                                                                                                (1, 30, '前端开发工程师', 2, 18500, '前端开发 HTML5 CSS3 JavaScript', (SELECT cityId FROM city WHERE cityName = '南京'), 'https://img.bosszhipin.com/beijin/upload/com/workfeel/20220321/7bf6f160950405e9533e2f80be3d8303d822a44680aa99ad9f1a86a90b67ffbc24a464394a80cbdc.jpg');



/********************/
insert into admin values 
(1,"admin1","admin1"),
(2,"admin2","admin2"),
(3,"admin3","admin3");


/******************/
insert into api values 
(1,"00000001","需要输入","输出规范","接口描述内容",45),
(2,"00000002","需要输入","输出规范","接口描述内容",5),
(3,"00000003","需要输入","输出规范","接口描述内容",0),
(4,"00000004","需要输入","输出规范","接口描述内容",6),
(5,"00000005","需要输入","输出规范","接口描述内容",0),
(6,"00000006","需要输入","输出规范","接口描述内容",22),
(7,"00000007","需要输入","输出规范","接口描述内容",66);

/***********************/


insert into app values 
(1,"app1","app1fordeveloper1"),
(2,"app2","app2fordeveloper2"),
(3,"app3","app3fordeveloper3"),
(4,"app4","app4fordeveloper4"),
(5,"app5","app5fordeveloper5");


/*****************/

insert into datasource values
(1,'webjob获取','无','url',now(),now()),
(2,'算法job获取','无','url',now(),now()),
(3,'产品经理job获取','无','url',now(),now()),
(4,'javajob获取','无','url',now(),now()),
(5,'其他','无','url',now(),now());


/********************/
insert into major values 
(1,"计算机专业"),
(2,"管理专业");
/*****************/
insert into apikey values 
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5),
(6,5,6),
(7,5,7);


/****************/

insert into importantdata(jobTypeId,regionName,perSalary,jobNum) values
(4,'四川',6000,10050),
(4,'重庆',6000,9000),
(4,'广州',9000,15000),
(4,'深圳',10000,10500),
(4,'上海',11000,12000),
(4,'浙江',7000,13000),
(4,'江苏',8000,14000),
(4,'北京',11000,15000),
(4,'天津',11000,15000),
(4,'福建',7000,16000);

/******************/
insert into task values
(1,1,'webjob获取task','0',0,now(),now()+ INTERVAL 1 HOUR,null,null),
(2,2,'算法job获取task','0',0,now(),now()+ INTERVAL 1 HOUR,null,null),
(3,3,'产品经理job获取task','0',0,now(),now()+ INTERVAL 1 HOUR,null,null),
(4,4,'javajob获取task','0',0,now(),now()+ INTERVAL 1 HOUR,null,null),
(5,5,'其他task','0',0,now(),now()+ INTERVAL 1 HOUR,null,null);

/***************/
INSERT INTO user(userId, majorId, account, password, name, gender, age, educationalQualification, email, question, answer) VALUES   
(1, 1, 'zhang1', 'zhang1', 'zhang1', '0', 25, 2, 'zhang1@qq.com', '母亲名字', 'zhang1mom'),  
(2, 1, 'zhang2', 'zhang2', 'zhang2', '0', 26, 1, 'zhang2@qq.com', '母亲名字', 'zhang2mom'),  
(3, 1, 'zhang3', 'zhang3', 'zhang3', '1', 30, 2, 'zhang3@qq.com', '母亲名字', 'zhang3mom'),  
(4, 1, 'zhang4', 'zhang4', 'zhang4', '1', 35, 3, 'zhang4@qq.com', '母亲名字', 'zhang4mom'),  
(5, 1, 'zhang5', 'zhang5', 'zhang5', '0', 26, 2, 'zhang5@qq.com', '母亲名字', 'zhang5mom'),  
(6, 1, 'qiao1', 'qiao1', 'qiao1', '1', 25, 2, 'qiao1@qq.com', '母亲名字', 'qiao1mom'),  
(7, 1, 'qiao2', 'qiao2', 'qiao2', '0', 27, 3, 'qiao2@qq.com', '母亲名字', 'qiao2mom'),  
(8, 1, 'qiao3', 'qiao3', 'qiao3', '0', 29, 2, 'qiao3@qq.com', '母亲名字', 'qiao3mom'),  
(9, 1, 'qiao4', 'qiao4', 'qiao4', '1', 20, 0, 'qiao4@qq.com', '母亲名字', 'qiao4mom'),  
(10, 1, 'qiao5', 'qiao5', 'qiao5', '0', 25, 2, 'qiao5@qq.com', '母亲名字', 'qiao5mom'),  
(11, 2, 'huang1', 'huang1', 'huang1', '0', 25, 2, 'huang1@qq.com', '母亲名字', 'huang1mom'),  
(12, 2, 'huang2', 'huang2', 'huang2', '1', 27, 3, 'huang2@qq.com', '母亲名字', 'huang2mom'),  
(13, 2, 'huang3', 'huang3', 'huang3', '0', 25, 3, 'huang3@qq.com', '母亲名字', 'huang3mom'),  
(14, 2, 'huang4', 'huang4', 'huang4', '0', 26, 2, 'huang4@qq.com', '母亲名字', 'huang4mom'),  
(15, 2, 'huang5', 'huang5', 'huang5', '1', 25, 2, 'huang5@qq.com', '母亲名字', 'huang5mom'),  
(16, 2, 'li1', 'li1', 'li1', '1', 50, 2, 'li1@qq.com', '母亲名字', 'li1mom'),  
(17, 2, 'li2', 'li2', 'li2', '0', 30, 3, 'li2@qq.com', '母亲名字', 'li2mom'),  
(18, 2, 'li3', 'li3', 'li3', '1', 40, 3, 'li3@qq.com', '母亲名字', 'li3mom'),  
(19, 2, 'li4', 'li4', 'li4', '0', 45, 3, 'li4@qq.com', '母亲名字', 'li4mom'),  
(20, 2, 'li5', 'li5', 'li5', '0', 35, 2, 'li5@qq.com', '母亲名字', 'li5mom');


/*****************/

insert into developer values
(1,0),
(6,0),
(11,0),
(16,0),
(2,0);
/***************/

insert into log values
(1,1,now(),now()+ INTERVAL 1 HOUR,'1','errorExperssion',null,null),
(2,2,now(),now()+ INTERVAL 1 HOUR,'1','errorExperssion',null,null),
(3,3,now(),now()+ INTERVAL 1 HOUR,'1','errorExperssion',null,null),
(4,4,now(),now()+ INTERVAL 1 HOUR,'1','errorExperssion',null,null),
(5,5,now(),now()+ INTERVAL 1 HOUR,'1','errorExperssion',null,null);

/*************/
insert into appdeveloper values
(1,1),
(6,2),
(11,3),
(16,4),
(2,5);

/**************/

















