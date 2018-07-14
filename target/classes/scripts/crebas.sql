drop database netctoss;

create database netctoss default charset=utf8;
use netctoss;

/*管理员表*/
DROP TABLE sys_admin;
create  table  sys_admin(
  id int(11) auto_increment  not  null,
  username varchar(16) not null,
  password  varchar(16) not null,
  realname varchar(16) not null,
  phone varchar(16) not null,
  email varchar(32) not null,
  granttime varchar(16) not null,
  role varchar(16) not null,
  primary  key  (id)
)default charset=utf8;


/*角色表*/
DROP TABLE sys_role;

create  table  sys_role(
  id int(11) auto_increment  not  null,
  rolename varchar(16) not null,
  manager_mana  int default 0,
  role_mana  int default 0,
  charge_mana  int default 0,
  account_mana int default 0,
  business_mana  int default 0,
  bill_mana  int default 0,
  form_mana  int default 0,
  primary  key  (id)
)default charset=utf8;


/*资费表*/

CREATE TABLE sys_charge (
  feeid int(11) PRIMARY KEY AUTO_INCREMENT,
  feename varchar(16) NOT NULL COMMENT '资费名称',
  feetype enum('计时','套餐','包月') DEFAULT '包月' COMMENT '资费类型',
  duration int(11) COMMENT '基本时长',
  charge decimal(10,2) unsigned COMMENT '基本费用',
  percharge decimal(10,2) unsigned COMMENT '单位费用',
  createtime datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  opentime datetime COMMENT '开通时间',
  status enum('暂停','开通','删除') DEFAULT '暂停' COMMENT '状态',
  chardescrip varchar(200) COMMENT '资费说明'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


/*帐务帐号表*/
create  table  sys_account(
  id int(11) auto_increment,
  username varchar(16) not null,
  password  varchar(16) not null,
  realname varchar(16) not null,
  phone varchar(16) not null,
  cardid varchar(18) not null,
  status int DEFAULT 1 ,
  createtime  datetime DEFAULT CURRENT_TIMESTAMP,
  lastlogintime varchar(16),
  totaltime varchar(16),
  month varchar(16),
  primary  key  (id)
)default charset=utf8;

/*业务帐号表*/
create  table  sys_business(
  id int(11) auto_increment,
  accountid int(11),
  osid varchar(16) not null,
  password  varchar(16) not null,
  realname varchar(16) not null,
  phone varchar(16) not null,
  cardid varchar(18) not null,
  status int DEFAULT 1 ,
  createtime  datetime DEFAULT CURRENT_TIMESTAMP,
  ip varchar(16),
  chargetypeid int(11),
  pausetime varchar(16),
  totaltime varchar(16),
  month varchar(16),
  isdelete int DEFAULT 0,
  deletetime DATETIME,
  primary  key  (id),
  foreign key(accountid) references sys_account(id),
  foreign key(chargetypeid) references sys_charge(feeid)
)default charset=utf8;

CREATE TRIGGER addusetime
  AFTER UPDATE ON sys_business
  FOR EACH ROW
  BEGIN
    UPDATE sys_account SET sys_account.totaltime = sys_account.totaltime+NEW.totaltime
    WHERE sys_account.id = sys_business.accountid
END;