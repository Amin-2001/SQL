-- Data Cleaning to remove duplicates, standardize the data, Null vaules & remove columns

SELECT *
FROM layoffs;

CREATE TABLE layoffs_staging
LIKE layoffs; 

SELECT *
FROM layoffs_staging;

INSERT layoffs_staging
SELECT *
FROM layoffs; 

SELECT *,
	ROW_NUMBER() OVER
    (PARTITION BY company, industry, 
    total_laid_off, percentage_laid_off, `date`, stage, country, 
    funds_raised) AS row_num 
FROM layoffs_staging;

WITH duplicate_cte AS
(
SELECT *,
	ROW_NUMBER() OVER(PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised) AS row_num 
FROM layoffs_staging
)



SELECT *
FROM layoffs_staging
WHERE company = 'Oda'; 

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` text,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised` double DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *
FROM layoffs_staging2
WHERE row_num > 1;

DELETE 
FROM layoffs_staging2
WHERE row_num > 1;

INSERT INTO layoffs_staging2
SELECT *,
	ROW_NUMBER() OVER
    (PARTITION BY company, industry, 
    total_laid_off, percentage_laid_off, `date`, stage, country, 
    funds_raised) AS row_num 
FROM layoffs_staging;

-- Disabling safe mode to delete with '0' turning it back on with '1'

SET SQL_SAFE_UPDATES = 1;

-- Standardizing data 

SELECT company, TRIM(company) 
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET company = TRIM(company); 

SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY 1;

SELECT DISTINCT country
FROM layoffs_staging2
ORDER BY 1;

SELECT date
FROM layoffs_staging2
;

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE; 

UPDATE layoffs_staging2
SET industry = 'Business/Productivity Software'
WHERE industry = 'Industry';

SELECT *
FROM layoffs_staging2
WHERE company = 'Appsmith'
;

SELECT *
FROM layoffs_staging2
WHERE total_laid_off = ''
AND percentage_laid_off = '';

DELETE
FROM layoffs_staging2
WHERE total_laid_off = ''
AND percentage_laid_off = '';

SELECT *
FROM layoffs_staging2;

ALTER TABLE layoffs_staging2
DROP column row_num; 


