/*角色表*/
delete from sys_role;

insert into sys_role(rolename,manager_mana,role_mana,charge_mana,account_mana,
	business_mana,bill_mana, form_mana) values('超级管理员', 1,1,1,1,1,1,1);
insert into sys_role(rolename,manager_mana,role_mana,charge_mana,account_mana,
	business_mana,bill_mana, form_mana) values('管理员', 1,1,1,0,0,1,1);
	
insert into sys_role(rolename,manager_mana,role_mana,charge_mana,account_mana,
	business_mana,bill_mana, form_mana) values('人事部', 1,0,0,0,0,0,0);
	
SELECT * from sys_role;

/*管理员表*/
delete from sys_admin;

insert into sys_admin(username,password,realname,phone,email,granttime,role) values(
'zs', '0001', '张三', '18279771854', '298745123@qq.com', '2018-07-11', '超级管理员');
insert into sys_admin(username,password,realname,phone,email,granttime,role) values(
'zs', '0001', '李四', '18279771854', '298745123@qq.com', '2018-07-11', '管理员');

insert into sys_admin(username,password,realname,phone,email,granttime,role) values(
'rs', '0001', '李四', '18279771854', '298745123@qq.com', '2018-07-11', '人事部');

SELECT * from sys_admin;


/*资费表*/
delete from sys_charge; 

insert into sys_charge(feeid,feename, feetype, duration, charge, percharge, createtime, opentime, status, chardescrip) 
	VALUES ('1','包40小时', '包月', '40', '40.50', '3.00', '2018-07-12 10:48:52', '2018-07-15 00:00:00', '开通', NULL);
	
insert into sys_charge(feename,duration,charge,percharge,chardescrip) values
	('包40小时', '40', '22.5', '2.87', '顾客要求不要打扰');

insert into sys_charge(feename,duration,charge,percharge,chardescrip) values
	('包20小时', '20', '24.5', '3.00', '包 20 小时，20 小时以内 24.5 元，超出部分 3.00 元/小时');
	

SELECT * from sys_charge;


