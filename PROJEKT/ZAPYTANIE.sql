-- 1. UZYTKOWNICY
SELECT
    Id,
    Imie,
    Nazwisko,
    Typ,
    CASE Typ
        WHEN 1 THEN 'Admin'
        WHEN 2 THEN 'Ochroniarz'
        WHEN 3 THEN 'Mieszkaniec'
    END AS NazwaTypu
FROM Uzytkownicy;

-- 2. CZUJNIKI
select*from Czujniki;

-- 3. ZGLOSZENIA
SELECT
    z.Id,
    z.Opis,
    u.Imie,
    u.Nazwisko,
    z.Status,
    z.Data
FROM Uzytkownicy u
JOIN Zgloszenia z
    ON z.ZglaszajacyId=u.Id
    

-- 4. LOGI DOSTEPU
SELECT 
    ld.Id,
    ld.Data,
    ld.Status,
    u.Imie,
    u.Nazwisko
FROM LogiDostepu ld
JOIN Uzytkownicy u 
    ON ld.UzytkownikId = u.Id;

-- 5. POKOJE
SELECT 
    p.Id,
    p.Numer,
    p.Pietro,
    u.Imie,
    u.Nazwisko
FROM Pokoje p
JOIN Uzytkownicy u
    ON p.MieszkaniecId=u.Id
