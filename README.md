# Dungeons & Dragons Character Builder Database System

Python • Spring Boot • MySQL • Full-Stack Web Application

---

## Overview

This is a full-stack database-driven application for creating, managing, and validating *Dungeons & Dragons 5e* characters using a structured relational database and a Spring Boot backend architecture.

Users can build complete D&D character profiles by selecting attributes such as class, species, background, spells, weapons, and feats. The system enforces relational integrity and ensures all data follows normalized database design principles, including proper handling of many-to-many relationships.

---

## Key Features

- Create, update, and delete D&D characters
- Assign classes, species, backgrounds, feats, weapons, and spells
- Enforce rule-based relationships (e.g., class-specific spell restrictions)
- Fully normalized relational database design
- Dynamic web interface using Spring Boot and Thymeleaf
- Role-based system design (Player, Dungeon Master, Admin)

---

## System Architecture

### Technologies Used

- Spring Boot (MVC architecture, routing, dependency injection)
- Java (JDK 17/21)
- MySQL (Relational database management system)
- MAMP (Local MySQL server environment)
- Thymeleaf (Server-side HTML rendering)
- Maven (Build and dependency management)
- IntelliJ IDEA (Development environment)
- GitHub (Version control and collaboration)

---

## Database Design

The system is built around a normalized relational schema with strong emphasis on many-to-many relationships.

### Core Entities

- Character  
- Classes  
- Species  
- Backgrounds  
- Spells  
- Weapons  
- Feats  

### Example Schema Structure

- Character(CharID, CharName, CharLevel, STR, CON, DEX, WIS, INT, CHA, MaxHP)  
- Classes(ClassName, PrimaryStat1, PrimaryStat2, HitDie)  
- Spells(SpellName, SpellLevel, CastingTime, School, Duration, Range, Components, IsRitual)  

### Relationship Tables

- CharacterClasses(CharID, ClassName)  
- CharacterSpellsPrepared(CharID, SpellName)  
- CharacterWeapons(CharID, WeaponName)  
- CharacterFeats(CharID, FeatName)  
- CharacterSpecies(CharID, SpeciesName)  
- CharacterBackground(CharID, BackgroundName)  
