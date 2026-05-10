# Initial Creation
CREATE DATABASE DnD_CharacterDB;
USE DnD_CharacterDB;

#Player Character Entity
CREATE TABLE PlayerCharacter (
    CharID INT AUTO_INCREMENT PRIMARY KEY,
    CharName VARCHAR(100) NOT NULL,
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

#Populate Classes
INSERT INTO Classes (ClassName, PrimaryStat1, PrimaryStat2, HitDie) VALUES
('Barbarian', 'STR', 'CON', 'd12'),
('Bard', 'CHA', 'DEX', 'd8'),
('Cleric', 'WIS', 'CHA', 'd8'),
('Druid', 'WIS', 'INT', 'd8'),
('Fighter', 'STR', 'CON', 'd10'),
('Monk', 'DEX', 'WIS', 'd8'),
('Paladin', 'STR', 'CHA', 'd10'),
('Ranger', 'DEX', 'WIS', 'd10'),
('Rogue', 'DEX', 'INT', 'd8'),
('Sorcerer', 'CHA', 'CON', 'd6'),
('Warlock', 'CHA', 'CON', 'd8'),
('Wizard', 'INT', 'WIS', 'd6');

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

#Populate Spells
INSERT INTO Spells (SpellName, SpellLevel, CastingTime, School, Duration, SpellRange, Components, IsRitual) VALUES
-- CANTRIPS (LEVEL 0)
('Eldritch Blast', 0, '1 action', 'Evocation', 'Instantaneous', '120 feet', 'V,S', FALSE),
('Fire Bolt', 0, '1 action', 'Evocation', 'Instantaneous', '120 feet', 'V,S', FALSE),
('Sacred Flame', 0, '1 action', 'Evocation', 'Instantaneous', '60 feet', 'V,S', FALSE),
('Ray of Frost', 0, '1 action', 'Evocation', 'Instantaneous', '60 feet', 'V,S', FALSE),
('Guidance', 0, '1 action', 'Divination', '1 minute', 'Touch', 'V,S', FALSE),
('Mage Hand', 0, '1 action', 'Conjuration', '1 minute', '30 feet', 'V,S', FALSE),
('Prestidigitation', 0, '1 action', 'Transmutation', '1 hour', '10 feet', 'V,S', FALSE),
('Thaumaturgy', 0, '1 action', 'Transmutation', '1 minute', '30 feet', 'V,S', FALSE),
('Shillelagh', 0, '1 bonus action', 'Transmutation', '1 minute', 'Touch', 'V,S,M', FALSE),
('Minor Illusion', 0, '1 action', 'Illusion', '1 minute', '30 feet', 'S,M', FALSE),

-- LEVEL 1 SPELLS
('Magic Missile', 1, '1 action', 'Evocation', 'Instantaneous', '120 feet', 'V,S', FALSE),
('Shield', 1, '1 reaction', 'Abjuration', '1 round', 'Self', 'V,S', FALSE),
('Bless', 1, '1 action', 'Enchantment', '1 minute', '30 feet', 'V,S,M', FALSE),
('Cure Wounds', 1, '1 action', 'Evocation', 'Instantaneous', 'Touch', 'V,S', FALSE),
('Detect Magic', 1, '1 action', 'Divination', '10 minutes', 'Self', 'V,S', TRUE),
('Burning Hands', 1, '1 action', 'Evocation', 'Instantaneous', 'Self (15-foot cone)', 'V,S', FALSE),
('Thunderwave', 1, '1 action', 'Evocation', 'Instantaneous', 'Self (15-foot cube)', 'V,S', FALSE),
('Hunter\'s Mark', 1, '1 bonus action', 'Divination', '1 hour', '90 feet', 'V', FALSE),
('Hex', 1, '1 bonus action', 'Enchantment', '1 hour', '90 feet', 'V,S', FALSE),
('Faerie Fire', 1, '1 action', 'Evocation', '1 minute', '60 feet', 'V', FALSE),

-- LEVEL 2 SPELLS
('Misty Step', 2, '1 bonus action', 'Conjuration', 'Instantaneous', 'Self', 'V', FALSE),
('Hold Person', 2, '1 action', 'Enchantment', '1 minute', '60 feet', 'V,S,M', FALSE),
('Lesser Restoration', 2, '1 action', 'Abjuration', 'Instantaneous', 'Touch', 'V,S', FALSE),
('Scorching Ray', 2, '1 action', 'Evocation', 'Instantaneous', '120 feet', 'V,S', FALSE),
('Shatter', 2, '1 action', 'Evocation', 'Instantaneous', '60 feet', 'V,S,M', FALSE),
('Pass Without Trace', 2, '1 action', 'Abjuration', '1 hour', 'Self', 'V,S,M', FALSE),
('Mirror Image', 2, '1 action', 'Illusion', '1 minute', 'Self', 'V,S', FALSE),
('Spiritual Weapon', 2, '1 bonus action', 'Evocation', '1 minute', '60 feet', 'V,S', FALSE),
('Flaming Sphere', 2, '1 action', 'Conjuration', '1 minute', '60 feet', 'V,S,M', FALSE),
('Darkness', 2, '1 action', 'Evocation', '10 minutes', '60 feet', 'V,M', FALSE),

-- LEVEL 3 SPELLS
('Fireball', 3, '1 action', 'Evocation', 'Instantaneous', '150 feet', 'V,S,M', FALSE),
('Counterspell', 3, '1 reaction', 'Abjuration', 'Instantaneous', '60 feet', 'S', FALSE),
('Fly', 3, '1 action', 'Transmutation', '10 minutes', 'Touch', 'V,S,M', FALSE),
('Dispel Magic', 3, '1 action', 'Abjuration', 'Instantaneous', '120 feet', 'V,S', FALSE),
('Revivify', 3, '1 action', 'Conjuration', 'Instantaneous', 'Touch', 'V,S,M', FALSE),
('Haste', 3, '1 action', 'Transmutation', '1 minute', '30 feet', 'V,S,M', FALSE),
('Hypnotic Pattern', 3, '1 action', 'Illusion', '1 minute', '120 feet', 'S,M', FALSE),
('Lightning Bolt', 3, '1 action', 'Evocation', 'Instantaneous', '100 feet', 'V,S,M', FALSE),
('Spirit Guardians', 3, '1 action', 'Conjuration', '10 minutes', 'Self (15-foot radius)', 'V,S,M', FALSE),
('Fear', 3, '1 action', 'Illusion', '1 minute', 'Self (30-foot cone)', 'V,S,M', FALSE);

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

#Populate Class Spells Rules
INSERT INTO ClassSpells (ClassName, SpellName) VALUES
-- =========================
-- CANTRIPS (LEVEL 0)
-- =========================
-- Warlock
('Warlock', 'Eldritch Blast'),
-- Wizard
('Wizard', 'Fire Bolt'),
('Wizard', 'Ray of Frost'),
('Wizard', 'Mage Hand'),
('Wizard', 'Prestidigitation'),
('Wizard', 'Minor Illusion'),
-- Cleric
('Cleric', 'Sacred Flame'),
('Cleric', 'Thaumaturgy'),
('Cleric', 'Guidance'),
-- Druid
('Druid', 'Shillelagh'),
('Druid', 'Guidance'),
-- Bard
('Bard', 'Prestidigitation'),
('Bard', 'Mage Hand'),
('Bard', 'Minor Illusion'),
-- =========================
-- LEVEL 1 SPELLS
-- =========================
-- Wizard
('Wizard', 'Magic Missile'),
('Wizard', 'Shield'),
('Wizard', 'Burning Hands'),
('Wizard', 'Thunderwave'),
('Wizard', 'Detect Magic'),
-- Cleric
('Cleric', 'Bless'),
('Cleric', 'Cure Wounds'),
('Cleric', 'Detect Magic'),
('Cleric', 'Faerie Fire'),
-- Druid
('Druid', 'Cure Wounds'),
('Druid', 'Faerie Fire'),
-- Ranger
('Ranger', 'Hunter\'s Mark'),
-- Warlock
('Warlock', 'Hex'),
-- Bard
('Bard', 'Cure Wounds'),
('Bard', 'Thunderwave'),
('Bard', 'Detect Magic'),
-- Paladin
('Paladin', 'Bless'),
-- =========================
-- LEVEL 2 SPELLS
-- =========================
-- Wizard
('Wizard', 'Misty Step'),
('Wizard', 'Hold Person'),
('Wizard', 'Scorching Ray'),
('Wizard', 'Shatter'),
('Wizard', 'Mirror Image'),
('Wizard', 'Darkness'),
-- Cleric
('Cleric', 'Lesser Restoration'),
('Cleric', 'Spiritual Weapon'),
-- Druid
('Druid', 'Flaming Sphere'),
('Druid', 'Pass Without Trace'),
('Druid', 'Lesser Restoration'),
-- Ranger
('Ranger', 'Pass Without Trace'),
-- Warlock
('Warlock', 'Darkness'),
('Warlock', 'Hold Person'),
-- Bard
('Bard', 'Hold Person'),
('Bard', 'Shatter'),
('Bard', 'Mirror Image'),
-- =========================
-- LEVEL 3 SPELLS
-- =========================
-- Wizard
('Wizard', 'Fireball'),
('Wizard', 'Counterspell'),
('Wizard', 'Fly'),
('Wizard', 'Dispel Magic'),
('Wizard', 'Lightning Bolt'),
('Wizard', 'Hypnotic Pattern'),
-- Cleric
('Cleric', 'Revivify'),
('Cleric', 'Dispel Magic'),
('Cleric', 'Spirit Guardians'),
-- Druid
('Druid', 'Dispel Magic'),
('Druid', 'Fear'),
-- Bard
('Bard', 'Hypnotic Pattern'),
('Bard', 'Dispel Magic'),
('Bard', 'Fear'),
-- Paladin
('Paladin', 'Revivify'),
-- Warlock
('Warlock', 'Fear');

#Class Spell Selection Test Query 
SELECT cs.ClassName, s.SpellName, s.SpellLevel
FROM ClassSpells cs
JOIN Spells s ON cs.SpellName = s.SpellName
WHERE cs.ClassName = 'Cleric'
ORDER BY s.SpellLevel, s.SpellName;

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

#Populate Weapons 
INSERT INTO Weapons (WeaponName, Distance, DamageType, Properties, DamageDice) VALUES
-- Simple Melee Weapons
('Club', '5 ft', 'Bludgeoning', 'Light', '1d4'),
('Dagger', '5 ft / 20/60 ft', 'Piercing', 'Finesse, Light, Thrown', '1d4'),
('Greatclub', '5 ft', 'Bludgeoning', 'Two-Handed', '1d8'),
('Handaxe', '5 ft / 20/60 ft', 'Slashing', 'Light, Thrown', '1d6'),
('Spear', '5 ft / 20/60 ft', 'Piercing', 'Thrown, Versatile (1d8)', '1d6'),
-- Martial Melee Weapons
('Longsword', '5 ft', 'Slashing', 'Versatile (1d10)', '1d8'),
('Battleaxe', '5 ft', 'Slashing', 'Versatile (1d10)', '1d8'),
('Warhammer', '5 ft', 'Bludgeoning', 'Versatile (1d10)', '1d8'),
('Greataxe', '5 ft', 'Slashing', 'Heavy, Two-Handed', '1d12'),
('Greatsword', '5 ft', 'Slashing', 'Heavy, Two-Handed', '2d6'),
-- Simple Ranged Weapons
('Shortbow', '80/320 ft', 'Piercing', 'Two-Handed', '1d6'),
('Sling', '30/120 ft', 'Bludgeoning', 'Ammunition', '1d4'),
-- Martial Ranged Weapons
('Longbow', '150/600 ft', 'Piercing', 'Heavy, Two-Handed', '1d8'),
('Crossbow, Light', '80/320 ft', 'Piercing', 'Two-Handed, Loading', '1d8'),
('Crossbow, Heavy', '100/400 ft', 'Piercing', 'Heavy, Two-Handed, Loading', '1d10'),
-- Exotic / Flavorful (still SRD-legal)
('Trident', '5 ft / 20/60 ft', 'Piercing', 'Thrown, Versatile (1d8)', '1d6'),
('Halberd', '10 ft', 'Slashing', 'Heavy, Reach, Two-Handed', '1d10'),
('Morningstar', '5 ft', 'Piercing', '—', '1d8'),
('Flail', '5 ft', 'Bludgeoning', '—', '1d8'),
('Maul', '5 ft', 'Bludgeoning', 'Heavy, Two-Handed', '2d6');

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
    BackgroundName VARCHAR(100) PRIMARY KEY,
    BackgroundProficiencies VARCHAR(255),
    Languages VARCHAR(255)
);

