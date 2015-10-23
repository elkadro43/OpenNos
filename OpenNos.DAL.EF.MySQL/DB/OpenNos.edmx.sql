










































-- -----------------------------------------------------------
-- Entity Designer DDL Script for MySQL Server 4.1 and higher
-- -----------------------------------------------------------
-- Date Created: 10/23/2015 19:03:40

-- Generated from EDMX file: C:\Users\Alex\Documents\GitHub\OpenNos\OpenNos.DAL.EF.MySQL\DB\OpenNos.edmx
-- Target version: 3.0.0.0

-- --------------------------------------------------



-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- NOTE: if the constraint does not exist, an ignorable error will be reported.
-- --------------------------------------------------


--    ALTER TABLE `character` DROP CONSTRAINT `FK_AccountCharacter`;

--    ALTER TABLE `familyhistory` DROP CONSTRAINT `FK_familyhistoryfamily`;

--    ALTER TABLE `inventory` DROP CONSTRAINT `FK_inventoryitems`;

--    ALTER TABLE `runes` DROP CONSTRAINT `FK_itemsrunes`;

--    ALTER TABLE `family` DROP CONSTRAINT `FK_familywarehouse`;

--    ALTER TABLE `shop` DROP CONSTRAINT `FK_npcshop`;

--    ALTER TABLE `logSet` DROP CONSTRAINT `FK_accountlog`;

--    ALTER TABLE `CharacterFamily` DROP CONSTRAINT `FK_familycharacterfamily`;


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------
SET foreign_key_checks = 0;

    DROP TABLE IF EXISTS `account`;

    DROP TABLE IF EXISTS `character`;

    DROP TABLE IF EXISTS `CharacterFamily`;

    DROP TABLE IF EXISTS `family`;

    DROP TABLE IF EXISTS `familyhistory`;

    DROP TABLE IF EXISTS `friend`;

    DROP TABLE IF EXISTS `inventory`;

    DROP TABLE IF EXISTS `items`;

    DROP TABLE IF EXISTS `listskill`;

    DROP TABLE IF EXISTS `miniland`;

    DROP TABLE IF EXISTS `monsters`;

    DROP TABLE IF EXISTS `npcs`;

    DROP TABLE IF EXISTS `partner`;

    DROP TABLE IF EXISTS `pet`;

    DROP TABLE IF EXISTS `portals`;

    DROP TABLE IF EXISTS `runes`;

    DROP TABLE IF EXISTS `shop`;

    DROP TABLE IF EXISTS `warehouse`;

    DROP TABLE IF EXISTS `actionSet1`;

    DROP TABLE IF EXISTS `logSet`;

SET foreign_key_checks = 1;

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------


CREATE TABLE `account`(
	`AccountId` bigint NOT NULL, 
	`Name` varchar (255) NOT NULL, 
	`Password` varchar (255) NOT NULL, 
	`Authority` smallint NOT NULL, 
	`LastSession` int NOT NULL, 
	`LoggedIn` bool NOT NULL);

ALTER TABLE `account` ADD PRIMARY KEY (AccountId);





CREATE TABLE `character`(
	`CharacterId` bigint NOT NULL AUTO_INCREMENT UNIQUE, 
	`AccountId` bigint NOT NULL, 
	`Name` varchar (255) NOT NULL, 
	`Slot` TINYINT UNSIGNED NOT NULL, 
	`Gender` TINYINT UNSIGNED NOT NULL, 
	`Class` TINYINT UNSIGNED NOT NULL, 
	`HairStyle` TINYINT UNSIGNED NOT NULL, 
	`HairColor` TINYINT UNSIGNED NOT NULL, 
	`Map` smallint NOT NULL, 
	`MapX` smallint NOT NULL, 
	`MapY` smallint NOT NULL, 
	`Hp` int NOT NULL, 
	`Mp` int NOT NULL, 
	`ArenaWinner` int NOT NULL, 
	`Reput` int NOT NULL, 
	`Dignite` int NOT NULL, 
	`Gold` bigint NOT NULL, 
	`Backpack` int NOT NULL, 
	`Level` TINYINT UNSIGNED NOT NULL, 
	`LevelXp` int NOT NULL, 
	`JobLevel` TINYINT UNSIGNED NOT NULL, 
	`JobLevelXp` int NOT NULL, 
	`Dead` int NOT NULL, 
	`Kill` int NOT NULL, 
	`Contribution` int NOT NULL, 
	`Faction` int NOT NULL);

