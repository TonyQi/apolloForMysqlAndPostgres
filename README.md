Apollo（配置中心基于携程Apollo进行修改）
# Features
*修改apollo-biz、apollo-common中针对与mysql的属性
*对于Mysql需将Mysql设置lower_case_table_names=1;
*针对postgres的支持，需要登陆Postgres数据库进行修改。

* **Postgres数据库支持修改步骤**
*已Postgres管理员用户登录Postgres控制台；
*选择ApolloConfidDB的数据库
* **执行以下脚本**
*UPDATE pg_cast SET castcontext='a' WHERE castsource ='integer'::regtype and casttarget='boolean'::regtype;
*UPDATE pg_cast SET castcontext='i' WHERE castsource ='boolean'::regtype and casttarget='integer'::regtype;
# 对于Apollo-Portal未做Postgres支持
