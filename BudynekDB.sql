CREATE DATABASE BudynekDB;
GO

USE BudynekDB;
GO

-- ----------------------------------------
-- 1. Tabela Uzytkownicy
-- ----------------------------------------
CREATE TABLE Uzytkownicy
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Imie NVARCHAR(50) NOT NULL,
    Nazwisko NVARCHAR(50) NOT NULL,
    Typ INT NOT NULL,          -- 1=Admin, 2=Ochroniarz, 3=Mieszkaniec
    Aktywny BIT NOT NULL DEFAULT 1
);
GO

-- ----------------------------------------
-- 2. Tabela Czujniki
-- ----------------------------------------
CREATE TABLE Czujniki
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Typ NVARCHAR(50) NOT NULL,          
    Lokalizacja NVARCHAR(100) NOT NULL  
);
GO

-- ----------------------------------------
-- 3. Tabela Zgloszenia
-- ----------------------------------------
CREATE TABLE Zgloszenia
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Opis NVARCHAR(MAX) NOT NULL,
    ZglaszajacyId INT NOT NULL,
    Status NVARCHAR(20) NOT NULL DEFAULT 'Otwarte',
    Data DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_Zgloszenia_Uzytkownicy FOREIGN KEY (ZglaszajacyId) REFERENCES Uzytkownicy(Id)
);
GO

-- ----------------------------------------
-- 4. Tabela LogiDostepu
-- ----------------------------------------
CREATE TABLE LogiDostepu
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    UzytkownikId INT NOT NULL,
    Data DATETIME NOT NULL DEFAULT GETDATE(),
    Status NVARCHAR(20) NOT NULL, -- "Wejscie" / "Wyjœcie"
    CONSTRAINT FK_LogiDostepu_Uzytkownicy FOREIGN KEY (UzytkownikId) REFERENCES Uzytkownicy(Id)
);
GO

-- ----------------------------------------
-- 5. Tabela Pokoje
-- ----------------------------------------
CREATE TABLE Pokoje
(
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Numer NVARCHAR(20) NOT NULL,
    Pietro INT NOT NULL,
    MieszkaniecId INT NULL,
    CONSTRAINT FK_Pokoje_Uzytkownicy FOREIGN KEY (MieszkaniecId) REFERENCES Uzytkownicy(Id)
);
GO

-- ----------------------------------------
-- Przyk³adowi u¿ytkownicy
-- ----------------------------------------
INSERT INTO Uzytkownicy (Imie, Nazwisko, Typ) VALUES ('Admin', 'Glowne', 1);
INSERT INTO Uzytkownicy (Imie, Nazwisko, Typ) VALUES ('Jan', 'Ochrona', 2);
INSERT INTO Uzytkownicy (Imie, Nazwisko, Typ) VALUES ('Adam', 'Nowak', 3);
GO