ALTER TABLE `character` ADD PRIMARY KEY (CharacterId);





CREATE TABLE `CharacterFamily`(
	`CharacterId` bigint NOT NULL, 
	`Xp` varchar (255) NOT NULL, 
	`Authority` varchar (255) NOT NULL, 
	`Message` varchar (255), 
	`FamilyName` varchar (255) NOT NULL);

ALTER TABLE `CharacterFamily` ADD PRIMARY KEY (CharacterId);





CREATE TABLE `family`(
	`FamilyName` varchar (255) NOT NULL, 
	`FamilyLevel` int, 
	`FamilyInventory` int, 
	`FamilySizeMax` int, 
	`FamilyAnnounce` longtext, 
	`warehouse_WareHouseId` int NOT NULL);

ALTER TABLE `family` ADD PRIMARY KEY (FamilyName);





CREATE TABLE `familyhistory`(
	`FamilyHistoryId` int NOT NULL, 
	`Fxp` varchar (255) NOT NULL, 
	`Message` varchar (255) NOT NULL, 
	`family_FamilyName` varchar (255) NOT NULL);

ALTER TABLE `familyhistory` ADD PRIMARY KEY (FamilyHistoryId);





CREATE TABLE `friend`(
	`FriendId` int NOT NULL, 
	`CharacterId` int NOT NULL, 
	`Friend` int NOT NULL);

ALTER TABLE `friend` ADD PRIMARY KEY (FriendId);





CREATE TABLE `inventory`(
	`InventoryId` int NOT NULL AUTO_INCREMENT UNIQUE, 
	`Character` varchar (255) NOT NULL, 
	`Slot` varchar (255) NOT NULL, 
	`Pos` varchar (255) NOT NULL, 
	`CharacterId` bigint NOT NULL, 
	`items_ItemId` int NOT NULL);

ALTER TABLE `inventory` ADD PRIMARY KEY (InventoryId);





CREATE TABLE `items`(
	`ItemId` int NOT NULL AUTO_INCREMENT UNIQUE, 
	`VNUM` int NOT NULL, 
	`Quantity` int NOT NULL, 
	`Rare` int NOT NULL, 
	`Upgraded` int NOT NULL, 
	`Color` int NOT NULL, 
	`DamageMin` int NOT NULL, 
	`DamageMax` int NOT NULL, 
	`ProtectHit` int NOT NULL, 
	`ProtectDist` int NOT NULL, 
	`ProtectMagic` int NOT NULL, 
	`DodgeHit` int NOT NULL, 
	`DodgeDist` int NOT NULL, 
	`Rune` int, 
	`FireRez` int NOT NULL, 
	`LightRez` int NOT NULL, 
	`WaterRez` int NOT NULL, 
	`DarkRez` int NOT NULL, 
	`SlHit` int, 
	`SlDef` int, 
	`SlMp` int, 
	`SlEle` int);

ALTER TABLE `items` ADD PRIMARY KEY (ItemId);





CREATE TABLE `listskill`(
	`SkillId` int NOT NULL AUTO_INCREMENT UNIQUE, 
	`Vnum` longtext NOT NULL);

ALTER TABLE `listskill` ADD PRIMARY KEY (SkillId);





CREATE TABLE `miniland`(
	`MinilandId` int NOT NULL, 
	`Owner` int NOT NULL, 
	`Item` varchar (255), 
	`X` varchar (255), 
	`Y` varchar (255));

