SELECT COALESCE(string_agg(fb, ''), n::text)
FROM generate_series(1, 100) n
LEFT JOIN (VALUES (3, 'Fizz'), (5, 'Buzz')) t(m, fb) ON n % m = 0
GROUP BY n
ORDER BY n
