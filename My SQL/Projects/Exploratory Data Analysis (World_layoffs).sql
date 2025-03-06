-- Exploratory Data Analysis 

SELECT * 
FROM layoffs_staging2;

SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;


SELECT stage, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC;

SELECT industry, SUM(percentage_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;

SELECT funds_raised, company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY funds_raised, company
ORDER BY 1 DESC;

SELECT year(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY year(`date`)
ORDER BY 1 DESC;

WITH Least_layoffs AS (
SELECT company, total_laid_off
FROM layoffs_staging2
WHERE total_laid_off < 20
AND  total_laid_off <> ''
ORDER BY 2 DESC
)

SELECT * FROM Least_layoffs; 

WITH Most_layoffs AS (
SELECT company, total_laid_off
FROM layoffs_staging2
WHERE total_laid_off >= 1000
AND  total_laid_off <> ''
ORDER BY 2 DESC
)
SELECT * FROM Most_layoffs; 

SELECT  date, company,  total_laid_off,
    SUM(total_laid_off) OVER (PARTITION BY company ORDER BY date) AS rolling_total
FROM layoffs_staging2;

SELECT company, YEAR(date) AS year, total_laid_off,
    DENSE_RANK() OVER (PARTITION BY company, YEAR(date)  
        ORDER BY total_laid_off       
    ) AS dense_rank_position
FROM layoffs_staging2
WHERE total_laid_off <> '';              



