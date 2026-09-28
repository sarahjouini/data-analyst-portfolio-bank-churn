-- Tasso di abbandono complessivo
SELECT 
    Attrition_Flag,
    COUNT(*) AS numero_clienti,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM bank_churners_clean) AS percentuale
FROM bank_churners_clean
GROUP BY Attrition_Flag;

-- Confronto transazioni e relazioni bancarie tra clienti rimasti e clienti abbandonati
SELECT 
    Attrition_Flag,
    AVG(CAST(Total_Trans_Ct AS FLOAT)) AS media_transazioni,
    AVG(CAST(Total_Relationship_Count AS FLOAT)) AS media_relazioni
FROM bank_churners_clean
GROUP BY Attrition_Flag;

-- Tasso di abbandono per fascia di reddito
SELECT 
    Income_Category,
    COUNT(*) AS totale_clienti,
    SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) AS clienti_abbandonati,
    SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS tasso_abbandono_percentuale
FROM bank_churners_clean
GROUP BY Income_Category
ORDER BY tasso_abbandono_percentuale DESC;