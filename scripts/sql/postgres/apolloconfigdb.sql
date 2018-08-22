UPDATE pg_cast SET castcontext='a' WHERE castsource ='integer'::regtype and casttarget='boolean'::regtype;
UPDATE pg_cast SET castcontext='i' WHERE castsource ='boolean'::regtype and casttarget='integer'::regtype;


DROP TABLE IF EXISTS App;

CREATE TABLE App (
  Id SERIAL,
  AppId varchar(500) NOT NULL DEFAULT 'default',
  Name varchar(500) NOT NULL DEFAULT 'default',
  OrgId varchar(32) NOT NULL DEFAULT 'default',
  OrgName varchar(64) NOT NULL DEFAULT 'default',
  OwnerName varchar(500) NOT NULL DEFAULT 'default',
  OwnerEmail varchar(500) NOT NULL DEFAULT 'default',
  IsDeleted boolean NOT NULL DEFAULT false,
  DataChange_CreatedBy varchar(32) NOT NULL DEFAULT 'default',
  DataChange_CreatedTime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  DataChange_LastModifiedBy varchar(32) DEFAULT '',
  DataChange_LastTime timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (Id)
);

DROP TABLE IF EXISTS AppNamespace;

CREATE TABLE AppNamespace (
  Id SERIAL,
  Name varchar(500) NOT NULL DEFAULT '',
  AppId varchar(500) NOT NULL DEFAULT '',
  Format varchar(32) NOT NULL DEFAULT 'properties',
  IsPublic boolean NOT NULL DEFAULT false,
  Comment varchar(64) NOT NULL DEFAULT '',
  IsDeleted boolean NOT NULL DEFAULT false,
  DataChange_CreatedBy varchar(32) NOT NULL DEFAULT '',
  DataChange_CreatedTime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  DataChange_LastModifiedBy varchar(32) DEFAULT '',
  DataChange_LastTime timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (Id)
);

DROP TABLE IF EXISTS Audit;

CREATE TABLE Audit (
  Id SERIAL,
  EntityName varchar(50) NOT NULL DEFAULT 'default',
  EntityId bigint DEFAULT NULL,
  OpName varchar(50) NOT NULL DEFAULT 'default',
  Comment varchar(500) DEFAULT NULL,
  IsDeleted boolean NOT NULL DEFAULT false,
  DataChange_CreatedBy varchar(32) NOT NULL DEFAULT 'default',
  DataChange_CreatedTime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  DataChange_LastModifiedBy varchar(32) DEFAULT '',
  DataChange_LastTime timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (Id)
);

DROP TABLE IF EXISTS Cluster;

CREATE TABLE Cluster (
  Id SERIAL,
  Name varchar(500) NOT NULL DEFAULT '',
  AppId varchar(500) NOT NULL DEFAULT '',
  ParentClusterId bigint NOT NULL DEFAULT '0',
  IsDeleted boolean NOT NULL DEFAULT false,
  DataChange_CreatedBy varchar(32) NOT NULL DEFAULT '',
  DataChange_CreatedTime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  DataChange_LastModifiedBy varchar(32) DEFAULT '',
  DataChange_LastTime timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (Id)
);

DROP TABLE IF EXISTS Commit;

CREATE TABLE Commit (
  Id SERIAL,
  ChangeSets text NOT NULL,
  AppId varchar(500) NOT NULL DEFAULT 'default',
  ClusterName varchar(500) NOT NULL DEFAULT 'default',
  NamespaceName varchar(500) NOT NULL DEFAULT 'default',
  Comment varchar(500) DEFAULT NULL,
  IsDeleted boolean NOT NULL DEFAULT false,
  DataChange_CreatedBy varchar(32) NOT NULL DEFAULT 'default',
  DataChange_CreatedTime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  DataChange_LastModifiedBy varchar(32) DEFAULT '',
  DataChange_LastTime timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (Id)
);

DROP TABLE IF EXISTS GrayReleaseRule;

CREATE TABLE GrayReleaseRule (
  Id SERIAL,
  AppId varchar(500) NOT NULL DEFAULT 'default',
  ClusterName varchar(500) NOT NULL DEFAULT 'default',
  NamespaceName varchar(500) NOT NULL DEFAULT 'default',
  BranchName varchar(500) NOT NULL DEFAULT 'default',
  Rules varchar(14000) DEFAULT '[]',
  ReleaseId bigint NOT NULL DEFAULT '0',
  BranchStatus smallint DEFAULT '1',
  IsDeleted boolean NOT NULL DEFAULT false,
  DataChange_CreatedBy varchar(32) NOT NULL DEFAULT 'default',
  DataChange_CreatedTime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  DataChange_LastModifiedBy varchar(32) DEFAULT '',
  DataChange_LastTime timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (Id)
);

DROP TABLE IF EXISTS Instance;

CREATE TABLE Instance (
  Id SERIAL,
  AppId varchar(500) NOT NULL DEFAULT 'default',
  ClusterName varchar(500) NOT NULL DEFAULT 'default',
  DataCenter varchar(64) NOT NULL DEFAULT 'default',
  Ip varchar(32) NOT NULL DEFAULT '',
  DataChange_CreatedTime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  DataChange_LastTime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (Id)
);

DROP TABLE IF EXISTS InstanceConfig;

CREATE TABLE InstanceConfig (
  Id SERIAL,
  InstanceId bigint DEFAULT NULL,
  ConfigAppId varchar(500) NOT NULL DEFAULT 'default',
  ConfigClusterName varchar(500) NOT NULL DEFAULT 'default',
  ConfigNamespaceName varchar(500) NOT NULL DEFAULT 'default',
  ReleaseKey varchar(64) NOT NULL DEFAULT '',
  ReleaseDeliveryTime timestamp NULL DEFAULT NULL,
  DataChange_CreatedTime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  DataChange_LastTime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (Id)
);

