# Initial Creation
drop database if exists DnD_CharacterDB;
CREATE DATABASE DnD_CharacterDB;
USE DnD_CharacterDB;

#Player Character Entity
CREATE TABLE PlayerCharacter (
    CharID INT AUTO_INCREMENT PRIMARY KEY,
    CharName VARCHAR(255) NOT NULL,
    CharLevel INT NOT NULL,
    STR INT,
    CON INT,
    DEX INT,
    WIS INT,
    INTEL INT,
    CHA INT,
    MaxHP INT
);

#Class Entity
CREATE TABLE Classes (
    ClassName VARCHAR(100) PRIMARY KEY,
    PrimaryStat1 VARCHAR(50),
    PrimaryStat2 VARCHAR(50),
    HitDie VARCHAR(10)
);

#Character implemented Classes
CREATE TABLE CharacterClasses (
    CharID INT,
    ClassName VARCHAR(100),
    PRIMARY KEY (CharID, ClassName),
    FOREIGN KEY (CharID) REFERENCES PlayerCharacter(CharID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ClassName) REFERENCES Classes(ClassName)
        ON DELETE CASCADE ON UPDATE CASCADE
);

#Spells Entity
CREATE TABLE Spells (
    SpellName VARCHAR(100) PRIMARY KEY,
    SpellLevel INT,
    CastingTime VARCHAR(50),
    School VARCHAR(50),
    Duration VARCHAR(50),
    SpellRange VARCHAR(50),
    Components VARCHAR(100),
    IsRitual BOOLEAN
);

#Class Spells implemented Spells
CREATE TABLE ClassSpells (
    ClassName VARCHAR(100),
    SpellName VARCHAR(100),
    PRIMARY KEY (ClassName, SpellName),
    FOREIGN KEY (ClassName) REFERENCES Classes(ClassName)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (SpellName) REFERENCES Spells(SpellName)
        ON DELETE CASCADE ON UPDATE CASCADE
);

#Character implemented Class spells
CREATE TABLE CharacterSpellsPrepared (
    CharID INT,
    SpellName VARCHAR(100),
    PRIMARY KEY (CharID, SpellName),
    FOREIGN KEY (CharID) REFERENCES PlayerCharacter(CharID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (SpellName) REFERENCES Spells(SpellName)
        ON DELETE CASCADE ON UPDATE CASCADE
);

#Weapons Entity
CREATE TABLE Weapons (
    WeaponName VARCHAR(100) PRIMARY KEY,
    Distance VARCHAR(50),
    DamageType VARCHAR(50),
    Properties VARCHAR(100),
    DamageDice VARCHAR(20)
);


#Character implented Weapons
CREATE TABLE CharacterWeapons (
    CharID INT,
    WeaponName VARCHAR(100),
    PRIMARY KEY (CharID, WeaponName),
    FOREIGN KEY (CharID) REFERENCES PlayerCharacter(CharID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (WeaponName) REFERENCES Weapons(WeaponName)
        ON DELETE CASCADE ON UPDATE CASCADE
);

#Backgrounds Entity
CREATE TABLE Backgrounds (
    CharID INT,
    BackgroundName VARCHAR(100),
    PRIMARY KEY (CharID, BackgroundName),
    FOREIGN KEY (CharID) REFERENCES PlayerCharacter(CharID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    BackgroundProficiencies VARCHAR(255),
    Languages VARCHAR(255)
);

#Feats Entity
CREATE TABLE Feats (
    FeatName VARCHAR(100) PRIMARY KEY
);

#Character implemented Feats
CREATE TABLE CharacterFeats (
    CharID INT,
    FeatName VARCHAR(100),
    PRIMARY KEY (CharID, FeatName),
    FOREIGN KEY (CharID) REFERENCES PlayerCharacter(CharID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (FeatName) REFERENCES Feats(FeatName)
        ON DELETE CASCADE ON UPDATE CASCADE
);

#Species Entity
CREATE TABLE Species (
CharID INT,
    SpeciesName VARCHAR(100),
    PRIMARY KEY (CharID, SpeciesName),
    FOREIGN KEY (CharID) REFERENCES PlayerCharacter(CharID)
        ON DELETE CASCADE ON UPDATE CASCADE,
	CreatureType VARCHAR(50),
    Speed INT,
    SpeciesProficiencies VARCHAR(255)
);