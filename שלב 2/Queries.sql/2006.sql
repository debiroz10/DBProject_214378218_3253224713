SELECT *
FROM Invitation
WHERE Datte >=to_date('01/01/2006','dd/mm/yyyy') AND Datte < to_date('01/01/2007','dd/mm/yyyy');
