#!/bin/bash
mysql -u root --password='Wisdom@1234' -e 'create database metastore default character set utf8';

mysql -u root --password='Wisdom@1234' -e "create user 'hive'@'%' identified by 'Wisdom@1234'";
mysql -u root --password='Wisdom@1234' -e 'create database hive default character set utf8';
mysql -u root --password='Wisdom@1234' -e "grant all privileges on hive.* to 'hive'@'%'";
mysql -u root --password='Wisdom@1234' -e "grant all privileges on metastore.* to 'hive'@'%'";

mysql -u root --password='Wisdom@1234' -e "create user 'amon'@'%' identified by 'Wisdom@1234'";
mysql -u root --password='Wisdom@1234' -e 'create database amon default character set utf8';
mysql -u root --password='Wisdom@1234' -e "grant all privileges on amon.* to 'amon'@'%'";

mysql -u root --password='Wisdom@1234' -e "create user 'rman'@'%' identified by 'Wisdom@1234'";
mysql -u root --password='Wisdom@1234' -e 'create database rman default character set utf8';
mysql -u root --password='Wisdom@1234' -e "grant all privileges on rman.* to 'rman'@'%'";

mysql -u root --password='Wisdom@1234' -e "create user 'sentry'@'%' identified by 'Wisdom@1234'";
mysql -u root --password='Wisdom@1234' -e 'create database sentry default character set utf8';
mysql -u root --password='Wisdom@1234' -e "grant all privileges on sentry.* to 'sentry'@'%'";

mysql -u root --password='Wisdom@1234' -e "create user 'nav'@'%' identified by 'Wisdom@1234'";
mysql -u root --password='Wisdom@1234' -e 'create database nav default character set utf8';
mysql -u root --password='Wisdom@1234' -e "grant all privileges on nav.* to 'nav'@'%'";

mysql -u root --password='Wisdom@1234' -e "create user 'navms'@'%' identified by 'Wisdom@1234'";
mysql -u root --password='Wisdom@1234' -e 'create database navms default character set utf8';
mysql -u root --password='Wisdom@1234' -e "grant all privileges on navms.* to 'navms'@'%'";

mysql -u root --password='Wisdom@1234' -e "create user 'cm'@'%' identified by 'Wisdom@1234'";
mysql -u root --password='Wisdom@1234' -e 'create database cm default character set utf8';
mysql -u root --password='Wisdom@1234' -e "grant all privileges on cm.* to 'cm'@'%'";

mysql -u root --password='Wisdom@1234' -e "create user 'oos'@'%' identified by 'Wisdom@1234'";
mysql -u root --password='Wisdom@1234' -e 'create database oos default character set utf8';
mysql -u root --password='Wisdom@1234' -e "grant all privileges on oos.* to 'oos'@'%'";


mysql -u root --password='Wisdom@1234' -e "create user 'hue'@'%' identified by 'Wisdom@1234'";
mysql -u root --password='Wisdom@1234' -e 'create database hue default character set utf8';
mysql -u root --password='Wisdom@1234' -e "grant all privileges on hue.* to 'hue'@'%'";
