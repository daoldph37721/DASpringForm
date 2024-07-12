CREATE DATABASE j5_shop

use j5_shop

CREATE TABLE Category (
    id varchar(100) PRIMARY KEY,
    name NVARCHAR (100) NOT NULL
);

CREATE TABLE Product (
    id INT PRIMARY KEY IDENTITY (1, 1),
    name NVARCHAR (100) NOT NULL,
    image NVARCHAR(100),
    price float,
    Categoryid VARCHAR(100) NOT NULL,
    Createdate DATE NOT NULL,
    available tinyint,
    FOREIGN KEY (Categoryid) REFERENCES Category(id)
);

CREATE TABLE Account(
    username varchar(100) PRIMARY KEY,
    password nvarchar(100) NOT NULL,
    fullname nvarchar(100) NOT NULL,
    email nvarchar(100) NOT NULL,
    photo nvarchar(500),
    activated tinyint,
    admin tinyint
);

create table Orders(
    id BIGINT PRIMARY KEY IDENTITY (1, 1),
    address NVARCHAR (100),
    Createdate DATE NOT NULL,
    Username varchar(100),
    FOREIGN KEY (Username) REFERENCES Account(username)
);

create table OrderDetail(
    id BIGINT PRIMARY KEY IDENTITY (1, 1),
    price float,
    quantity int,
    Productid INT NOT NULL,
    Orderid BIGINT NOT NULL,
    FOREIGN KEY (Productid) REFERENCES Product(id),
    FOREIGN KEY (Orderid) REFERENCES Orders(id)
);