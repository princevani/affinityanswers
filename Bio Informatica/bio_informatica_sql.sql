# Selecting the required Database
use Rfam;

# ---------- Sol : 1 ----------

# Biological Name for tiger is : 'panthera tigris'
#1.1 Types of tiger species ('Panthera tigris') found in taxonomy table is >>

SELECT DISTINCT species AS 'Types of Tiger Species'
FROM taxonomy
WHERE species LIKE 'panthera tigris%';

#1.2 Total types of tiger species ('Panthera tigris') found in taxonomy table is >>

SELECT COUNT(DISTINCT species) AS 'Count of Tiger Species'
FROM taxonomy
WHERE species LIKE 'panthera tigris%';

#1.3 NCBI ID of Sumatran tiger('Panthera tigris sumatrae') is >>

SELECT ncbi_id, species as 'Tiger Species'
FROM taxonomy
WHERE species LIKE '%panthera tigris sumatrae%';

# ---------- Sol : 2 ---------
-- Alternetly using describe <table_name> we can find the columns that can be used to connect tables, example:

SELECT 
    TABLE_NAME, 
    COLUMN_NAME, 
    CONSTRAINT_NAME, 
    REFERENCED_TABLE_NAME, 
    REFERENCED_COLUMN_NAME
FROM 
    INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE 
    REFERENCED_TABLE_NAME IS NOT NULL
    AND TABLE_SCHEMA = 'Rfam';

# ---------- Sol : 3 ---------

# Biological Name for rice is : 'oryza sativa'

SELECT taxonomy.species as 'Rice Species', MAX(rfamseq.length) AS max_len
FROM taxonomy
JOIN rfamseq ON taxonomy.ncbi_id = rfamseq.ncbi_id
WHERE taxonomy.species LIKE '%oryza sativa%'
GROUP BY taxonomy.species
ORDER BY max_len DESC
LIMIT 1;

# ---------- Sol : 4 ---------

SELECT family.rfam_acc as 'Family Accession Id', family.rfam_id as 'Family Name', MAX(rfamseq.length) AS 'max_len'
FROM family
JOIN full_region ON family.rfam_acc = full_region.rfam_acc
JOIN rfamseq ON full_region.rfamseq_acc = rfamseq.rfamseq_acc
WHERE rfamseq.length > 1000000
GROUP BY family.rfam_acc, family.rfam_id
ORDER BY max_len DESC
LIMIT 120, 15; -- offset (9-1)*15=120, limit 15
