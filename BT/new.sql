-- dem so san pham
select count(*)from product;

-- dem tong tien
select sum(price*quantity) from orderdetail;

-- lay ra danh sach danh muc gom: id, name, total_product
select c.*,count(*) as total_product 
from category c
join product p
on c.id=p.catid
group by c.id;

select c.*,p.price 
from category c
join product p
on c.id=p.catid;
-- group by c.name; 
