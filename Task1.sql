
--all day average based on crm events
SELECT `Submitted via`,  COUNT(*),
ROUND(AVG(DATEDIFF(`Date sent to company`, `Date received`)),0) AS DAY_AVG
FROM `crm_events` GROUP BY `Submitted via`

--by phone
SELECT e.`Complaint ID`, e.`Date received` , e.`Submitted via`, e.Product, c.ser_time
FROM crm_events e, crm_call_center_logs c
WHERE e.`Complaint ID`=c.`Complaint ID`
AND e.`Company response to consumer` LIKE 'close%';

SELECT Product, COUNT(Product) AS count_product,
AVG(cast(substring(ser_time,1,2) AS int)*60+
       cast(substring(ser_time,4,2) AS int)+ 
       cast(substring(ser_time,7,2) AS int)/60.0) 
       AS MIN_AVG
    FROM `taks_1` GROUP BY Product;