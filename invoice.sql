use dinars_invoice;

-- 1. list of invoices which are fully paid ?
select * from invoice where is_estimate = 0 and payment_status = "paid";

-- 2. show the list of not fully paid where company_id = 1 and cust_id = 1 ?
select * from invoice where company_id = 1 and customer_id = 1 and (payment_status = "unpaid" or payment_status = "partial");
select * from invoice where company_id = 1 and customer_id = 1 and payment_status in ("unpaid","partial");

-- 3. select invoice_id,sum(amount) from invoice_item and left join with invoice and total column from it ?
select it.invoice_id, sum(it.amount) as subtotal_item, i.subtotal from invoice_item it left join invoice i on i.id=it.invoice_id group by it.invoice_id;


-- 4.select invoice_id,count the total number and then sum of amount from invice payment table ?
select invoice_id,count(*) as count,sum(amount) as total from invoice_payment group by invoice_id

-- 5.which product has sold how much number of time in invoice_item table ?
select item,count(*) from invoice_item group by item

-- 6.top 5 product name and order by its price ?
select name,price from product order by price desc limit 5