ALTER TABLE `miniland` ADD PRIMARY KEY (MinilandId);





CREATE TABLE `monsters`(
	`MonsterId` int NOT NULL, 
	`VNUM` int NOT NULL, 
	`Map` int NOT NULL, 
	`X` int NOT NULL, 
	`Y` int NOT NULL);

ALTER TABLE `monsters` ADD PRIMARY KEY (MonsterId);





CREATE TABLE `npcs`(
	`NpcId` int NOT NULL AUTO_INCREMENT UNIQUE, 
	`VNUM` int NOT NULL, 
	`Map` int NOT NULL, 
	`X` int NOT NULL, 
	`Y` int NOT NULL);

ALTER TABLE `npcs` ADD PRIMARY KEY (NpcId);





CREATE TABLE `partner`(
	`PartnerId` int NOT NULL AUTO_INCREMENT UNIQUE, 
	`CharacterId` bigint NOT NULL, 
	`owner` int NOT NULL, 
	`Level` int, 
	`isBackpacked` int, 
	`SP` int, 
	`Weapon` int, 
	`Armor` int, 
	`Gloves` int, 
	`Boots` int, 
	`IsTeamed` int, 
	`Hp` int, 
	`Mp` int);

ALTER TABLE `partner` ADD PRIMARY KEY (PartnerId);





CREATE TABLE `pet`(
	`PetId` int NOT NULL AUTO_INCREMENT UNIQUE, 
	`CharacterId` bigint NOT NULL, 
	`IsHelper` int NOT NULL, 
	`Owner` varchar (255) NOT NULL, 
	`Level` int NOT NULL, 
	`Def` int NOT NULL, 
	`Hit` int NOT NULL, 
	`isWareHouseAccess` int, 
	`isTeamed` int, 
	`Hp` int, 
	`Mp` int);

ALTER TABLE `pet` ADD PRIMARY KEY (PetId);





CREATE TABLE `portals`(
	`PortalId` int NOT NULL, 
	`SrcMap` int NOT NULL, 
	`SrcX` int NOT NULL, 
	`SrcY` int NOT NULL, 
	`DestMap` int NOT NULL, 
	`DestX` int NOT NULL, 
	`DestY` int NOT NULL);

ALTER TABLE `portals` ADD PRIMARY KEY (PortalId);





CREATE TABLE `runes`(
	`RuneId` int NOT NULL AUTO_INCREMENT UNIQUE, 
	`Type` int NOT NULL, 
	`SubType` int NOT NULL, 
	`Value` int NOT NULL, 
	`item_ItemId` int NOT NULL);

ALTER TABLE `runes` ADD PRIMARY KEY (RuneId);





CREATE TABLE `shop`(
	`ShopId` int NOT NULL, 
	`Slot` int NOT NULL, 
	`Item` int NOT NULL, 
	`NpcId` int NOT NULL);

ALTER TABLE `shop` ADD PRIMARY KEY (ShopId);





CREATE TABLE `warehouse`(
	`WareHouseId` int NOT NULL, 
	`Owner` int NOT NULL, 
	`Item` int NOT NULL, 
	`Pos` int NOT NULL);

ALTER TABLE `warehouse` ADD PRIMARY KEY (WareHouseId);





CREATE TABLE `actionSet1`(
	`ActionId` int NOT NULL AUTO_INCREMENT UNIQUE, 
	`Action` varchar (255), 
	`Key` int NOT NULL, 
	`Slot` int NOT NULL);

ALTER TABLE `actionSet1` ADD PRIMARY KEY (ActionId);





CREATE TABLE `connectionlog`(
	`LogId` bigint NOT NULL AUTO_INCREMENT UNIQUE, 
	`AccountId` bigint NOT NULL, 
	`IpAddress` longtext NOT NULL, 
	`Timestamp` datetime NOT NULL);