#Populate Backgrounds
INSERT INTO Backgrounds (BackgroundName, BackgroundProficiencies, Languages) VALUES
('Acolyte', 'Insight, Religion', 'Two of your choice'),
('Criminal', 'Deception, Stealth', 'Thieves Cant'),
('Folk Hero', 'Animal Handling, Survival', 'One of your choice'),
('Sage', 'Arcana, History', 'Two of your choice'),
('Soldier', 'Athletics, Intimidation', 'One of your choice'),
('Entertainer', 'Acrobatics, Performance', 'One of your choice'),
('Hermit', 'Medicine, Religion', 'One of your choice'),
('Noble', 'History, Persuasion', 'One of your choice'),
('Outlander', 'Athletics, Survival', 'One of your choice'),
('Sailor', 'Athletics, Perception', 'One of your choice'),
('Urchin', 'Sleight of Hand, Stealth', 'One of your choice'),
('Knight', 'History, Persuasion', 'One of your choice'),
('Scout', 'Nature, Survival', 'One of your choice'),
('Mercenary Veteran', 'Athletics, Persuasion', 'One of your choice'),
('Courtier', 'Insight, Persuasion', 'Two of your choice');

#Character implemented Backgrounds
CREATE TABLE CharacterBackground (
    CharID INT,
    BackgroundName VARCHAR(100),
    PRIMARY KEY (CharID, BackgroundName),
    FOREIGN KEY (CharID) REFERENCES PlayerCharacter(CharID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (BackgroundName) REFERENCES Backgrounds(BackgroundName)
        ON DELETE CASCADE ON UPDATE CASCADE
);

#Feats Entity
CREATE TABLE Feats (
    FeatName VARCHAR(100) PRIMARY KEY
);

#Populate Feats
INSERT INTO Feats (FeatName) VALUES
('Alert'),
('Athlete'),
('Durable'),
('Healer'),
('Keen Mind'),
('Observant'),
('Resilient'),
('Savage Attacker'),
('Skilled'),
('Tough');

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
    SpeciesName VARCHAR(100) PRIMARY KEY,
    CreatureType VARCHAR(50),
    Speed INT,
    SpeciesProficiencies VARCHAR(255)
);

