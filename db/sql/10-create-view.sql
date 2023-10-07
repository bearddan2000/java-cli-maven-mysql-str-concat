CREATE VIEW `animal`.dog_final AS
WITH RECURSIVE CTE_Id (id) AS
(
  SELECT 1
  union all
  SELECT id+1
  from CTE_Id
  where id < 4
), CTE_Color (id, val) AS
(
  SELECT a.breedId, GROUP_CONCAT(b.color) 
  FROM animal.dog AS a
  JOIN animal.colorLookup AS b ON b.id = a.colorId
  GROUP BY a.breedId
)

SELECT b.id, b.breed as 'Breed',
COUNT(*) as 'Breed Count', d.val as 'Color'
FROM CTE_Id AS a
JOIN animal.breedLookup AS b ON b.id = a.id
RIGHT JOIN animal.dog AS c ON c.breedId = a.id
JOIN CTE_Color AS d ON c.breedId = d.id
GROUP BY c.breedId;