ALTER TABLE `connectionlog` ADD PRIMARY KEY (LogId);







-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------


-- Creating foreign key on `AccountId` in table 'character'

ALTER TABLE `character`
ADD CONSTRAINT `FK_AccountCharacter`
    FOREIGN KEY (`AccountId`)
    REFERENCES `account`
        (`AccountId`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;


-- Creating non-clustered index for FOREIGN KEY 'FK_AccountCharacter'

CREATE INDEX `IX_FK_AccountCharacter`
    ON `character`
    (`AccountId`);



-- Creating foreign key on `family_FamilyName` in table 'familyhistory'

ALTER TABLE `familyhistory`
ADD CONSTRAINT `FK_familyhistoryfamily`
    FOREIGN KEY (`family_FamilyName`)
    REFERENCES `family`
        (`FamilyName`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;


-- Creating non-clustered index for FOREIGN KEY 'FK_familyhistoryfamily'

CREATE INDEX `IX_FK_familyhistoryfamily`
    ON `familyhistory`
    (`family_FamilyName`);



-- Creating foreign key on `items_ItemId` in table 'inventory'

ALTER TABLE `inventory`
ADD CONSTRAINT `FK_inventoryitems`
    FOREIGN KEY (`items_ItemId`)
    REFERENCES `items`
        (`ItemId`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;


-- Creating non-clustered index for FOREIGN KEY 'FK_inventoryitems'

CREATE INDEX `IX_FK_inventoryitems`
    ON `inventory`
    (`items_ItemId`);



-- Creating foreign key on `item_ItemId` in table 'runes'

ALTER TABLE `runes`
ADD CONSTRAINT `FK_itemsrunes`
    FOREIGN KEY (`item_ItemId`)
    REFERENCES `items`
        (`ItemId`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;


-- Creating non-clustered index for FOREIGN KEY 'FK_itemsrunes'

CREATE INDEX `IX_FK_itemsrunes`
    ON `runes`
    (`item_ItemId`);



-- Creating foreign key on `warehouse_WareHouseId` in table 'family'

ALTER TABLE `family`
ADD CONSTRAINT `FK_familywarehouse`
    FOREIGN KEY (`warehouse_WareHouseId`)
    REFERENCES `warehouse`
        (`WareHouseId`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;


-- Creating non-clustered index for FOREIGN KEY 'FK_familywarehouse'

CREATE INDEX `IX_FK_familywarehouse`
    ON `family`
    (`warehouse_WareHouseId`);



-- Creating foreign key on `NpcId` in table 'shop'

ALTER TABLE `shop`
ADD CONSTRAINT `FK_npcshop`
    FOREIGN KEY (`NpcId`)
    REFERENCES `npcs`
        (`NpcId`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;


-- Creating non-clustered index for FOREIGN KEY 'FK_npcshop'

CREATE INDEX `IX_FK_npcshop`
    ON `shop`
    (`NpcId`);



-- Creating foreign key on `AccountId` in table 'connectionlog'

ALTER TABLE `connectionlog`
ADD CONSTRAINT `FK_accountlog`
    FOREIGN KEY (`AccountId`)
    REFERENCES `account`
        (`AccountId`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;


-- Creating non-clustered index for FOREIGN KEY 'FK_accountlog'

CREATE INDEX `IX_FK_accountlog`
    ON `connectionlog`
    (`AccountId`);



-- Creating foreign key on `FamilyName` in table 'CharacterFamily'

ALTER TABLE `CharacterFamily`
ADD CONSTRAINT `FK_familycharacterfamily`
    FOREIGN KEY (`FamilyName`)
    REFERENCES `family`
        (`FamilyName`)
    ON DELETE NO ACTION ON UPDATE NO ACTION;


-- Creating non-clustered index for FOREIGN KEY 'FK_familycharacterfamily'

CREATE INDEX `IX_FK_familycharacterfamily`
    ON `CharacterFamily`
    (`FamilyName`);



-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
