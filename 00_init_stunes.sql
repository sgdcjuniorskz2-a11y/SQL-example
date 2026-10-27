-- 1. Таблица исполнителей (artists)
CREATE TABLE artists (
    ArtistId INT PRIMARY KEY,
    Name VARCHAR(120) NOT NULL
);

-- 2. Таблица альбомов (albums) - связана с artists через ArtistId
CREATE TABLE albums (
    AlbumId INT PRIMARY KEY,
    Title VARCHAR(160) NOT NULL,
    ArtistId INT REFERENCES artists(ArtistId)
);

-- 3. Таблица треков (tracks) - связана с albums через AlbumId
CREATE TABLE tracks (
    TrackId INT PRIMARY KEY,
    Name VARCHAR(200) NOT NULL,
    AlbumId INT REFERENCES albums(AlbumId),
    Composer VARCHAR(220),
    Milliseconds INT,
    UnitPrice NUMERIC(10, 2)
);

-- 4. Таблица сотрудников (employees)
CREATE TABLE employees (
    EmployeeId INT PRIMARY KEY,
    LastName VARCHAR(20) NOT NULL,
    FirstName VARCHAR(20) NOT NULL,
    Title VARCHAR(30),
    BirthDate TIMESTAMP,
    HireDate TIMESTAMP
);

-- 5. Таблица клиентов (customers) - связана с employees через SupportRepId
CREATE TABLE customers (
    CustomerId INT PRIMARY KEY,
    FirstName VARCHAR(40) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Company VARCHAR(80),
    Address VARCHAR(70),
    City VARCHAR(40),
    State VARCHAR(40),
    Country VARCHAR(40),
    PostalCode VARCHAR(10),
    Phone VARCHAR(24),
    Email VARCHAR(60) NOT NULL,
    SupportRepId INT REFERENCES employees(EmployeeId)
);

-- 6. Таблица счетов/заказов (invoices) - связана с customers через CustomerId
CREATE TABLE invoices (
    InvoiceId INT PRIMARY KEY,
    CustomerId INT REFERENCES customers(CustomerId),
    InvoiceDate TIMESTAMP NOT NULL,
    BillingAddress VARCHAR(70),
    BillingCity VARCHAR(40),
    BillingState VARCHAR(40),
    BillingCountry VARCHAR(40),
    BillingPostalCode VARCHAR(10),
    Total NUMERIC(10, 2) NOT NULL
);

-- Наполняем данными из книги sTunes
INSERT INTO artists (ArtistId, Name) VALUES
(1, 'AC/DC'), (2, 'Accept'), (3, 'Aerosmith'), (25, 'João Gilberto'), (27, 'Gilberto Gil');

INSERT INTO albums (AlbumId, Title, ArtistId) VALUES
(1, 'For Those About To Rock We Salute You', 1),
(2, 'Balls to the Wall', 2),
(3, 'Restless and Wild', 2),
(4, 'Let There Be Rock', 1),
(5, 'Big Ones', 3);

INSERT INTO tracks (TrackId, Name, AlbumId, Composer, Milliseconds, UnitPrice) VALUES
(1, 'For Those About To Rock (We Salute You)', 1, 'Angus Young, Malcolm Young, Brian Johnson', 343719, 0.99),
(2, 'Balls to the Wall', 2, NULL, 342562, 0.99),
(3, 'Fast As a Shark', 3, 'F. Baltes, S. Kaufman, U. Dirkscneider & W. Hoffman', 230619, 0.99),
(3165, 'The Brig', NULL, NULL, 2617325, 1.99);

INSERT INTO employees (EmployeeId, LastName, FirstName, Title, BirthDate, HireDate) VALUES
(3, 'Peacock', 'Jane', 'Sales Support Agent', '1973-08-29 00:00:00', '2002-04-01 00:00:00'),
(4, 'Park', 'Margaret', 'Sales Support Agent', '1947-09-19 00:00:00', '2003-05-03 00:00:00'),
(5, 'Johnson', 'Steve', 'Sales Support Agent', '1965-03-03 00:00:00', '2003-10-17 00:00:00');

INSERT INTO customers (CustomerId, FirstName, LastName, Company, Address, City, State, Country, PostalCode, Phone, Email, SupportRepId) VALUES
(1, 'Luís', 'Gonçalves', 'Embraer', 'Av. Brigadeiro Faria Lima, 2170', 'São José dos Campos', 'SP', 'Brazil', '12227-000', '+55 (12) 3923-5555', 'luisg@embraer.com.br', 3),
(2, 'Leonie', 'Köhler', NULL, 'Theodor-Heuss-Straße 34', 'Stuttgart', NULL, 'Germany', '70174', '+49 0711 2842222', 'leonekohler@surfeu.de', 5),
(4, 'Bjørn', 'Hansen', NULL, 'Ullevålsveien 14', 'Oslo', NULL, 'Norway', '0171', '+47 22 44 22 22', 'bjorn.hansen@yahoo.no', 4),
(6, 'Helena', 'Holý', NULL, 'Rilská 3174/6', 'Prague', NULL, 'Czech Republic', '14300', '+420 2 4177 0449', 'hholy@gmail.com', 5),
(8, 'Daan', 'Peeters', NULL, 'Grétrystraat 63', 'Brussels', NULL, 'Belgium', '1000', '+32 02 219 03 03', 'daan_peeters@apple.be', 4),
(16, 'Frank', 'Harris', 'Google Inc.', '1600 Amphitheatre Parkway', 'Mountain View', 'CA', 'USA', '94043-1351', '+1 (650) 253-0000', 'fharris@google.com', 4),
(23, 'John', 'Gordon', NULL, '69 Salem Street', 'Boston', 'MA', 'USA', '2113', '+1 (617) 523-0000', 'jgordon@yahoo.com', 4);

INSERT INTO invoices (InvoiceId, CustomerId, InvoiceDate, BillingAddress, BillingCity, BillingState, BillingCountry, BillingPostalCode, Total) VALUES
(1, 2, '2009-01-01 00:00:00', 'Theodor-Heuss-Straße 34', 'Stuttgart', NULL, 'Germany', '70174', 1.98),
(2, 4, '2009-01-02 00:00:00', 'Ullevålsveien 14', 'Oslo', NULL, 'Norway', '0171', 3.96),
(3, 8, '2009-01-03 00:00:00', 'Grétrystraat 63', 'Brussels', NULL, 'Belgium', '1000', 5.94),
(5, 23, '2009-01-11 00:00:00', '69 Salem Street', 'Boston', 'MA', 'USA', '2113', 13.86),
(98, 1, '2010-03-11 00:00:00', 'Av. Brigadeiro Faria Lima, 2170', 'São José dos Campos', 'SP', 'Brazil', '12227-000', 3.98),
(404, 6, '2013-11-13 00:00:00', 'Rilská 3174/6', 'Prague', NULL, 'Czech Republic', '14300', 25.86);
