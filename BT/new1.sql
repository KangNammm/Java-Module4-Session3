create table OrderDetail(
order_id int,
foreign key (order_id) references orders(id),
product_id int,
foreign key (product_id) references product(id),
primary key(order_id,product_id),
quantity int,
price float);

select o.id,c.name,o.created,o.status
from orders o
join customer c on c.id=o.cusid;

SELECT o.id,p.name,od.quantity,od.price,od.price*od.quantity AS TotalPrice
FROM orders o
JOIN orderdetail od ON o.id=od.order_id
JOIN product p ON p.id=od.product_id;


