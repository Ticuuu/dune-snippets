WITH n AS (
SELECT '\x095ea7b3' as hash, 'approve' as name 
UNION
SELECT '\xa457c2d7' as hash, 'decreaseAllowance' as name 
UNION
SELECT '\xb6b55f25' as hash, 'deposit' as name 
UNION
SELECT '\xd389800f' as hash, 'earn' as name 
UNION
SELECT '\x39509351' as hash, 'increaseAllowance' as name 
UNION
SELECT '\x92eefe9b' as hash, 'setController' as name 
UNION
SELECT '\xab033ea9' as hash, 'setGovernance' as name 
UNION
SELECT '\x45dc3dd8' as hash, 'setMin' as name 
UNION
SELECT '\xa9059cbb' as hash, 'transfer' as name 
UNION
SELECT '\x23b872dd' as hash, 'transferFrom' as name 
UNION
SELECT '\x2e1a7d4d' as hash, 'withdraw' as name 

), p AS (
    SELECT price, minute FROM prices.layer1_usd WHERE symbol='ETH'
)

SELECT date_trunc('day', block_time) AS time, name, count(*) as count, 
       count(nullif(success = false, true)) as success,
       count(nullif(success = true, true)) as failure,
       count(nullif(success = true, true)) * 100 / count(*)  as "failure rate (%)",
       ROUND(avg(gas_price) / power(10, 9)::numeric, 3)  as "avg gas price(gwei)", 
       ROUND(avg(gas_used)::numeric, 3) as "avg gas used",
       ROUND(avg(gas_spent)::numeric, 3) as "avg gas spent(USD)",
       ROUND(max(gas_spent)::numeric, 3) as "max gas spent(USD)"
FROM (
SELECT l.block_time, l.hash, n.name, success, gas_price,	gas_used, gas_spent FROM (
    SELECT block_time, cast(substring(data for 4) as text) as hash, success, gas_price,	gas_used, (gas_price * gas_used / power(10, 18) * p.price) 
    as gas_spent FROM ethereum.transactions AS t
    LEFT JOIN p ON p.minute = date_trunc('minute', t.block_time)
    WHERE "to" IN (
        '\x5dbcf33d8c2e976c6b560249878e6f1491bca25c'
    )
) as l INNER JOIN n ON l.hash = n.hash
) as r group by 1,2

