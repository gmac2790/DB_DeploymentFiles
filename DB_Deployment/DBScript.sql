CREATE DATABASE DBManagementTest
GO;

USE DBManagementTest
GO;

if not exists(select 1 from sysobject where name = User and xtype = <U>)
BEGIN
CREATE TABLE Users(
    Id int,
    FirstName nvarchar(255),
    LastName nvarchar(255)    
);
END
GO;

if not exists(select 1 from sysobject where name = Venue and xtype = <U>)
BEGIN
CREATE TABLE Venue(
    Id int,
    Name nvarchar(255),
    Address nvarchar(255)
);
END
GO;

if not exists(select 1 from sysobject where name = Subspace and xtype = <U>)
BEGIN
CREATE TABLE Subspace(
    Id int,
    VenueId int,
    Name nvarchar(255)
);
END
GO;

