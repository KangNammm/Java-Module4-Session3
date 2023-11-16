create table Customer(
cID int primary key auto_increment,
Name varchar(25),
cAge tinyint);

create table Orders(
oID int primary key auto_increment,
cID int,
foreign key (cID) references Customer (cID),
oDate datetime,
oTotalPrice int);

create table Product(
pID int primary key auto_increment,
pName varchar(25),
pPrice int);

create table OrderDetail(
oID int,
foreign key (oID) references Orders (oID),
pID int,
foreign key (pID)references Product (pID),
primary key (oID,pID),
odQTY int);

insert into Customer values (1,'Minh Quan',10);
insert into Customer values (2,'Ngoc Oanh',20);
insert into Customer values (3,'Hong Ha',50);

insert into Orders values (1,1,'2006-3-21',null);
insert into Orders values (2,2,'2006-3-23',null);
insert into Orders values (3,1,'2006-3-16',null);

insert into Product values (1,'May Giat',3);
insert into Product values (2,'Tu Lanh',5);
insert into Product values (3,'Dieu Hoa',7);
insert into Product values (4,'Quat',1);
insert into Product values (5,'Bep Dien',2);

insert into OrderDetail values(1,1,3);
insert into OrderDetail values(1,3,7);
insert into OrderDetail values(1,4,2);
insert into OrderDetail values(2,1,1);
insert into OrderDetail values(3,1,8);
insert into OrderDetail values(2,5,4);
insert into OrderDetail values(2,3,3);

-- Hiển thị các thông tin gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order-- 
select oID,oDate,oTotalPrice from Orders;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.cID, c.Name,p.pID,p.pName from orders o
join Customer c on o.cID=c.cID
join OrderDetail ord on o.oID=ord.oID
join Product p on ord.pID=p.pID;  

-- select c.cID, c.Name,p.pID, p.pName from Customer c
-- join orders o on c.cID=o.cID
-- join orderdetail od on o.oID=od.oID
-- join product p on od.oID=p.pID;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c.cID,c.Name,o.oDate from customer c 
left join orders o on c.cID=o.cID
where o.oDate is null;

--  Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
--  (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn.
--  Giá bán của từng loại được tính = odQTY*pPrice)
select o.oID, o.oDate, sum(odQTY*pPrice) from orders o
join orderdetail od on o.oID=od.oID
join product p on od.oID=p.pIDcategory
group by o.oID,o.oDate;