#Populate Species
INSERT INTO Species (SpeciesName, CreatureType, Speed, SpeciesProficiencies) VALUES
-- SRD-Legal Races
('Human', 'Humanoid', 30, 'One extra language of choice'),
('Elf', 'Humanoid', 30, 'Perception'),
('Dwarf', 'Humanoid', 25, 'Smithing Tools'),
('Halfling', 'Humanoid', 25, 'Stealth'),
('Dragonborn', 'Humanoid', 30, 'Intimidation'),
('Gnome', 'Humanoid', 25, 'History'),
('Half-Elf', 'Humanoid', 30, 'Two skills of choice'),
('Half-Orc', 'Humanoid', 30, 'Intimidation'),
('Tiefling', 'Humanoid', 30, 'Arcana'),
-- Additional SRD-Compatible / Original Fantasy Races
('Aasimar', 'Humanoid', 30, 'Religion'),
('Orc', 'Humanoid', 30, 'Athletics'),
('Goblin', 'Humanoid', 30, 'Stealth'),
('Hobgoblin', 'Humanoid', 30, 'Martial Training'),
('Kobold', 'Humanoid', 30, 'Stealth'),
('Lizardfolk', 'Humanoid', 30, 'Survival'),
('Tabaxi', 'Humanoid', 30, 'Perception'),
('Triton', 'Humanoid', 30, 'Athletics'),
('Genasi', 'Humanoid', 30, 'Arcana'),
('Firbolg', 'Humanoid', 30, 'Nature'),
('Goliath', 'Humanoid', 30, 'Athletics');

#Character implemented Species
CREATE TABLE CharacterSpecies (
    CharID INT,
    SpeciesName VARCHAR(100),
    PRIMARY KEY (CharID, SpeciesName),
    FOREIGN KEY (CharID) REFERENCES PlayerCharacter(CharID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (SpeciesName) REFERENCES Species(SpeciesName)
        ON DELETE CASCADE ON UPDATE CASCADE
);