DROP TABLE IF EXISTS Item;

CREATE TABLE Item (
  Id SERIAL,
  NamespaceId bigint NOT NULL DEFAULT '0',
  Key varchar(128) NOT NULL DEFAULT 'default',
  Value text NOT NULL,
  Comment varchar(1024) DEFAULT '',
  LineNum bigint DEFAULT '0',
  IsDeleted boolean NOT NULL DEFAULT false,
  DataChange_CreatedBy varchar(32) NOT NULL DEFAULT 'default',
  DataChange_CreatedTime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  DataChange_LastModifiedBy varchar(32) DEFAULT '',
  DataChange_LastTime timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (Id)
);

DROP TABLE IF EXISTS Namespace;

CREATE TABLE Namespace (
  Id SERIAL,
  AppId varchar(500) NOT NULL DEFAULT 'default',
  ClusterName varchar(500) NOT NULL DEFAULT 'default',
  NamespaceName varchar(500) NOT NULL DEFAULT 'default',
  IsDeleted boolean NOT NULL DEFAULT false,
  DataChange_CreatedBy varchar(32) NOT NULL DEFAULT 'default',
  DataChange_CreatedTime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  DataChange_LastModifiedBy varchar(32) DEFAULT '',
  DataChange_LastTime timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (Id)
);

DROP TABLE IF EXISTS NamespaceLock;

CREATE TABLE NamespaceLock (
  Id SERIAL,
  NamespaceId bigint NOT NULL DEFAULT '0',
  DataChange_CreatedBy varchar(32) NOT NULL DEFAULT 'default',
  DataChange_CreatedTime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  DataChange_LastModifiedBy varchar(32) DEFAULT 'default',
  DataChange_LastTime timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  IsDeleted boolean DEFAULT false,
  PRIMARY KEY (Id)
);

DROP TABLE IF EXISTS Release;

CREATE TABLE Release (
  Id SERIAL,
  ReleaseKey varchar(64) NOT NULL DEFAULT '',
  Name varchar(64) NOT NULL DEFAULT 'default',
  Comment varchar(256) DEFAULT NULL,
  AppId varchar(500) NOT NULL DEFAULT 'default',
  ClusterName varchar(500) NOT NULL DEFAULT 'default',
  NamespaceName varchar(500) NOT NULL DEFAULT 'default',
  Configurations text NOT NULL,
  IsAbandoned boolean NOT NULL DEFAULT false,
  IsDeleted boolean NOT NULL DEFAULT false,
  DataChange_CreatedBy varchar(32) NOT NULL DEFAULT 'default',
  DataChange_CreatedTime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  DataChange_LastModifiedBy varchar(32) DEFAULT '',
  DataChange_LastTime timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (Id)
);

DROP TABLE IF EXISTS ReleaseHistory;

CREATE TABLE ReleaseHistory (
  Id SERIAL,
  AppId varchar(500) NOT NULL DEFAULT 'default',
  ClusterName varchar(500) NOT NULL DEFAULT 'default',
  NamespaceName varchar(500) NOT NULL DEFAULT 'default',
  BranchName varchar(500) NOT NULL DEFAULT 'default',
  ReleaseId bigint NOT NULL DEFAULT '0',
  PreviousReleaseId bigint NOT NULL DEFAULT '0',
  Operation smallint NOT NULL DEFAULT '0',
  OperationContext text NOT NULL,
  IsDeleted boolean NOT NULL DEFAULT false,
  DataChange_CreatedBy varchar(32) NOT NULL DEFAULT 'default',
  DataChange_CreatedTime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  DataChange_LastModifiedBy varchar(32) DEFAULT '',
  DataChange_LastTime timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (Id)
);

DROP TABLE IF EXISTS ReleaseMessage;

CREATE TABLE ReleaseMessage (
  Id SERIAL,
  Message varchar(1024) NOT NULL DEFAULT '',
  DataChange_LastTime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (Id)
);

DROP TABLE IF EXISTS ServerConfig;

CREATE TABLE ServerConfig (
  Id SERIAL,
  Key varchar(64) NOT NULL DEFAULT 'default',
  Cluster varchar(500) NOT NULL DEFAULT 'default',
  Value varchar(2048) NOT NULL DEFAULT 'default',
  Comment varchar(1024) DEFAULT '',
  IsDeleted boolean NOT NULL DEFAULT false,
  DataChange_CreatedBy varchar(32) NOT NULL DEFAULT 'default',
  DataChange_CreatedTime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  DataChange_LastModifiedBy varchar(32) DEFAULT '',
  DataChange_LastTime timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (Id)
);

DROP SEQUENCE IF EXISTS hibernate_sequence;
CREATE SEQUENCE hibernate_sequence;

INSERT INTO ServerConfig (Key, Cluster, Value, Comment,IsDeleted)
VALUES
    ('eureka.service.url', 'default', 'http://localhost:8080/eureka/', 'Eureka服务Url，多个service以英文逗号分隔','1'),
    ('namespace.lock.switch', 'default', 'false', '一次发布只能有一个人修改开关','0'),
    ('item.value.length.limit', 'default', '20000', 'item value最大长度限制','0'),
    ('appnamespace.private.enable', 'default', 'false', '是否开启private namespace','0'),
    ('item.key.length.limit', 'default', '128', 'item key 最大长度限制','0');



